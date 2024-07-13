#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Alganthe, Dedmen
 * Save selected preset to server as temporary.
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
private _editBoxContent = ctrlText _editBoxCtrl;

if (_editBoxContent == "") exitWith {
    "Kann nicht mit leerem Namen speichern" call CBA_fnc_notify;
};

private _data = GVAR(presets);
private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _cursSelRow = lnbCurSelRow _contentPanelCtrl;

private _loadoutName = _contentPanelCtrl lnbText [_cursSelRow, 1];
private _curSelLoadout = (_contentPanelCtrl getVariable _loadoutName) select 0;
private _loadout =  [GVAR(center), _editBoxContent, "Dies ist ein Temporäres Paket"] call wolf_logistics_main_fnc_createPresetFromBox;


//private _loadoutIndex = _data findIf {(_x select 0) == _editBoxContent};

["wolf_logistics_newPreset", _loadout] call CBA_fnc_globalEvent;

// Delete "old" loadout row if we replaced one with same name
for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
    if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbDeleteRow _i};
};

private _newRow = _contentPanelCtrl lnbAddRow ["",_editBoxContent];


_contentPanelCtrl setVariable [_editBoxContent, _loadout];

_contentPanelCtrl lnbSort [1, false];

// Select newly saved loadout
for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
    if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
};

"Paket wurde Temporär gespeichert" call CBA_fnc_notify;
