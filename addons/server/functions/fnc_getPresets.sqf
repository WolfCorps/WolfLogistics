#include "script_component.hpp"
/*
 * Author: dedmen
 * Retrieves presets from server
 *
 * Arguments:
 * 0: Reply function <OBJECT>
 * 1: Preset Name <STRING>
 * 2: Preset Description <STRING>
 *
 * Return Value:
 * New Preset <ARRAY>
 *
 * Example:
 * ["wolf_logistics_ui_fnc_presetsReceived"] remoteExec ["wolf_logistics_server_fnc_getPresets", 2]
 *
 * Public: Yes
 */

params ["_replyFunction"];


[GVAR(presets)] remoteExec [_replyFunction, remoteExecutedOwner];
