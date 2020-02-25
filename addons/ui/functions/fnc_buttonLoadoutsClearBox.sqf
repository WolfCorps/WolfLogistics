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


clearWeaponCargoGlobal GVAR(center);
clearItemCargoGlobal GVAR(center);
clearMagazineCargoGlobal GVAR(center);

"Kiste wurde geleert" call CBA_fnc_notify;
