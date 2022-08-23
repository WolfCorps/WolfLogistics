#include "script_component.hpp"
/*
 * Author: dedmen
 * Fills a Preset into a Container
 *
 * Arguments:
 * 0: Target Box <OBJECT>
 * 1: Preset <ARRAY>
 *
 * Return Value:
 * NOTHING
 *
 * Example:
 * [_target, _myPreset] call wolf_logistics_main_fnc_fillPresetIntoBox
 *
 * Public: Yes
 */

params ["_target", "_preset"];

_preset params ["_presetName","_presetDescription","_presetContents","_presetBackpacks"];


{
    if (count _x > 2) then { //Weapon
        _target addWeaponWithAttachmentsCargoGlobal [_x, 1];
    } else { //Item
        _x params ["_class", "_count"];
        _target addItemCargoGlobal [_class, _count];
    }
} forEach _presetContents;

{
    _x params ["_type","_count"];
    _target addBackpackCargoGlobal [_type, _count];
} forEach _presetBackpacks;
