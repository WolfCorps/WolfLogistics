#include "script_component.hpp"
/*
 * Author: dedmen
 * Opens the Preset info UI
 *
 * Arguments:
 *
 * Return Value:
 * NOTHING
 *
 * Example:
 * box call wolf_logistics_ui_fnc_openLogistikMenuOnBox
 *
 * Public: Yes
 */

params ["_center"];

GVAR(center) = _center;

private _displayToUse = [findDisplay 46, findDisplay 312] select (!isNull findDisplay 312);
_displayToUse = [_displayToUse, findDisplay 313] select (is3DEN);

if (is3DEN) then {
    _displayToUse createDisplay QGVAR(loadoutInfo);
} else {
    [{(_this select 0) createDisplay (_this select 1)}, [_displayToUse, QGVAR(loadoutInfo)]] call CBA_fnc_execNextFrame;
};
