#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Dedmen
 * Export current loadout in box
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Public: No
*/


copyToClipboard str ([GVAR(center), "new Preset", "This is a preset"] call wolf_logistics_main_fnc_createPresetFromBox);
