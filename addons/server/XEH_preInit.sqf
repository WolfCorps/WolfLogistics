#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;






GVAR(presets) = [

["ACE Medical - General Purpose","Medizinisches Preset mit allen notwendigen (ja, auch Torniquets) Materialien zur medizinischen Versorgung.",[["ACE_packingBandage",150],["ACE_elasticBandage",150],["ACE_epinephrine",20],["ACE_morphine",20],["ACE_salineIV_1000",10],["ACE_salineIV_500",15],["ACE_salineIV_250",20],["ACE_surgicalKit",1],["ACE_EarPlugs",2],["ACE_splint",30],["ACE_tourniquet",20],["ACE_quikclot",45]]]


,["Bundeswehr - 127 - G82","G82 Munitionspaket mit AP(x3), Raufoss(x1) und Tracer(x1) Munition",[["BWA3_10Rnd_127x99_G82_Raufoss_Tracer",1],["BWA3_10Rnd_127x99_G82_Tracer",1],["BWA3_10Rnd_127x99_G82_AP_Tracer",3]]]
,["Bundeswehr - 556 - G36","G36 Munitionspaket mit AP(x10) und Tracer(x5) Munition",[["BWA3_30Rnd_556x45_G36_Tracer",5],["BWA3_30Rnd_556x45_G36_AP",10]]]
,["Bundeswehr - 556 - MG4","MG4 Munitionspaket mit Standard(x3) und Tracer(x1) Munition",[["BWA3_200Rnd_556x45",3],["BWA3_200Rnd_556x45_Tracer",1]]]
,["Bundeswehr - 762 - G27","G27 Munitionspaket mit AP(x10) und Tracer(x5) Munition",[["BWA3_20Rnd_762x51_G28_Tracer",5],["BWA3_20Rnd_762x51_G28_AP",10]]]
,["Bundeswehr - 762 - G28","G28 Munitionspaket mit AP(x10) und Tracer(x5) Munition",[["BWA3_10Rnd_762x51_G28_Tracer",5],["BWA3_10Rnd_762x51_G28_AP",10]]]
,["Bundeswehr - 762 - MG3&MG5","MG Munitionspaket für das MG3 und MG5 mit Standard(x3) und Tracer(x1) Munition",[["BWA3_120Rnd_762x51_soft",3],["BWA3_120Rnd_762x51_Tracer_soft",1]]]
,["Bundeswehr - 860 - G29","G29 Munitionspaket mit Standard(x10) und Tracer(x5) Munition",[["BWA3_10Rnd_86x70_G29",10],["BWA3_10Rnd_86x70_G29_Tracer",5]]]
,["Bundeswehr - AA - Fliegerfaust","Fliegerfaust mit 3 Raketen",[["BWA3_Fliegerfaust","","","",["BWA3_Fliegerfaust_Mag",1],[],""],["BWA3_Fliegerfaust_Mag",3]]]
,["Bundeswehr - AT - Multi-Purpose","AT Preset mit 3 Wegwerf-Launchern und einer Leuchtbüchse",[["BWA3_PzF3","","","",["BWA3_PzF3_Tandem",1],[],""],["BWA3_RGW90","","","",["BWA3_RGW90_HH",1],[],""],["BWA3_PzF3","","","",["BWA3_PzF3_Tandem",1],[],""],["BWA3_CarlGustav","","","BWA3_optic_CarlGustav",["BWA3_CarlGustav_HEAT",1],[],""],["BWA3_CarlGustav_HE",1],["BWA3_CarlGustav_HEDP",1],["BWA3_CarlGustav_HEAT",3]]]
,["Bundeswehr - Gewehre und Granaten","Gewehr-Preset mit Munition für alle nicht-speziellen Gewehre der BW, mit Granaten für den AG40 und normale Soldaten.\nDAS Gesamtpaket",[["BWA3_30Rnd_556x45_G36_Tracer",10],["BWA3_30Rnd_556x45_G36_AP",30],["BWA3_15Rnd_9x19_P8",5],["rhs_mag_an_m8hc",5],["BWA3_DM51A1",3],["rhs_mag_M433_HEDP",12],["rhs_mag_m715_Green",1],["rhs_mag_m714_White",1],["rhs_mag_m713_Red",2],["BWA3_20Rnd_762x51_G28_AP",15],["BWA3_20Rnd_762x51_G28_Tracer",5]]]
,["Bundeswehr - Granaten - AG40","Unterlauf Granaten für den AG40 der Bundeswehr",[["1Rnd_HE_Grenade_shell",10],["UGL_FlareRed_F",3],["1Rnd_SmokeRed_Grenade_shell",1],["1Rnd_Smoke_Grenade_shell",1]]]
,["Bundeswehr - Granaten - HGs","Handgranaten und Rauchgranaten für den normalen Soldaten",[["BWA3_DM25",7],["BWA3_DM51A1",3],["BWA3_DM32_Green",1],["BWA3_DM32_Blue",1],["BWA3_DM32_Red",1]]]
,["Bundeswehr - Equipment - Night-Ops","Ausrüstung für den Nachtkampf (ChemLights, Flares, NVS, IR Granaten, LLMs)",[["ACE_Chemlight_HiBlue",2],["ACE_Chemlight_HiWhite",2],["ACE_HandFlare_Red",1],["ACE_HandFlare_White",1],["ACE_HandFlare_Yellow",1],["B_IR_Grenade",2],["BWA3_optic_NSV80",5],["BWA3_optic_NSV600",5],["BWA3_acc_LLM01_irlaser",3],["BWA3_acc_VarioRay_irlaser_black",3],["UK3CB_BAF_LLM_IR_Black",3]]]


,["US - 127 - M107","Munitionspaket für die M107 mit Standard(x4) und Raufoss(x2) Munition",[["rhsusf_mag_10Rnd_STD_50BMG_M33",4],["rhsusf_mag_10Rnd_STD_50BMG_mk211",2]]]
,["US - 556 - NATO Standard","Munitionspaket mit AP(x15) und Tracer(x5) Munition für die meisten NATO Standardgewehre (5.56 Kaliber)",[["rhs_mag_30Rnd_556x45_Mk318_PMAG",15],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",5]]]
,["US - 556 - M249","M249 Munitionspaket mit 5 Magazinen a 200 Schuss",[["rhsusf_200rnd_556x45_mixed_box",5]]]
,["US - 762 - HK417","Munitionspaket mit AP(x7) und Tracer(x3) Munition für die HK417 und Mk14",[["ACE_20Rnd_762x51_M993_AP_Mag",7],["ACE_20Rnd_762x51_Mag_Tracer",3]]]
,["US - 762 - M240","M240 Munitionspaket mit AP(x4) und Tracer(x2) Munition",[["rhsusf_100Rnd_762x51_m61_ap",4],["rhsusf_100Rnd_762x51_m62_tracer",2]]]
,["US - 762 - Mk11","Munitionspaket für die Mk11 mit AP(x7) und Tracer(x3) Munition",[["rhsusf_20Rnd_762x51_SR25_m993_Mag",7],["rhsusf_20Rnd_762x51_SR25_m62_Mag",3]]]
,["US - 762 - SCAR","Munitionspaket für die SCAR-H mit AP(x10) und Tracer(x3) Munition",[["rhs_mag_20Rnd_SCAR_762x51_m61_ap",10],["rhs_mag_20Rnd_SCAR_762x51_m62_tracer",3]]]
,["US - AA - Stinger","Stinger mit 3 Raketen",[["rhs_weap_fim92","","","",["rhs_fim92_mag",1],[],""],["rhs_fim92_mag",3]]]
,["US - AT - Multi-Purpose","AT Preset mit 3 Wegwerf-Launchern und einer SMAW",[["rhs_weap_smaw_green","","acc_pointer_IR","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],[],""],["rhs_weap_M136","","","",[],[],""],["rhs_weap_M136","","","",[],[],""],["rhs_weap_M136_hp","","","",[],[],""],["rhs_mag_smaw_HEAA",3]]]
,["US - AT - Special Purpose","AT Preset mit einer Javelin und 3 Raketen",[["rhs_weap_fgm148","","","",["rhs_fgm148_magazine_AT",1],[],""],["rhs_fgm148_magazine_AT",3]]]
,["US - Gewehre und Granaten","USMC/US Army Preset mit Munition für alle nicht-speziellen Gewehre von RHS,\nmit Granaten für den M203/M320 und normale Soldaten",[["rhsusf_mag_15Rnd_9x19_FMJ",2],["rhs_mag_m67",2],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10],["rhs_mag_30Rnd_556x45_Mk318_PMAG",30],["rhsusf_200rnd_556x45_mixed_box",10],["rhsusf_100Rnd_762x51_m62_tracer",5],["rhsusf_100Rnd_762x51_m61_ap",5],["rhsusf_20Rnd_762x51_SR25_m993_Mag",10],["rhsusf_20Rnd_762x51_SR25_m62_Mag",5],["rhs_mag_an_m8hc",5],["rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk",10],["rhs_mag_20Rnd_SCAR_762x51_m62_tracer_bk",5],["rhs_mag_M433_HEDP",10],["rhs_mag_m713_Red",3],["rhs_mag_m714_White",1],["rhs_mag_m715_Green",1],["ACE_20Rnd_762x51_M993_AP_Mag",10],["ACE_20Rnd_762x51_Mag_Tracer",5]]]
,["US - Granaten - HGs","Handgranaten und Rauchgranaten für den normalen Soldaten",[["rhs_mag_an_m8hc",7],["rhs_mag_m67",3],["SmokeShellRed",1],["SmokeShellBlue",1]]]
,["US - Granaten - M203/M320","Unterlauf Granaten für den M203 und M320 mit HuntIR",[["rhs_mag_M433_HEDP",10],["ACE_HuntIR_M203",3],["rhs_mag_m713_Red",1],["rhs_mag_m714_White",1],["rhs_mag_m662_red",1],["rhs_mag_m661_green",1]]]
,["US - Equipment - Night-Ops","Ausrüstung für den Nachtkampf (Chemlights, Flares, PVS, IR Granaten und LLMs)",[["ACE_Chemlight_HiBlue",1],["ACE_Chemlight_HiWhite",1],["ACE_Chemlight_HiYellow",1],["ACE_HandFlare_White",1],["ACE_HandFlare_Red",1],["ACE_HandFlare_Green",1],["B_IR_Grenade",3],["rhsusf_acc_premier_anpvs27",1],["rhsusf_acc_g33_T1",3],["rhsusf_acc_ACOG_anpvs27",3],["rhsusf_acc_anpeq15side_bk",6]]]


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
