#include "script_component.hpp"

private _box = ace_cargo_interactionVehicle;
private _newName = _box getVariable ["ace_cargo_customName", ""];
private _model = (getModelinfo _box) select 0;
//diag_log _box;
//diag_log _newName;

// Try to find the name of the camo selection 

/*

// Based on Wolf Arsenal available boxes these are the selections we want to replace
private _selectionWhitelist = ["camo2", "camo_signs", "medical"];
private _availableSelection = getArray (configOf _box >> "hiddenSelections") select {toLower _x in _selectionWhitelist} param [0, ""];


if (_availableSelection == "") exitWith {};

private _expectedWidth = (_newName getTextWidth ["RobotoCondensed", 0.1]) max 0.001; // No zero

// Some boxes have quite messed up UV's, and we need to adjust the size to fit

// availableWidth is determined by putting on flagTexture
// format ['#(rgb,512,512,3)text(2,1,"RobotoCondensed",0.1,"#00000000","#ff0000","%1")', "A##########################A"]
// Add or remove # so that text is fully visible with no cut sides, and anything extra would be cut off.
// then "A##########################A" getTextWidth ["RobotoCondensed", 0.1];
// to get the availableWidth

// How to get the linearConversion limits
// Set texture '#(rgb,512,512,3)text(2,1,"RobotoCondensed",0.1,"#00000000","#ff0000","A")'
// increase size until it barely still fits.
// minFrom = "A" getTextWidth ["RobotoCondensed", 0.1];
// minTo = the size we just determined
// Set texture '#(rgb,512,512,3)text(2,1,"RobotoCondensed",0.1,"#00000000","#ff0000","A##A")'
// Leave size as 0.1. Insert # until it barely fits 
// maxFrom = "A##A" getTextWidth ["RobotoCondensed", 0.1]; (Put in same number of #)
// maxTo = 0.1

private _boxParams = [
	["plasticcase_01_large_f.p3d", {
		[0.1, 2, 1]// Text on side. Top is also possible with values of medium/small. But not both...
	}],
	["plasticcase_01_medium_f.p3d", {
		[0.1, 1, 0] // Text on top
	}],
	["plasticcase_01_small_f.p3d", {
		[0.1, 1, 0] // Text on top
	}],
	["equipment_box_f.p3d", {
		_newName = _newName + "\n";
		 [0.2, 2, 1]
	}],
	["ammobox_f.p3d", {
		// Aligned bottom right, and needs a padding on the right to fit
		_newName = _newName + " \n";
		[0.1, 2, 2] 
	}],
	["wpnsbox_f.p3d", {
		// Needs a headpat...
		_newName = "\n " + _newName;
		[0.1, 0, 0] 
	}],
	["wpnsbox_long_f.p3d", {
		_newName = "\n " + _newName;
		[0.15, 1, 0]
	}],
	["box_uav_06_f.p3d", {
		[1, 1, 1] // No chance, their UV is messed up. We got a region from 0.59,0.49 to 0.68,0.57 not centered or any edge or anything. Just messed up. Would need ui2tex to fix
	}]
];

private _found = _boxParams findIf {_model == (_x select 0)};
(call ((_boxParams param [_found, ["",{[0.3, 1, 1]}]]) select 1)) params ["_size", "_vAlign", "_hAlign"];

//private _size = (-25.65* _expectedWidth^3+ 27.032* _expectedWidth^2 -9.941* _expectedWidth +1.485) min 0.8;
// Works, but bug where 0.280496 text is invisible, but 0.280495 and 0.280497 are working fine... gosh.
//private _size = 0.2;

_box setObjectTextureGlobal [
	_availableSelection, 
	format ['#(rgb,512,512,3)text(%2,%3,"RobotoCondensed",%4,"#00000000","#ff0000","%1")', _newName, _vAlign, _hAlign, _size]
]
*/

// Some we want to choose the non-main one
private _customCamoSelections = [
	["plasticcase_01_small_f.p3d", 1] // camo2
];
private _found = _customCamoSelections findIf {_model == (_x select 0)};
private _selection = (_customCamoSelections param [_found, ["", 0]]) select 1;

private _srcTex = (getArray (configOf _box >> "hiddenSelectionsTextures")) select _selection;

// The display will copy the original texture as background, and overlay texts in appropriate places
_box setObjectTextureGlobal [
	_selection, 
	format ['#(rgb,512,512,3)ui("wolf_logistics_ace_boxName","%1","co")', (str [_model, _srcTex, _newName]) regexReplace ["""", "*"] regexReplace [",", "_._"]]
]

/*
{ 
_class = _x select 0; 
ace_cargo_interactionVehicle = _class createVehicle (getPos player vectorAdd [_forEachIndex, 0, 0]); 
ace_cargo_interactionVehicle setVariable ["ace_cargo_customName", "Testomagico"]; 
call wolf_logistics_ace_fnc_onPostObjectRename; 
 
} forEach 
 
[ 
["ACE_medicalSupplyCrate_advanced",["Camo_Signs","Camo"]],
["Land_WoodenCrate_01_F",[]],
["Land_MetalCase_01_large_F",[]],
["Land_MetalCase_01_medium_F",[]],
["Land_MetalCase_01_small_F",[]],
["Box_IDAP_Equip_F",["camo","camo_signs"]],
["Box_CSAT_Equip_F",["camo","camo_signs"]],
["Box_NATO_Equip_F",["camo","camo_signs"]],
["Box_EAF_Equip_F",["camo","camo_signs"]],
["Box_GEN_Equip_F",["camo","camo_signs"]],
["Land_PlasticCase_01_large_F",["camo"]],
["Land_PlasticCase_01_large_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_large_black_F",["Camo","Camo2"]],
["Land_PlasticCase_01_large_black_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_large_olive_F",["Camo","Camo2"]],
["Land_PlasticCase_01_large_olive_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_large_gray_F",["camo"]],
["Land_PlasticCase_01_large_idap_F",["camo"]],
["Land_PlasticCase_01_medium_F",["camo"]],
["Land_PlasticCase_01_medium_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_medium_black_F",["Camo","Camo2"]],
["Land_PlasticCase_01_medium_black_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_medium_olive_F",["Camo","Camo2"]],
["Land_PlasticCase_01_medium_olive_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_medium_gray_F",["camo"]],
["Land_PlasticCase_01_medium_idap_F",["camo"]],
["Land_PlasticCase_01_small_F",["camo"]],
["Land_PlasticCase_01_small_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_small_black_F",["Camo","Camo2"]],
["Land_PlasticCase_01_small_black_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_small_olive_F",["Camo","Camo2"]],
["Land_PlasticCase_01_small_olive_CBRN_F",["Camo","Camo2"]],
["Land_PlasticCase_01_small_gray_F",["camo"]],
["Land_PlasticCase_01_small_idap_F",["camo"]],
["Box_IND_Ammo_F",["Camo_Signs","Camo"]],
["Box_T_East_Ammo_F",["Camo_Signs","Camo"]],
["Box_East_Ammo_F",["Camo_Signs","Camo"]],
["Box_EAF_Ammo_F",["Camo_Signs","Camo"]],
["Box_NATO_Ammo_F",["Camo_Signs","Camo"]],
["Box_IND_Wps_F",["Camo_Signs","Camo"]],
["Box_T_East_Wps_F",["Camo_Signs","Camo"]],
["Box_East_Wps_F",["Camo_Signs","Camo"]],
["Box_EAF_Wps_F",["Camo_Signs","Camo"]],
["Box_T_NATO_Wps_F",["Camo_Signs","Camo"]],
["Box_NATO_Wps_F",["Camo_Signs","Camo"]],
["Box_IND_WpsLaunch_F",["Camo_Signs","Camo"]],
["Box_East_WpsLaunch_F",["Camo_Signs","Camo"]],
["Box_EAF_WpsLaunch_F",["Camo_Signs","Camo"]],
["Box_NATO_WpsLaunch_F",["Camo_Signs","Camo"]],
["CargoNet_01_box_F",[]],
["Box_C_UAV_06_F",["Camo","Medical"]],
["Box_C_UAV_06_medical_F",["Camo","Medical"]],
["Box_C_IDAP_UAV_06_medical_F",["Camo","Medical"]],
["Box_C_UAV_06_Swifd_F",["Camo","Medical"]],
["Box_C_IDAP_UAV_06_F",["Camo","Medical"]],
["ACE_Wheel",[]],
["ACE_Track",[]],
["Land_CanisterFuel_F",["camo"]],
["rhsusf_props_ScepterMFC_OD",["camo_fc"]],
["FlexibleTank_01_forest_F",["Camo_1"]],
["FlexibleTank_01_sand_F",["Camo_1"]] 
]
 */