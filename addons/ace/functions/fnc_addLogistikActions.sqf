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

[

    [
        [QGVAR(openLogistikMenu), "Öffne Logistikmenü", "", {_target call wolf_logistics_ui_fnc_openLogistikMenuOnBox;}, {true}, {}] call ace_interact_menu_fnc_createAction,
        [],
        _target
    ]

]
