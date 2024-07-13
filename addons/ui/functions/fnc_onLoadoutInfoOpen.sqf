#include "script_component.hpp"

/*
 * Author: dedmen
 * onLoad EH for LoadoutInfo.
 *
 * Arguments:
 * 0: Ignored
 * 1: Arguments <ARRAY>
  * 1.1: LoadoutInfo display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_args"];
_args params ["_display"];


[_display] call FUNC(fillLoadoutsList);
_display call FUNC(updateBoxFillState);