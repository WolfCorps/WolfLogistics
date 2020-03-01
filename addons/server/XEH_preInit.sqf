#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;






GVAR(presets) = [

,["ACE Medical - General Purpose","Medizinisches Preset mit allen notwendigen (ja, auch Torniquets) Materialien zur medizinischen Versorgung.",[["ACE_packingBandage",150],["ACE_elasticBandage",150],["ACE_epinephrine",20],["ACE_morphine",20],["ACE_salineIV_500",10],["ACE_salineIV_250",10],["ACE_surgicalKit",1],["ACE_EarPlugs",2],["ACE_splint",30],["ACE_tourniquet",20],["ACE_quikclot",45]]]


,["Bundeswehr - AA - Fliegerfaust","Fliegerfaust mit 3 Raketen",[["BWA3_Fliegerfaust","","","",["BWA3_Fliegerfaust_Mag",1],[],""],["BWA3_Fliegerfaust_Mag",3]]]
,["Bundeswehr - AT","AT Preset mit 3 Wegwerf-Launchern und einer Leuchtbüchse",[["BWA3_PzF3","","","",["BWA3_PzF3_Tandem",1],[],""],["BWA3_RGW90","","","",["BWA3_RGW90_HH",1],[],""],["BWA3_PzF3","","","",["BWA3_PzF3_Tandem",1],[],""],["BWA3_CarlGustav","","","BWA3_optic_CarlGustav",["BWA3_CarlGustav_HEAT",1],[],""],["BWA3_CarlGustav_HE",1],["BWA3_CarlGustav_HEDP",1],["BWA3_CarlGustav_HEAT",3]]]
,["Bundeswehr - Gewehre und Granaten","Gewehr-Preset mit Munition für alle nicht-speziellen Gewehre der BW, mit Granaten für den AG40 und normale Soldaten",[["BWA3_30Rnd_556x45_G36_Tracer",10],["BWA3_30Rnd_556x45_G36_AP",30],["BWA3_15Rnd_9x19_P8",5],["rhs_mag_an_m8hc",5],["BWA3_DM51A1",3],["rhs_mag_M433_HEDP",12],["rhs_mag_m715_Green",1],["rhs_mag_m714_White",1],["rhs_mag_m713_Red",2],["BWA3_20Rnd_762x51_G28_AP",15],["BWA3_20Rnd_762x51_G28_Tracer",5]]]


,["USMC - AA - Stinger","Stinger mit 3 Raketen",[["rhs_weap_fim92","","","",["rhs_fim92_mag",1],[],""],["rhs_fim92_mag",3]]]
,["USMC - AT","AT Preset mit 3 Wegwerf-Launchern und einer SMAW",[["rhs_weap_smaw_green","","acc_pointer_IR","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],[],""],["rhs_weap_M136","","","",[],[],""],["rhs_weap_M136","","","",[],[],""],["rhs_weap_M136_hp","","","",[],[],""],["rhs_mag_smaw_HEAA",3]]]
,["USMC - AT - Special Purpose","AT Preset mit einer Javelin und 3 Raketen",[["rhs_weap_fgm148","","","",["rhs_fgm148_magazine_AT",1],[],""],["rhs_fgm148_magazine_AT",3]]]
,["USMC - Gewehre und Granaten","USMC/US Army Preset mit Munition für alle nicht-speziellen Gewehre von RHS, mit Granaten für den M203/M320 und normale Soldaten",[["rhsusf_mag_15Rnd_9x19_FMJ",2],["rhs_mag_m67",2],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10],["rhs_mag_30Rnd_556x45_Mk318_PMAG",30],["rhsusf_200rnd_556x45_mixed_box",10],["rhsusf_100Rnd_762x51_m62_tracer",5],["rhsusf_100Rnd_762x51_m61_ap",5],["rhsusf_20Rnd_762x51_SR25_m993_Mag",10],["rhsusf_20Rnd_762x51_SR25_m62_Mag",5],["rhs_mag_an_m8hc",5],["rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk",10],["rhs_mag_20Rnd_SCAR_762x51_m62_tracer_bk",5],["rhs_mag_M433_HEDP",10],["rhs_mag_m713_Red",3],["rhs_mag_m714_White",1],["rhs_mag_m715_Green",1],["ACE_20Rnd_762x51_M993_AP_Mag",10],["ACE_20Rnd_762x51_Mag_Tracer",5]]]

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
