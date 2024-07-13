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

private _text = [];
_text append ([_presetDescription, "\n"] call CBA_fnc_split); // Multiline description
_text append ["", ""]; // Spacers to contents

private _massInfoElement = _text pushBack "";

private _getClassRef = {
    private _cfgWeaponsClass = configFile >> "CfgWeapons" >> _this;
    if (isClass _cfgWeaponsClass) exitWith {_cfgWeaponsClass};

    _cfgWeaponsClass = configFile >> "CfgMagazines" >> _this;
    if (isClass _cfgWeaponsClass) exitWith {_cfgWeaponsClass};

    _cfgWeaponsClass = configFile >> "CfgVehicles" >> _this; // Backpack
    if (isClass _cfgWeaponsClass) exitWith {_cfgWeaponsClass};

    configNull;
};

private _getDisplayName = {
    private _cfgWeaponsClass = _this call _getClassRef;
    if (isClass _cfgWeaponsClass) exitWith {getText (_cfgWeaponsClass >> "displayName")};

    _this;
};

private _massSum = 0;

private _addMass = {
    params ["_className", ["_count", 1]];
    private _cfg = _className call _getClassRef;

    // Backpack
    if (_className isKindOf ["ReammoBox", configFile >> "CfgVehicles"]) exitWith {_massSum = _massSum + (getNumber (_cfg >> "mass")) * _count;};

    _massSum = _massSum + (getNumber (_cfg >> "ItemInfo" >> "mass")) * _count;
};

{
    if (count _x > 2) then { //Weapon or backpack

        if ((_x select 1) isEqualType []) then {
            // [backpackName, contentPreset, ignoredFakeValue]
            _x params ["_backpackClass", "_preset"];

            //_text pushBack format["%1:", _backpackClass call _getDisplayName];

            //private _contentText = [[_preset] call wolf_logistics_ui_fnc_generateLoadoutDescription, "<br/>"] call CBA_fnc_split;
            private _contentText = [_preset] call wolf_logistics_ui_fnc_generateLoadoutDescription;

            _contentText = _contentText select {_x isNotEqualTo ""}; // Filter out empty lines
            //_contentText = _contentText apply {format["  %1", _x]}; // indent
            //_text append _contentText;

            // Grab the mass out of it 
            if ((_contentText select 0) find "Mass:" != -1) then {
                private _massString = _contentText deleteAt 0;
                _massSum = _massSum + parseNumber (_massString select [(_massString find ":") + 1]);
            };

            _backpackClass call _addMass;
            _text pushBack [_backpackClass call _getClassRef, _backpackClass call _getDisplayName, _contentText];
        } else {
            // [weapon, muzzle, flashlight, optics, primaryMag, secondaryMag, bipod]
            _x params ["_class", "_muzzle", "_side", "_top", "_magazine", "_secondaryMagazine", "_bottom"];
            private _weaponAttachments = [];

            if (_muzzle != "") then {_weaponAttachments pushBack (_muzzle call _getDisplayName); _muzzle call _addMass;};
            if (_side != "") then {_weaponAttachments pushBack (_side call _getDisplayName); _side call _addMass;};
            if (_top != "") then {_weaponAttachments pushBack (_top call _getDisplayName); _top call _addMass;};
            if (_bottom != "") then {_weaponAttachments pushBack (_bottom call _getDisplayName); _bottom call _addMass;};
            if !(_magazine isEqualTo []) then {_weaponAttachments pushBack ((_magazine select 0) call _getDisplayName); (_magazine select 0) call _addMass;};
            if !(_secondaryMagazine isEqualTo []) then {_weaponAttachments pushBack ((_secondaryMagazine select 0) call _getDisplayName); (_secondaryMagazine select 0) call _addMass;};

            _class call _addMass;
            _text pushBack [_class call _getClassRef, format["%1 with %2", _class call _getDisplayName, _weaponAttachments]];
        }
    } else { //Item
        _x params ["_class", "_count"];
        _text pushBack [_class call _getClassRef, format["%1x %2", _count, _class call _getDisplayName]];

        _x call _addMass;
    }
} forEach _presetContents;

_text set [_massInfoElement, format["Total Mass: %1", _massSum]];
//_text joinString "<br/>"
_text

