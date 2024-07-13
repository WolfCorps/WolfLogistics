#include "script_component.hpp"
/*
 * Author: dedmen
 * Generates a preset from the contents of a container
 *
 * Arguments:
 * 0: Source Box <OBJECT>
 * 1: Preset Name <STRING>
 * 2: Preset Description <STRING>
 *
 * Return Value:
 * New Preset <ARRAY>
 *
 * Example:
 * [_target, "new Preset", "This is a preset"] call wolf_logistics_main_fnc_createPresetFromBox
 *
 * Public: Yes
 */

params ["_target", "_presetName", "_presetDescription"];

private _presetContents = [];
private _newPreset = [_presetName, _presetDescription, _presetContents];

private _weapons = [];

{
    _presetContents pushBack _X;
} forEach weaponsItemsCargo _target; // [weapon, muzzle, flashlight, optics, primaryMag, secondaryMag, bipod]

private _magazineCargo = getMagazineCargo _target;

{
    _presetContents pushBack [_x, (_magazineCargo select 1) select _forEachIndex]; // [name, count]
} forEach (_magazineCargo select 0);


private _itemCargo = getItemCargo _target;
private _backpackCargo = everyContainer _target;

// We would list uniforms and vests twice. Remove containers from the item list 

{
    private _found = (_itemCargo select 0) find (_x select 0);
    if (_found != -1) then {(_itemCargo select 0) deleteAt _found; (_itemCargo select 1) deleteAt _found;}
} forEach _backpackCargo;

{
    _presetContents pushBack [_x, (_itemCargo select 1) select _forEachIndex];  // [name, count]
} forEach (_itemCargo select 0);



{
    _x params ["_type", "_object"];
    _presetContents pushBack [_type, [_object, "", ""] call wolf_logistics_main_fnc_createPresetFromBox, 1];  // [name, contentPreset, dummy]
} forEach _backpackCargo;

private _backpackCargo = everyBackpack _target;

_newPreset
