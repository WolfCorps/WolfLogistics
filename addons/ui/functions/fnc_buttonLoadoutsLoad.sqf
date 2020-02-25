#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Dedmen
 * Pack choosen preset into current box
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
private _curSel = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_curSel, 1];

private _loadout = _contentPanelCtrl getVariable _loadoutName;

[GVAR(center), _loadout] call wolf_logistics_main_fnc_fillPresetIntoBox;

"Loadout wurde in Kiste gepackt" call CBA_fnc_notify;