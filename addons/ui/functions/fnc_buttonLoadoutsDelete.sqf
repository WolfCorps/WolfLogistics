#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Alganthe, Dedmen
 * Deletes selected preset.
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

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSelRow = lnbCurSelRow _contentPanelCtrl;

private _oldLoadoutName = _contentPanelCtrl lnbText [_curSelRow, 1];
private _curSelLoadout = _contentPanelCtrl getVariable _oldLoadoutName;

// Remove
["wolf_logistics_deletePreset", _oldLoadoutName] call CBA_fnc_globalEvent;
_contentPanelCtrl setVariable [_oldLoadoutName, nil];
_contentPanelCtrl lnbDeleteRow _curSelRow;

[_display, _contentPanelCtrl, lnbCurSelRow _contentPanelCtrl] call FUNC(onSelChangedLoadouts); // deleting second last row, doesn't trigger selChanged event in Arma, game bug?

"Paket wurde gelöscht!" call CBA_fnc_notify;
