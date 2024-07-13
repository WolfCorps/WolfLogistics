#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Dedmen
 * Export current loadout in box
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Public: No
*/


params ["_display", "_control", "_boxContents"];

if !(ctrlEnabled _control) exitWith {};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;

forceUnicode 1;
private _loadout = parseSimpleArray copyFromClipboard; // This doesn't work in multiplayer

if (count _loadout != 3) exitWith {
	"Paket format inkorrekt" call CBA_fnc_notify;
};

["wolf_logistics_newPreset", _loadout] call CBA_fnc_globalEvent;

private _loadoutName = _loadout select 0;



// Delete "old" loadout row if we replaced one with same name
for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
    if ((_contentPanelCtrl lnbText [_i, 1]) == _loadoutName) exitwith {_contentPanelCtrl lnbDeleteRow _i};
};

private _newRow = _contentPanelCtrl lnbAddRow ["", _loadoutName];
_contentPanelCtrl setVariable [_loadoutName, _loadout];
_contentPanelCtrl lnbSort [1, false];

// Select newly imported loadout
for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
    if ((_contentPanelCtrl lnbText [_i, 1]) == _loadoutName) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
};