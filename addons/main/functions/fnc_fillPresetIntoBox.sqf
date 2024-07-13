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

_preset params ["_presetName","_presetDescription","_presetContents"];


_backpackPostProcess = [];


{
    if (count _x > 2) then { //Weapon or backpack

        if ((_x select 1) isEqualType []) then {
            // [backpackName, contentPreset, ignoredFakeValue]
            
            // Backpack or vest/uniform (vehicle or item)?
            if (isClass (configFile >> "CfgWeapons" >> (_x select 0))) then {
                _target addItemCargoGlobal [_x select 0, 1];
            } else {
                _target addBackpackCargoGlobal [_x select 0, 1];
            };
            
            private _allBackpacks = everyContainer _target;
            // Assume the last backpack in everyBackpack is the most recently added one. That seems to work fine
            private _targetBackpack = (_allBackpacks select -1) select 1;
            // It may be prefilled one, so empty it first 
            clearWeaponCargoGlobal _targetBackpack;
            clearItemCargoGlobal _targetBackpack;
            clearMagazineCargoGlobal _targetBackpack;

            [_targetBackpack, _x select 1] call wolf_logistics_main_fnc_fillPresetIntoBox;

            _backpackPostProcess pushBack _x;

        } else {
            // [weapon, muzzle, flashlight, optics, primaryMag, secondaryMag, bipod]
            _target addWeaponWithAttachmentsCargoGlobal [_x, 1];
        }



    } else { //Item
        _x params ["_class", "_count"];
        _target addItemCargoGlobal [_class, _count];
    }
} forEach _presetContents;
