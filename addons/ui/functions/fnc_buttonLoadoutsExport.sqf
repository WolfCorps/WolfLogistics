#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Dedmen
 * Export current loadout in box
 *
 * Arguments:
 * 3: Whether to use box contents, otherwise its selected loadout <bool>
 *
 * Return Value:
 * None
 *
 * Public: No
*/


params ["_display", "_control", "_boxContents"];

if !(ctrlEnabled _control) exitWith {};

if (_boxContents) exitWith {
	copyToClipboard str ([GVAR(center), "new Preset", "This is a preset"] call wolf_logistics_main_fnc_createPresetFromBox);
};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSel = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_curSel, 1];
private _loadout = _contentPanelCtrl getVariable _loadoutName;

forceUnicode 1;
copyToClipboard str (_loadout);
