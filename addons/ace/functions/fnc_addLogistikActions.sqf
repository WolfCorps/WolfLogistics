#include "script_component.hpp"
/*
 * Author: Dedmen
 * Returns logistik child actions
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * [cursorObject] call wolf_logistik_fnc_addLogistikActions
 *
 * Public: No
 */
params ["_target"];
private _actions = [

		[
			[QGVAR(openLogistikMenu), "Öffne Logistikmenü", "", {_target call wolf_logistics_ui_fnc_openLogistikMenuOnBox;}, {true}, {}] call ace_interact_menu_fnc_createAction,
			[],
			_target
		],
		[
			[QGVAR(openLogistikMenu), "Rucksack in Kiste leeren", "", {_target call wolf_logistics_ace_fnc_emptyBackpackIntoBox;}, {true}, {}] call ace_interact_menu_fnc_createAction,
			[],
			_target
		],
		[
			[QGVAR(openLogistikMenu), "Kisteninhalt löschen", "", {    
				_target spawn {
					private _result = ["Bist du sicher das du den Inhalt dieser Kiste löschen willst?", "Wolf Logistics", "Ja, Löschen", "Nein, Behalten"] call BIS_fnc_guiMessage;

					if (_result) then {
						clearItemCargoGlobal _this;
						clearMagazineCargoGlobal _this;
						clearWeaponCargoGlobal _this;
						clearBackpackCargoGlobal _this;
					};
				};
			}, {true}, {}] call ace_interact_menu_fnc_createAction,
			[],
			_target
		],
		[
			[QGVAR(openLogistikMenu), "Kiste löschen", "", {    
				_target spawn {
					private _result = ["Bist du sicher das du diese Kiste löschen willst?", "Wolf Logistics", "Ja, Löschen", "Nein, Behalten"] call BIS_fnc_guiMessage;

					if (_result) then {
						deleteVehicle _this;
					};
				};
			}, {["AllVehicles", "LandVehicle", "Air"] findIf {_target isKindOf _x} == -1}, {}] call ace_interact_menu_fnc_createAction,
			[],
			_target
		]
];

if (isClass (configFile>>"CfgPatches">>"zen_loadout")) then {_actions pushBack [[QGVAR(openLogistikMenu), "Öffne Loadout-Editor", "", {[_target] call zen_loadout_fnc_configure;}, {true}, {}] call ace_interact_menu_fnc_createAction, [], _target]};

_actions;
