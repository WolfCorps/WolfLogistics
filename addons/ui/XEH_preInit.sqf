#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;


//Retrieve presets from server
["wolf_logistics_ui_fnc_presetsReceived"] remoteExec ["wolf_logistics_server_fnc_getPresets", 2];

["wolf_logistics_newPreset", {
    //_this is a preset
    params ["_presetName"];

    private _loadoutIndex = GVAR(presets) findIf {(_x select 0) == _presetName};

    if (_loadoutIndex isEqualto -1) then {
        GVAR(presets) pushBack _this;
    } else {
        GVAR(presets) set [_loadoutIndex, _this];
    };
}] call CBA_fnc_addEventHandler;

["wolf_logistics_deletePreset", {
    params ["_presetName"];

    private _loadoutIndex = GVAR(presets) findIf {(_x select 0) == _presetName};
    //diag_log (GVAR(presets) apply {(_x select 0)});

    if (_loadoutIndex isNotEqualto -1) then {
        GVAR(presets) deleteAt _loadoutIndex;
    };
}] call CBA_fnc_addEventHandler;