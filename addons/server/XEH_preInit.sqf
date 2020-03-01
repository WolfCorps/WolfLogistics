#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;






GVAR(presets) = [

["STANAG x4","STANAG magazines, Tracer and normal, 4 soldiers",[["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",20],["rhs_mag_30Rnd_556x45_M855A1_Stanag",20]]]
,["M4 x4","M4 weapons x4 + EOTech scope with magnifier + laser",[["rhs_weap_m4a1","","ACE_acc_pointer_green_IR","RH_eotech553mag",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],["rhs_weap_m4a1","","ACE_acc_pointer_green_IR","RH_eotech553mag",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],["rhs_weap_m4a1","","ACE_acc_pointer_green_IR","RH_eotech553mag",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],["rhs_weap_m4a1","","ACE_acc_pointer_green_IR","RH_eotech553mag",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""]]]
,["M249 x2","M249 LMG x2 + MRCO Scope + laser",[["rhs_weap_m249_light_S","","ACE_acc_pointer_green_IR","ACE_optic_MRCO_2D",["rhs_200rnd_556x45_M_SAW",200],[],"rhsusf_acc_saw_bipod"],["rhs_weap_m249_light_S","","ACE_acc_pointer_green_IR","ACE_optic_MRCO_2D",["rhs_200rnd_556x45_M_SAW",200],[],"rhsusf_acc_saw_bipod"]]]
,["M249 Ammo x2","2000 rounds of mixed 5.56 in 200 round mags",[["rhs_200rnd_556x45_M_SAW",10]]]
,["40mm standard x2","40mm explosive, smoke, coloured smoke, 2 soldiers",[["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",40],["UK3CB_BAF_1Rnd_SmokeRed_Grenade_shell",6],["UK3CB_BAF_1Rnd_Smoke_Grenade_shell",6],["UK3CB_BAF_1Rnd_SmokeBlue_Grenade_shell",6]]]
,["40mm flare x2","40mm flares + coloured flares, 2 soldiers",[["UK3CB_BAF_UGL_FlareWhite_F",20],["UK3CB_BAF_UGL_FlareRed_F",10],["UK3CB_BAF_UGL_FlareGreen_F",6]]]
,["Nachtkampf BW x4","Nachtsicht und Nachtkampfausrüstung für 4 Soldaten",[["ACE_Vector","","","",[],[],""],["ACE_Vector","","","",[],[],""],["ACE_Vector","","","",[],[],""],["ACE_Vector","","","",[],[],""],["Chemlight_red",20],["ACE_Chemlight_HiRed",20],["A3_GPNVG18_BLK_F",4],["BWA3_optic_ZO4x30_MicroT2_NSV_pip",4],["ACE_acc_pointer_green_IR",4],["ACE_IR_Strobe_Item",4],["BWA3_optic_NSV600",4],["ACE_Flashlight_XL50",4]]]
,["M240 Ammo x2","2000 mixed tracer rounds of 7.62 in 100 round mags for m240 mg",[["rhsusf_100Rnd_762x51",20]]]
,["grenade mixed x4","Mix of throwable assets, lights, fragmentation, concussion, flash,smoke, coloured smoke, 4 soldiers",[["ACE_Chemlight_HiRed",20],["Chemlight_green",12],["Chemlight_red",12],["ACE_Chemlight_IR",12],["B_IR_Grenade",8],["SmokeShellGreen",4],["SmokeShellRed",4],["SmokeShellBlue",4],["SmokeShell",16],["ACE_M84",8],["HandGrenade",16],["rhs_mag_mk3a2",8]]]
,["AT light","M136 2x HEAT, 1x HP, AT Launcher pack",[["rhs_weap_M136","","","",[],[],""],["rhs_weap_M136_hp","","","",[],[],""],["rhs_weap_M136","","","",["rhs_m136_mag",1],[],""]]]
,["AA x1","Stinger AA Launcher, 5 shots",[["rhs_weap_fim92","","","",["rhs_fim92_mag",1],[],""],["rhs_fim92_mag",4]]]
,["Javelin x1","Javelin Launcher + 3 shots",[["rhs_weap_fgm148","","","",["rhs_fgm148_magazine_AT",1],[],""],["rhs_fgm148_magazine_AT",2]]]
,["Javelin Ammo x3","3 shot Javelin missile",[["rhs_fgm148_magazine_AT",3]]]
,["SMAW Ammo x1","SMAW Ammo, 2x HEAA, 2x HEDP,3x Spotting rounds",[["rhs_mag_smaw_HEAA",2],["rhs_mag_smaw_HEDP",2],["rhs_mag_smaw_SR",3]]]
,["SMAW x1","SMAW launcher + ammo pack, 2x HEAA,2x HEDP,3x Spotting rounds",[["rhs_weap_smaw_green","","acc_pointer_IR","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],[],""],["rhs_mag_smaw_HEAA",1],["rhs_mag_smaw_HEDP",2],["rhs_mag_smaw_SR",3]]]

,["Medical - General Purpose","A medical preset with all necessary (yes, even torniquets) medical equipment",[["ACE_packingBandage",150],["ACE_elasticBandage",150],["ACE_epinephrine",20],["ACE_morphine",20],["ACE_salineIV_500",10],["ACE_salineIV_250",10],["ACE_surgicalKit",1],["ACE_EarPlugs",2],["ACE_splint",30],["ACE_tourniquet",20],["ACE_quikclot",45]]]


,["Bundeswehr - AA - Fliegerfaust","Fliegerfaust with 3 rockets",[["BWA3_Fliegerfaust","","","",["BWA3_Fliegerfaust_Mag",1],[],""],["BWA3_Fliegerfaust_Mag",3]]]
,["Bundeswehr - AT","AT Preset with 3 disposable launchers and a Leuchtbüchse",[["BWA3_PzF3","","","",["BWA3_PzF3_Tandem",1],[],""],["BWA3_RGW90","","","",["BWA3_RGW90_HH",1],[],""],["BWA3_PzF3","","","",["BWA3_PzF3_Tandem",1],[],""],["BWA3_CarlGustav","","","BWA3_optic_CarlGustav",["BWA3_CarlGustav_HEAT",1],[],""],["BWA3_CarlGustav_HE",1],["BWA3_CarlGustav_HEDP",1],["BWA3_CarlGustav_HEAT",3]]]
,["Bundeswehr - Rifles and GL","Rifle preset with ammo for all non-special rifles of the BW Mod, including grenades for AG40 and normal soldiers",[["BWA3_30Rnd_556x45_G36_Tracer",10],["BWA3_30Rnd_556x45_G36_AP",30],["BWA3_15Rnd_9x19_P8",5],["rhs_mag_an_m8hc",5],["BWA3_DM51A1",3],["rhs_mag_M433_HEDP",12],["rhs_mag_m715_Green",1],["rhs_mag_m714_White",1],["rhs_mag_m713_Red",2],["BWA3_20Rnd_762x51_G28_AP",15],["BWA3_20Rnd_762x51_G28_Tracer",5]]]


,["USMC - AA - Stinger","Stinger with 3 rockets",[["rhs_weap_fim92","","","",["rhs_fim92_mag",1],[],""],["rhs_fim92_mag",3]]]
,["USMC - AT","AT Preset with 3 disposable launchers and a SMAW",[["rhs_weap_smaw_green","","acc_pointer_IR","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],[],""],["rhs_weap_M136","","","",[],[],""],["rhs_weap_M136","","","",[],[],""],["rhs_weap_M136_hp","","","",[],[],""],["rhs_mag_smaw_HEAA",3]]]
,["USMC - AT - Special Purpose","AT preset with a Javelin and 3 rockets",[["rhs_weap_fgm148","","","",["rhs_fgm148_magazine_AT",1],[],""],["rhs_fgm148_magazine_AT",3]]]
,["USMC - Rifles and GL","USMC/US Army preset with ammo for all non-special rifles of RHS, including grenades for M320/M203 and normal soldiers",[["rhsusf_mag_15Rnd_9x19_FMJ",2],["rhs_mag_m67",2],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10],["rhs_mag_30Rnd_556x45_Mk318_PMAG",30],["rhsusf_200rnd_556x45_mixed_box",10],["rhsusf_100Rnd_762x51_m62_tracer",5],["rhsusf_100Rnd_762x51_m61_ap",5],["rhsusf_20Rnd_762x51_SR25_m993_Mag",10],["rhsusf_20Rnd_762x51_SR25_m62_Mag",5],["rhs_mag_an_m8hc",5],["rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk",10],["rhs_mag_20Rnd_SCAR_762x51_m62_tracer_bk",5],["rhs_mag_M433_HEDP",10],["rhs_mag_m713_Red",3],["rhs_mag_m714_White",1],["rhs_mag_m715_Green",1],["ACE_20Rnd_762x51_M993_AP_Mag",10],["ACE_20Rnd_762x51_Mag_Tracer",5]]]

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
