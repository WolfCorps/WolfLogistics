#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Alganthe, Dedmen
 * Handles selection changes on loadouts panel.
 *
 * Arguments:
 * 0: Loadouts panel control <CONTROL>
 * 1: Loadouts panel selection <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_curSel"];

private _saveButtonCtrl = _display displayCtrl IDC_buttonSave;
private _packIntoBoxButtonCtrl = _display displayCtrl IDC_buttonPackIntoBox;
private _clearBoxButtonCtrl = _display displayCtrl IDC_buttonClearBox;
private _exportBoxButtonCtrl = _display displayCtrl IDC_buttonShareBox;
private _exportPresetButtonCtrl = _display displayCtrl IDC_buttonSharePreset;
private _renameButtonCtrl = _display displayCtrl IDC_buttonRename;
private _deleteButtonCtrl = _display displayCtrl IDC_buttonDelete;
private _loadoutInfoCtrl = _display displayCtrl IDC_loadoutInfo;
private _textEditBoxCtrl = _display displayCtrl IDC_textLoadoutName;


private _contentPanelCtrl = _display displayCtrl IDC_playerList;
private _playerHash = _contentPanelCtrl lbData _curSel;

private _player = (allPlayers select {hashValue _x == _playerHash}) param [0, objNull];

if (isNull _player) exitWith {};

private _loadout = [_player, name _player, format ["Player inventory view %1", name _player]] call wolf_logistics_main_fnc_createPresetFromPlayer;

private _loadoutDescription = [_loadout] call wolf_logistics_ui_fnc_generateLoadoutDescription;

tvClear _loadoutInfoCtrl;
private _addTreeItem = {
    params ["_item", "_parentPath"];

    if (_item isEqualType []) then {
        private _nodeItem = _loadoutInfoCtrl tvAdd [_parentPath, _item select 1];
        private _nodePath = _parentPath + [_nodeItem];
        _loadoutInfoCtrl tvSetPicture [_nodePath, getText ((_item select 0) >> "picture")];
        _loadoutInfoCtrl tvSetTooltip [_nodePath, configName (_item select 0)]; // Classname tooltip

        if (count _item > 2) then { // item with sub content
            {
                [_x, _nodePath] call _addTreeItem;
            } forEach (_item select 2);
        }
    } else {
        _loadoutInfoCtrl tvAdd [_parentPath, _item];
    }
};

{
    [_x, []] call _addTreeItem;
} forEach _loadoutDescription;

//#TODO extra features, click item in tree and delete it out of existing lodaout

tvExpandAll _loadoutInfoCtrl;

_textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);

// We enable them all, then we disable what we can't have

{
    _x ctrlEnable true;
    _x ctrlCommit 0;
} foreach [
    // First row
    _saveButtonCtrl, _renameButtonCtrl, _deleteButtonCtrl, // Preset edit buttons
    _clearBoxButtonCtrl, _packIntoBoxButtonCtrl, _exportBoxButtonCtrl,
    // Second row
    _exportPresetButtonCtrl
];

// No box
{
	_x ctrlEnable false;
	_x ctrlCommit 0;
} foreach [_saveButtonCtrl, _clearBoxButtonCtrl, _packIntoBoxButtonCtrl, _exportBoxButtonCtrl];

// No preset
{
	_x ctrlEnable false;
	_x ctrlCommit 0;
} foreach [_renameButtonCtrl, _deleteButtonCtrl, _packIntoBoxButtonCtrl, _exportPresetButtonCtrl];





