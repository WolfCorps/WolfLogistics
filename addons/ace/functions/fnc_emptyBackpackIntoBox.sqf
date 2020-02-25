#include "script_component.hpp"
/*
 * Author: Dedmen
 * Empty player backpack into box
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call wolf_logistics_ace_fnc_emptyBackpackIntoBox
 *
 * Public: No
 */

params ["_target"];

{
    _target addWeaponWithAttachmentsCargoGlobal [_x, 1];
} forEach weaponsItemsCargo backpackContainer ACE_Player;

private _magazineCargo = getMagazineCargo backpackContainer ACE_Player;

{
    _target addItemCargoGlobal [_x, (_magazineCargo select 1) select _forEachIndex];
} forEach (_magazineCargo select 0);


private _itemCargo = getItemCargo backpackContainer ACE_Player;

{
    _target addItemCargoGlobal [_x, (_itemCargo select 1) select _forEachIndex];
} forEach (_itemCargo select 0);

clearAllItemsFromBackpack ACE_Player;
