#include "script_component.hpp"
/*
 * Author: Dedmen
 * Spawn boxy
 *
 * Arguments:
 * 0: todo <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [todo] call wolf_logistics_ace_fnc_spawnEquipBox
 *
 * Public: No
 */
params ["_boxname", "_empty", "_hiddenSelectionTextures"];

private _box = createVehicle [_boxname, getPos player vectorAdd [0,0,-50], [], 0, "CAN_COLLIDE"];
_box setPosASL (getPosASL player vectorAdd (vectorDir player));
 
 
if (_empty) then {
    clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
    clearMagazineCargoGlobal _box;
};

_box setVariable ["ace_dragging_ignoreWeightCarry", true, true];
_box setVariable ["ace_dragging_ignoreWeightDrag", true, true];

if (!isNil "_hiddenSelectionTextures") then {
    {_box setObjectTextureGlobal _x} forEach _hiddenSelectionTextures;
};

if !(_box getVariable ["ace_dragging_canCarry", false]) then {
    // Need to make carryable
    [_box, true, [0,1,1], 0, true] call ace_dragging_fnc_setCarryable;
};

if !(_box getVariable ["ace_dragging_canDrag", false]) then {
    // Need to make carryable
    [_box, true, [0,0,0], 0, true] call ace_dragging_fnc_setDraggable;
};


[player, _box] call ace_dragging_fnc_carryObject;