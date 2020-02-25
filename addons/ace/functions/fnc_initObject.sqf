#include "script_component.hpp"

params ["_object"];
private _type = typeOf _object;

private _canLoadConfig = getNumber (configFile >> "CfgVehicles" >> _type >> "maximumLoad") > 1;

// Nothing to do here if object can't be loaded
if !(_canLoadConfig) exitWith {};

// Servers and HCs do not require action menus (beyond this point)
if !(hasInterface) exitWith {};

// Unnecessary to add actions to an object class that's already got them
if (_type in GVAR(initializedItemClasses)) exitWith {};
if (_object getVariable [QGVAR(initObject),false]) exitWith {};


if (_canLoadConfig) then {
    GVAR(initializedItemClasses) pushBack _type;
    TRACE_1("Adding load cargo action to class", _type);
    [_type, 0, ["ACE_MainActions"], GVAR(objectAction)] call ace_interact_menu_fnc_addActionToClass;
} else {
    _object setVariable [QGVAR(initObject),true];
    TRACE_1("Adding load cargo action to object", _object);
    [_object, 0, ["ACE_MainActions"], GVAR(objectAction)] call ace_interact_menu_fnc_addActionToClass;
};
