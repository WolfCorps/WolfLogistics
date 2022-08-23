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
 * New Preset <ARRAY> : [name: string, description: string, items: item|weapon[], backpack[]]
 *  backpack[]: [type, count]
 *  !type of items-array varies, see fnc_fillPresetIntoBox! 
 *
 * Example:
 * [_target, "new Preset", "This is a preset"] call wolf_logistics_main_fnc_createPresetFromBox
 *
 * Public: Yes
 */

params ["_target", "_presetName", "_presetDescription"];

private _presetItems = [];
private _presetBackpacks = [];

//init preset
private _newPreset = [_presetName, _presetDescription, _presetItems, _presetBackpacks];

//add items ###
{
    _presetItems pushBack _X;
} forEach weaponsItemsCargo _target;

private _magazineCargo = getMagazineCargo _target;
{
    _presetItems pushBack [_x, (_magazineCargo select 1) select _forEachIndex];
} forEach (_magazineCargo select 0);


private _itemCargo = getItemCargo _target;
{
    _presetItems pushBack [_x, (_itemCargo select 1) select _forEachIndex];
} forEach (_itemCargo select 0);

//add backpacks ###
diag_log ["collect backpacks ############### "];

(getBackpackCargo _target) params ["_backpackTypes","_backpackCounts"];
{
    _presetBackpacks pushBack [_x/*type*/,_backpackCounts select _foreachIndex];
} forEach _backpackTypes;

_newPreset
