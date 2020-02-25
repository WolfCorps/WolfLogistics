#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Alganthe
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
private _loadButtonCtrl = _display displayCtrl IDC_buttonLoad;
private _deleteButtonCtrl = _display displayCtrl IDC_buttonDelete;
private _renameButtonCtrl = _display displayCtrl IDC_buttonRename;
private _loadoutInfoCtrl = _display displayCtrl IDC_loadoutInfo;
private _textEditBoxCtrl = _display displayCtrl IDC_textEditBox;


private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _loadoutName = _contentPanelCtrl lnbText [_curSel, 1];

private _loadout = _contentPanelCtrl getVariable _loadoutName;

_loadoutInfoCtrl ctrlSetStructuredText parseText ([_loadout] call wolf_logistics_ui_fnc_generateLoadoutDescription);
//_loadoutInfoCtrl ctrlSetText ([_loadout] call wolf_logistics_ui_fnc_generateLoadoutDescription);


if (_curSel == -1 || GVAR(center) isEqualTo objNull) exitWith {
    {
        _x ctrlEnable false;
        _x ctrlCommit 0;
    } foreach [_saveButtonCtrl, _loadButtonCtrl, _deleteButtonCtrl, _renameButtonCtrl];
};

_loadButtonCtrl ctrlEnable true;
_loadButtonCtrl ctrlCommit 0;

{
    _x ctrlEnable true;
    _x ctrlCommit 0;
} foreach [_renameButtonCtrl, _deleteButtonCtrl];


_textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);

