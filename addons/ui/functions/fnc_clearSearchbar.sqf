#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Alganthe / Dedmen
 * Clear the provided searchbar.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Searchbar control <CONTROL>
 * 2: Mouse button <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_buttonPressed"];

if (_buttonPressed != 1) exitWith  {}; // Only right click

_control ctrlSetText "";

_this call FUNC(handleLoadoutsSearchbar); // Update results