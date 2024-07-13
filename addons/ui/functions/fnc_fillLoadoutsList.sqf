#include "script_component.hpp"
#include "..\ui\IDs.hpp"
/*
 * Author: Alganthe, dedmen
 * Fill loadouts list.
 *
 * Arguments:
 * 0: Loadouts display <DISPLAY>
 * 1: Tab control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display"];

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _textEditBoxCtrl= _display displayCtrl IDC_textLoadoutName;
_textEditBoxCtrl ctrlSetText "";

// Force a "refresh" animation of the panel
_contentPanelCtrl ctrlSetFade 1;
_contentPanelCtrl ctrlCommit 0;
_contentPanelCtrl ctrlSetFade 0;
_contentPanelCtrl ctrlCommit FADE_DELAY;

_contentPanelCtrl lnbSetCurSelRow -1;
lnbClear _contentPanelCtrl;

private _data = GVAR(presets);

{
    _x params ["_loadoutName", "_loadoutDescription", "_loadoutData"];

    _contentPanelCtrl lnbSetColumnsPos [0, 0.05, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];

    private _newRow = _contentPanelCtrl lnbAddRow ["",_loadoutName];

    _contentPanelCtrl setVariable [_loadoutName, _x];
} foreach _data;


//[QGVAR(loadoutsListFilled), [_display, _control]] call CBA_fnc_localEvent;

_contentPanelCtrl lnbSort [1, false];
