#include "script_component.hpp"

GVAR(lastSearchTextLoadouts) = "";
GVAR(arsenalTypes) = ["wolf_arsenal_point","wolf_arsenal_point2","wolf_foxenal_point","wolf_foxenal_point_sit","wolf_foxenal_point_small","wolf_foxenal_point_sit_small","wolf_suitcase_arsenal","wolf_trophy_arsenal","wolf_ammobox_arsenal","wolf_fdr_arsenal","wolf_bacon_arsenal","wolf_microwave_arsenal","wolf_pctower_arsenal","wolf_helipadlight_arsenal"];
GVAR(initializedItemClasses) = [];

GVAR(objectAction) = [
    QGVAR(logistik), "Wolf Logistik", "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa",
    {},
    { //Condition
        ([_player, _target, ["isNotSwimming"]] call ace_common_fnc_canInteractWith) &&
        {count (nearestObjects [_target, GVAR(arsenalTypes), 50]) > 0}
    },
    LINKFUNC(addLogistikActions)
] call ace_interact_menu_fnc_createAction;



//Add stuff from ace cargo XEH_preStart



private _vehicleClassesAddAction = call (uiNamespace getVariable ["ace_cargo_initializedVehicleClasses", {[]}]);
{
    [_x, 0, ["ACE_MainActions"], GVAR(objectAction)] call ace_interact_menu_fnc_addActionToClass;
} forEach _vehicleClassesAddAction;
GVAR(initializedItemClasses) append _vehicleClassesAddAction;

private _objectClassesAddAction = call (uiNamespace getVariable ["ace_cargo_initializedItemClasses", {[]}]);
{
    [_x, 0, ["ACE_MainActions"], GVAR(objectAction)] call ace_interact_menu_fnc_addActionToClass;
} forEach _objectClassesAddAction;
GVAR(initializedItemClasses) append _objectClassesAddAction;


private _objectClassesAddClassEH = call (uiNamespace getVariable ["ace_cargo_objectClasses_classEH", {[]}]);
{
    [_x, "initPost", DFUNC(initObject), nil, nil, true] call CBA_fnc_addClassEventHandler;
} forEach _objectClassesAddClassEH;


private _vehicleClassesAddClassEH = call (uiNamespace getVariable ["ace_cargo_vehicleClasses_classEH", {[]}]);
{
    [_x, "initPost", DFUNC(initObject), nil, nil, true] call CBA_fnc_addClassEventHandler;
} forEach _vehicleClassesAddClassEH;


