#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Dedmen
 * Clears current box
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Public: No
*/
params ["_display", "_control"];

clearWeaponCargoGlobal GVAR(center);
clearItemCargoGlobal GVAR(center);
clearMagazineCargoGlobal GVAR(center);
clearBackpackCargoGlobal GVAR(center);

_display call FUNC(updateBoxFillState);

"Kiste wurde geleert" call CBA_fnc_notify;
