#include "script_component.hpp"
/*
 * Author: Dedmen
 * Returns logistik child actions to be placed on an Arsenal's Wolf Logistics category
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * [cursorObject] call wolf_logistics_ace_fnc_addLogistikArsenalActions
 *
 * Public: No
 */

#pragma hemtt flag pe23_ignore_has_include
#pragma ASC_ignoreFile

#define SPAWNBOX(text, classname) \
    [ \
        [QGVAR(__COUNTER__), text, "", {[classname, true] call FUNC(spawnEquipBox);}, {true}, {}] call ace_interact_menu_fnc_createAction, [], _target \
    ]

#define SPAWNBOX_WITHLOAD(text, classname) \
    [ \
        [QGVAR(__COUNTER__), text + format[" (%1)", getNumber (configFile >> "CfgVehicles" >> classname >> "maximumLoad")], "", {[classname, true] call FUNC(spawnEquipBox);}, {true}, {}] call ace_interact_menu_fnc_createAction, [], _target \
    ]

#define SPAWNBOX_SEL1TEX(text, classname, texture) \
    [ \
        [QGVAR(openLogistikMenu), text, "", {[classname, true, [1, texture]] call FUNC(spawnEquipBox);}, {true}, {}] call ace_interact_menu_fnc_createAction, [], _target \
    ]

[
    [
        [QGVAR(openLogistikMenu), "Öffne Logistikmenü", "", {_target call wolf_logistics_ui_fnc_openLogistikMenuOnBox;}, {true}, {}] call ace_interact_menu_fnc_createAction,
        [],
        _target
    ],

    SPAWNBOX_WITHLOAD("Spawn Medicbox", 'ACE_medicalSupplyCrate_advanced'),
    SPAWNBOX_WITHLOAD("Spawn Holzkiste", 'Land_WoodenCrate_01_F'),
    [
        [QGVAR(__COUNTER__), "Spawn Graue Metallbox...", "", {}, {true}, {
            params ["_target"];
            [
                SPAWNBOX_WITHLOAD("Groß", 'Land_MetalCase_01_large_F'),
                SPAWNBOX_WITHLOAD("Mittel", 'Land_MetalCase_01_medium_F'),
                SPAWNBOX_WITHLOAD("Klein", 'Land_MetalCase_01_small_F')
            ]
        }] call ace_interact_menu_fnc_createAction, [], _target
    ],
    [
        [QGVAR(__COUNTER__), "Spawn Metallbox...", "", {}, {true}, {
            params ["_target"];
            [
                SPAWNBOX_WITHLOAD("Weiß", 'Box_IDAP_Equip_F'),
                SPAWNBOX_WITHLOAD("Hellgrün", 'Box_CSAT_Equip_F'),
                SPAWNBOX_WITHLOAD("Nato", 'Box_NATO_Equip_F'),
                SPAWNBOX_WITHLOAD("Schwarz", 'Box_EAF_Equip_F'),
                SPAWNBOX_WITHLOAD("Dunkelblau", 'Box_GEN_Equip_F')
            ]
        }] call ace_interact_menu_fnc_createAction, [], _target
    ],
    [
        [QGVAR(__COUNTER__), "Spawn Plastik...", "", {}, {true}, {
            params ["_target"];
            [
                [
                    [QGVAR(__COUNTER__), "Groß...", "", {}, {true}, {
                        params ["_target"];
                        [
                            SPAWNBOX_WITHLOAD("Standard", 'Land_PlasticCase_01_large_F'),
                            SPAWNBOX_WITHLOAD("Standard CBRN", 'Land_PlasticCase_01_large_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Schwarz", 'Land_PlasticCase_01_large_black_F'),
                            SPAWNBOX_WITHLOAD("Schwarz CBRN", 'Land_PlasticCase_01_large_black_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Oliv", 'Land_PlasticCase_01_large_olive_F'),
                            SPAWNBOX_WITHLOAD("Oliv CBRN", 'Land_PlasticCase_01_large_olive_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Grau", 'Land_PlasticCase_01_large_gray_F'),
                            SPAWNBOX_WITHLOAD("Weiß IDAP", 'Land_PlasticCase_01_large_idap_F')
                        ]
                    }] call ace_interact_menu_fnc_createAction, [], _target
                ],
                [
                    [QGVAR(__COUNTER__), "Mittel...", "", {}, {true}, {
                        params ["_target"];
                        [
                            SPAWNBOX_WITHLOAD("Standard", 'Land_PlasticCase_01_medium_F'),
                            SPAWNBOX_WITHLOAD("Standard CBRN", 'Land_PlasticCase_01_medium_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Schwarz", 'Land_PlasticCase_01_medium_black_F'),
                            SPAWNBOX_WITHLOAD("Schwarz CBRN", 'Land_PlasticCase_01_medium_black_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Oliv", 'Land_PlasticCase_01_medium_olive_F'),
                            SPAWNBOX_WITHLOAD("Oliv CBRN", 'Land_PlasticCase_01_medium_olive_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Grau", 'Land_PlasticCase_01_medium_gray_F'),
                            SPAWNBOX_WITHLOAD("Weiß IDAP", 'Land_PlasticCase_01_medium_idap_F')
                        ]
                    }] call ace_interact_menu_fnc_createAction, [], _target
                ],
                [
                    [QGVAR(__COUNTER__), "Klein...", "", {}, {true}, {
                        params ["_target"];
                        [
                            SPAWNBOX_WITHLOAD("Standard", 'Land_PlasticCase_01_small_F'),
                            SPAWNBOX_WITHLOAD("Standard CBRN", 'Land_PlasticCase_01_small_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Schwarz", 'Land_PlasticCase_01_small_black_F'),
                            SPAWNBOX_WITHLOAD("Schwarz CBRN", 'Land_PlasticCase_01_small_black_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Oliv", 'Land_PlasticCase_01_small_olive_F'),
                            SPAWNBOX_WITHLOAD("Oliv CBRN", 'Land_PlasticCase_01_small_olive_CBRN_F'),
                            SPAWNBOX_WITHLOAD("Grau", 'Land_PlasticCase_01_small_gray_F'),
                            SPAWNBOX_WITHLOAD("Weiß IDAP", 'Land_PlasticCase_01_small_idap_F')
                        ]
                    }] call ace_interact_menu_fnc_createAction, [], _target
                ],
                [
                    [QGVAR(__COUNTER__), "Ammo...", "", {}, {true}, {
                        params ["_target"];
                        [
                            SPAWNBOX_WITHLOAD("Weiß", 'Box_IND_Ammo_F'),
                            SPAWNBOX_WITHLOAD("Braun", 'Box_T_East_Ammo_F'),
                            SPAWNBOX_WITHLOAD("Hellgrün", 'Box_East_Ammo_F'),
                            SPAWNBOX_WITHLOAD("Schwarz", 'Box_EAF_Ammo_F'),
                            SPAWNBOX_WITHLOAD("NATO", 'Box_NATO_Ammo_F')
                        ]
                    }] call ace_interact_menu_fnc_createAction, [], _target
                ],
                [
                    [QGVAR(__COUNTER__), "Weapon...", "", {}, {true}, {
                        params ["_target"];
                        [
                            SPAWNBOX_WITHLOAD("Weiß", 'Box_IND_Wps_F'),
                            SPAWNBOX_WITHLOAD("Braun", 'Box_T_East_Wps_F'),
                            SPAWNBOX_WITHLOAD("Hellgrün", 'Box_East_Wps_F'),
                            SPAWNBOX_WITHLOAD("Schwarz", 'Box_EAF_Wps_F'),
                            SPAWNBOX_WITHLOAD("NATO Dschungel-Grün", 'Box_T_NATO_Wps_F'),
                            SPAWNBOX_WITHLOAD("NATO", 'Box_NATO_Wps_F')
                        ]
                    }] call ace_interact_menu_fnc_createAction, [], _target
                ],
                [
                    [QGVAR(__COUNTER__), "Launcher...", "", {}, {true}, {
                        params ["_target"];
                        [
                            SPAWNBOX_WITHLOAD("Weiß", 'Box_IND_WpsLaunch_F'),
                            SPAWNBOX_WITHLOAD("Hellgrün", 'Box_East_WpsLaunch_F'),
                            SPAWNBOX_WITHLOAD("Schwarz", 'Box_EAF_WpsLaunch_F'),
                            SPAWNBOX_WITHLOAD("NATO", 'Box_NATO_WpsLaunch_F')
                        ]
                    }] call ace_interact_menu_fnc_createAction, [], _target
                ]
            ]
        }] call ace_interact_menu_fnc_createAction, [], _target
    ],
    SPAWNBOX_WITHLOAD("Spawn Transportnetz", 'CargoNet_01_box_F'),
    [
        [QGVAR(__COUNTER__), "Spawn UAV Box...", "", {}, {true}, {
            params ["_target"];
            [
                SPAWNBOX_WITHLOAD("Schwarz", 'Box_C_UAV_06_F'),
                SPAWNBOX_WITHLOAD("Medical Gelb", 'Box_C_UAV_06_medical_F'),
                SPAWNBOX_WITHLOAD("Medical Rot", 'Box_C_IDAP_UAV_06_medical_F'),
                SPAWNBOX_WITHLOAD("Blau", 'Box_C_UAV_06_Swifd_F'),
                SPAWNBOX_WITHLOAD("Weiß", 'Box_C_IDAP_UAV_06_F')
            ]
        }] call ace_interact_menu_fnc_createAction, [], _target
    ],
    [
        [QGVAR(__COUNTER__), "Spawn ACE...", "", {}, {true}, {
            params ["_target"];
           [
                SPAWNBOX("Spare Wheel", 'ACE_Wheel'),
                SPAWNBOX("Spare Track", 'ACE_Track'),
                SPAWNBOX("Jerrycan 20L", 'Land_CanisterFuel_F'),
				#if __has_include ("\rhsusf\addons\rhsusf_main\config.bin")
                SPAWNBOX("Jerrycan 20L RHS", 'rhsusf_props_ScepterMFC_OD'),
				#endif
                SPAWNBOX("Flextank 300L Forest", 'FlexibleTank_01_forest_F'),
                SPAWNBOX("Flextank 300L Sand", 'FlexibleTank_01_sand_F')
           ]
        }] call ace_interact_menu_fnc_createAction, [], _target
    ]
]