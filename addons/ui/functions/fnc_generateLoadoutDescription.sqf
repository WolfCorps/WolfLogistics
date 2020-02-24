#include "script_component.hpp"
/*
 * Author: dedmen
 * Generates a text description for a preset
 *
 * Arguments:
 * 1: Preset <ARRAY>
 *
 * Return Value:
 * NOTHING
 *
 * Example:
 * [_myPreset] call wolf_logistics_ui_fnc_generateLoadoutDescription
 *
 * Public: Yes
 */

params ["_preset"];

_preset params ["_presetName","_presetDescription","_presetContents"];

private _text = [_presetDescription, "", ""];

private _getDisplayName = {
    private _cfgWeaponsClass = configFile >> "CfgWeapons" >> _this;
    if (isClass _cfgWeaponsClass) exitWith {getText (_cfgWeaponsClass >> "displayName")};

    _cfgWeaponsClass = configFile >> "CfgMagazines" >> _this;
    if (isClass _cfgWeaponsClass) exitWith {getText (_cfgWeaponsClass >> "displayName")};

    _this;
};


{
    if (count _x > 2) then { //Weapon
        _x params ["_class", "_muzzle", "_side", "_top", "_magazine", "_secondaryMagazine", "_bottom"];
        private _weaponAttachments = [];

        if (_muzzle != "") then {_weaponAttachments pushBack (_muzzle call _getDisplayName)};
        if (_side != "") then {_weaponAttachments pushBack (_side call _getDisplayName)};
        if (_top != "") then {_weaponAttachments pushBack (_top call _getDisplayName)};
        if (_bottom != "") then {_weaponAttachments pushBack (_bottom call _getDisplayName)};
        if !(_magazine isEqualTo []) then {_weaponAttachments pushBack ((_magazine select 0) call _getDisplayName)};
        if !(_secondaryMagazine isEqualTo []) then {_weaponAttachments pushBack ((_secondaryMagazine select 0) call _getDisplayName)};

        _text pushBack format["%1 with %2", _class call _getDisplayName, _weaponAttachments];
    } else { //Item
        _x params ["_class", "_count"];
        _text pushBack format["%1x %2", _count, _class call _getDisplayName];
    }
} forEach _presetContents;


_text joinString "<br/>"

