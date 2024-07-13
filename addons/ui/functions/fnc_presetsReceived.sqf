#include "script_component.hpp"
/*
 * Author: dedmen
 * Called from server, contains the currently active Presets
 *
 * Arguments:
 * 0: Presets <ARRAY>
 *
 * Return Value:
 * NOTHING
 *
 * Example:
 * [GVAR(presets)] remoteExec ["wolf_logistics_ui_fnc_presetsReceived", remoteExecutedOwner];
 *
 * Public: Yes
 */

params ["_presets"];

GVAR(presets) = +_presets; // + is only required in singleplayer, and only for testing. So we don't edit the server array when we edit the ui one
