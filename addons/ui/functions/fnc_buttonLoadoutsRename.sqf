#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Dedmen
 * Renames selected preset.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Button control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

private _editBoxCtrl = _display displayCtrl IDC_textLoadoutName;
private _newLoadoutName = ctrlText _editBoxCtrl;

if (_newLoadoutName == "") exitWith {
    "Kann nicht mit leerem Namen speichern" call CBA_fnc_notify;
};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSelRow = lnbCurSelRow _contentPanelCtrl;

private _oldLoadoutName = _contentPanelCtrl lnbText [_curSelRow, 1];
private _curSelLoadout = _contentPanelCtrl getVariable _oldLoadoutName;

// Remove
["wolf_logistics_deletePreset", _oldLoadoutName] call CBA_fnc_globalEvent;
_contentPanelCtrl setVariable [_oldLoadoutName, nil];

 // Rename
_curSelLoadout set [0, _newLoadoutName];
_contentPanelCtrl lnbSetText [[_curSelRow, 1], _newLoadoutName];

// Add
["wolf_logistics_newPreset", _curSelLoadout] call CBA_fnc_globalEvent;
_contentPanelCtrl setVariable [_newLoadoutName, _curSelLoadout];


_contentPanelCtrl lnbSort [1, false];

// Select newly saved loadout
for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
    if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
};

"Paket wurde umbenannt  " call CBA_fnc_notify;
