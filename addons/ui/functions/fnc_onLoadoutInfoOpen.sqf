#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: dedmen
 * onLoad EH for LoadoutInfo.
 *
 * Arguments:
 * 0: Ignored
 * 1: Arguments <ARRAY>
  * 1.1: LoadoutInfo display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_args"];
_args params ["_display"];


[_display] call FUNC(fillLoadoutsList);
_display call FUNC(updateBoxFillState);

private _playerListCtrl = _display displayCtrl IDC_playerList;
lbClear _playerListCtrl;

// Can select any player within 100m and display their inventory contents

{
    private _index = _playerListCtrl lbAdd name _x;
    _playerListCtrl lbSetData [_index, hashValue _x];
} forEach (allPlayers select {_x distance player < 100});

