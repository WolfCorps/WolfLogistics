#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Dedmen
 * Update fill state display of box
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display"];


private _boxFillStateCtrl = _display displayCtrl IDC_boxFillState;
_boxFillStateCtrl ctrlSetText format ["Kisten Füllstatus: %1/%2", loadAbs GVAR(center), maxLoad GVAR(center)];