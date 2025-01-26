#include "script_component.hpp"
/*
 * Author: dedmen
 * Creates a box inside 3DEN, with the contents set from a preset
 *
 * Arguments:
 * 0: Box Classname <STRING>
 * 1: Box Position ATL <ARRAY>
 * 2: Box Preset <ARRAY>
 *
 * Return Value:
 * Created box <EDEN ENTITY>
 *
 * Example:
 * ["Box_NATO_Equip_F", [0, 0, 0], _myPreset] call wolf_logistics_main_fnc_3denCreateFilledBox
 *
 * Public: No
 */

params ["_boxClass", "_boxPos", "_preset"];

private _edenEnt = create3DENEntity ["Object", _boxClass, _boxPos, true]; 


clearMagazineCargo _edenEnt;
clearBackpackCargo _edenEnt;
clearItemCargo _edenEnt;
clearWeaponCargo _edenEnt;

// We hack edit the preset, we cannot store container contents, so we put them directly into the box 

private _preset = +_preset;
_preset params ["_presetName","_presetDescription","_presetContents"];

{
    if (count _x > 2 && (_x select 1) isEqualType []) then { //Container
		// [backpackName, contentPreset, ignoredFakeValue]
		
		
		// We force the container content preset to be empty, and move all items items into the main preset 
		private _containerContents = _x select 1 select 2;

		(_x select 1) set [2, []]; // Container is now empty

		_presetContents append _containerContents;
    }
} forEach _presetContents;

[_edenEnt, _preset] call wolf_logistics_main_fnc_fillPresetIntoBox; 

// Store it into "ammoBox" attribute

private _cargo = [getWeaponCargo _edenEnt, getMagazineCargo _edenEnt, getItemCargo _edenEnt, getBackpackCargo _edenEnt];

RscAttributeInventory_cargo = [[],[]];
{
  RscAttributeInventory_cargo set [0, (RscAttributeInventory_cargo select 0) + (_x select 0)];
  RscAttributeInventory_cargo set [1, (RscAttributeInventory_cargo select 1) + (_x select 1)];
} foreach _cargo;

uiNamespace setVariable ["RscAttributeInventory_cargo", RscAttributeInventory_cargo];
uiNamespace setVariable ["AmmoBox_type", 0];

private _attrib = ['attributeSave',nil] call (uinamespace getvariable 'AmmoBox_script');

// We need to delay the setting, it doesn't save if we do it immediately.
// More precisely we need to wait for Eden to run, which it doesn't in debug console.
[_edenEnt, _attrib] spawn {
	_this params ["_edenEnt", "_attrib"];
	private _curTime = time;
	waitUntil {time > _curTime+1};

	_edenEnt set3DENAttribute ["ammoBox", str ((parseSimpleArray _attrib)+[1])];
};

_edenEnt
