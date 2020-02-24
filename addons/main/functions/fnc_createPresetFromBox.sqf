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
} forEach weaponsItemsCargo _target;

private _magazineCargo = getMagazineCargo _target;

{
    _presetContents pushBack [_x, (_magazineCargo select 1) select _forEachIndex];
} forEach (_magazineCargo select 0);


private _itemCargo = getItemCargo _target;

{
    _presetContents pushBack [_x, (_itemCargo select 1) select _forEachIndex];
} forEach (_itemCargo select 0);

_newPreset
