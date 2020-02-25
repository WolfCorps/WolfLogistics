#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;






GVAR(presets) = [

["new Preset","This is a preset",[["ACE_fieldDressing",25],["ACE_packingBandage",25],["ACE_elasticBandage",25],["ACE_tourniquet",15],["ACE_splint",15],["ACE_morphine",15],["ACE_adenosine",15],["ACE_epinephrine",15],["ACE_plasmaIV",7],["ACE_plasmaIV_500",7],["ACE_plasmaIV_250",7],["ACE_salineIV",7],["ACE_salineIV_500",7],["ACE_salineIV_250",7],["ACE_bloodIV",7],["ACE_bloodIV_500",7],["ACE_bloodIV_250",7],["ACE_quikclot",20],["ACE_personalAidKit",3],["ACE_surgicalKit",2],["ACE_bodyBag",5]]]



];

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