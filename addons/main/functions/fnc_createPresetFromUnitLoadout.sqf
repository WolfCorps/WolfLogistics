#include "script_component.hpp"
/*
 * Author: dedmen
 * Generates a preset from a unit loadout array
 *
 * Arguments:
 * 0: Unit Loadout <ARRAY>
 * 1: Preset Name <STRING>
 * 2: Preset Description <STRING>
 *
 * Return Value:
 * New Preset <ARRAY>
 *
 * Example:
 * [getUnitLoadout player, "new Preset", "This is a preset"] call wolf_logistics_main_fnc_createPresetFromUnitLoadout
 *
 * Public: No
 */

params ["_loadout", "_presetName", "_presetDescription"];

_loadout params ["_lPWep", "_lSWep", "_lHWep", "_lUniform", "_lVest", "_lBackpack", "_lHeadgear", "_lGoggles", "_lBinocular", "_lAssigned"];

private _presetContents = [];
private _newPreset = [_presetName, _presetDescription, _presetContents];

private _weapons = [];

// [weapon, muzzle, flashlight, optics, primaryMag, secondaryMag, bipod]
if (_lPWep isNotEqualTo []) then {_presetContents pushBack _lPWep};
if (_lSWep isNotEqualTo []) then {_presetContents pushBack _lSWep};
if (_lHWep isNotEqualTo []) then {_presetContents pushBack _lHWep};


// Containers

private _presetFromContainer = {
	params ["_containerClass", "_containerContents"];

	private _presetContents = [];
	private _newPreset = ["", "", _presetContents];

	{
		// [["UK3CB_MP5A2","","","",["UK3CB_MP5_30Rnd_9x19_Magazine_G",30],[],""],1] Weapon
		// ["UK3CB_MP5_30Rnd_9x19_Magazine_G",1,30] Magazine
		// ["ToolKit",1] Item
		if (_x#0 isEqualType []) then {
			_x params ["_weaponInfo", "_weaponCount"];
			private _weaponInfo = _x select 0;

			private _weapons = [];
			_weapons resize _weaponCount;
			_weapons = _weapons apply {_weaponInfo};

			_presetContents append _weapons;
			continue;
		};
		// Everything else is [item, count], both magazines (we don't store ammo count) and items 
		_x params ["_itemClass", "_count"];

		_presetContents pushBack [_itemClass, _count];
	} forEach _containerContents;

	[_containerClass, _newPreset, 1] // [name, contentPreset, dummy]
};

if (_lUniform#0 != "") then {_presetContents pushBack (_lUniform call _presetFromContainer)};
if (_lVest#0 != "") then {_presetContents pushBack (_lVest call _presetFromContainer)};
if (_lBackpack#0 != "") then {_presetContents pushBack (_lBackpack call _presetFromContainer)};

if (_lHeadgear != "") then {_presetContents pushBack [_lHeadgear, 1]};
if (_lGoggles != "") then {_presetContents pushBack [_lGoggles, 1]};
if (_lBinocular isNotEqualTo []) then {_presetContents pushBack _lBinocular}; // Its a weapon array

{
	if (_x == "") then {continue};

	// Replace TFAR radios with the base type
	//#TODO ACRE Radios?

	private _class = configFile >> "CfgWeapons" >> _x;
	// if the item is an actual radio, not a radio prototype nor common item
	if ((isClass _class) && {isNumber (_class >> "tf_radio")}) then {
		// erase the content value with parent prototype
		//diag_log ["TFAR","replace",_class,_forEachIndex,getText (_class >> "tf_parent")];
		_x = getText (_class >> "tf_parent");
	};

	_presetContents pushBack [_x, 1];
} forEach _lAssigned;

_newPreset