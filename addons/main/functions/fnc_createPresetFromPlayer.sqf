#include "script_component.hpp"
/*
 * Author: dedmen
 * Generates a preset from the contents of a players inventory
 *
 * Arguments:
 * 0: Source Player <OBJECT>
 * 1: Preset Name <STRING>
 * 2: Preset Description <STRING>
 *
 * Return Value:
 * New Preset <ARRAY>
 *
 * Example:
 * [_target, "new Preset", "This is a preset"] call wolf_logistics_main_fnc_createPresetFromPlayer
 *
 * Public: Yes
 */

 params ["_target", "_presetName", "_presetDescription"];

private _presetContents = [];
private _newPreset = [_presetName, _presetDescription, _presetContents];

// Player only has containers and weapons and assigned items

{
    _presetContents pushBack _x;
} forEach weaponsItems _target; // [weapon, muzzle, flashlight, optics, primaryMag, secondaryMag, bipod]
 
{
	_presetContents pushBack [_x, 1];
} forEach assignedItems [_target, true, false];

// This is basically all of the rest of the inventory

private _backpackCargo = [
	[uniform _target, uniformContainer _target],
	[vest _target, vestContainer _target],
	[backpack _target, backpackContainer _target]
] select {(_x select 0) != ""};

{
    _x params ["_type", "_object"];
    _presetContents pushBack [_type, [_object, "", ""] call wolf_logistics_main_fnc_createPresetFromBox, 1];  // [name, contentPreset, dummy]
} forEach _backpackCargo;

_newPreset