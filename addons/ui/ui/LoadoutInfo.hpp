#include "RscCommon.hpp"
#include "IDs.hpp"

#define pixelScale  0.25
#define GRID_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_H (pixelH * pixelGridNoUIScale * pixelScale)




class GVAR(loadoutInfo) {
    idd = IDD_loadoutInfo;
    enableSimulation = 1;

    onLoad = QUOTE([_this] call FUNC(onLoadoutInfoOpen));

    class controls {
        class centerBox: ctrlControlsGroupNoScrollbars {
            idc = IDC_centerBox;
            x = QUOTE(safezoneW  + safezoneX - (180 * GRID_W));
            y = QUOTE(safezoneY + (5 * GRID_H));
            w = QUOTE(160 * GRID_W);
            h = QUOTE(safezoneH - (34 * GRID_H));
            class controls {
                class centerFrame: RscFrame {
                    idc = -1;
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(0 * GRID_H);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(safezoneH - (45 * GRID_H));
                    colorText[] = {0,0,0,1};
                };
                class centerBackground: ctrlStaticBackground {
                    idc = -1;
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(safezoneH - (45 * GRID_H));
                    colorBackground[] = {0.13,0.13,0.13,0.9};
                };
                class centerTitle: ctrlStaticTitle {
                    idc = IDC_centerTitle;
                    style = ST_CENTER;
                    text = "";
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(5 * GRID_H);
                };
                class contentPanel: RscListNBox {
                    idc = IDC_contentPanel;
                    columns[]={0, 0.05, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90};
                    drawSideArrows=0;
                    disableOverflow=1;
                    onSetFocus = QUOTE(GVAR(loadoutsPanelFocus) = true);
                    onKillFocus = QUOTE(GVAR(loadoutsPanelFocus) = false);
                    onLBSelChanged = QUOTE([ARR_3(ctrlParent (_this select 0), _this select 0, _this select 1)] call FUNC(onSelChangedLoadouts));
                    onLBDblClick = QUOTE([ARR_2(ctrlParent (_this select 0), (ctrlParent (_this select 0)) displayCtrl IDC_buttonLoad)] call FUNC(buttonLoadoutsLoad));
                    x = QUOTE(0);
                    y = QUOTE(5 * GRID_H);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(safezoneH - (57 * GRID_H));
                    sizeEx = QUOTE(7 * GRID_H);
                };
                class textTitle: RscText {
                    idc= -1;
                    text="$STR_DISP_GAME_NAME";
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(safezoneH - (51 * GRID_H));
                    w = QUOTE(15 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(5 * GRID_H);
                    colorBackground[]={0,0,0,0.2};
                };
                class textEditBox: ctrlEdit {
                    idc= IDC_textEditBox;
                    x = QUOTE(15 * GRID_W);
                    y = QUOTE(safezoneH - (51 * GRID_H));
                    w = QUOTE(65 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(6 * GRID_H);
                };
                class loadoutsSearchbar: ctrlEdit {
                    idc = IDC_loadoutsSearchbar;
                    onSetFocus = QUOTE(GVAR(searchbarFocus) = true);
                    onKillFocus = QUOTE(GVAR(searchbarFocus) = false);
                    //onMouseButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0), _this select 0, _this select 1)] call FUNC(clearSearchbar));
                    x = QUOTE(83 * GRID_W);
                    y = QUOTE(safezoneH - (51 * GRID_H));
                    w = QUOTE(72 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(6 * GRID_H);
                };
                class loadoutsSearchbarButton: ctrlButtonPicture {
                    idc = -1;
                    text = "\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
                    colorBackground[]={0,0,0,0.5};
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0), ctrlParent (_this select 0) displayCtrl IDC_loadoutsSearchbar)] call FUNC(handleLoadoutsSearchbar));
                    x = QUOTE(155 * GRID_W);
                    y = QUOTE(safezoneH - (51 * GRID_H));
                    w = QUOTE(5 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                };
                class buttonSave: ctrlButton {
                    idc = IDC_buttonSave;
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(safezoneH - (44 * GRID_H));
                    w = QUOTE(30 * GRID_W);
                    h = QUOTE(10 * GRID_H);
                    text = "Speichern";
                    tooltip= "Speichert den Kisteninhalt als neues Paket";
                    sizeEx = QUOTE(5 * GRID_H);
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsSave));
                    colorBackground[] = {0,0,0,0.8};
                };
                //class buttonRename: buttonSave {
                //    idc = IDC_buttonRename;
                //    x = QUOTE(32.5 * GRID_W);
                //    text = "Rename";
                //    tooltip = "Benennt das gespeicherte Paket um";
                //    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsRename));
                //};
                class buttonLoad: buttonSave {
                    idc = IDC_buttonLoad;
                    x = QUOTE(65 * GRID_W);
                    w = QUOTE(60 * GRID_W);
                    text = "In Kiste packen";
                    tooltip= "Packt das ausgewählte Paket die Kiste";
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsLoad));
                };
                class buttonExport: buttonSave {
                    idc = IDC_buttonShare;
                    x = QUOTE(127.5 * GRID_W);
                    text = "Export";
                    tooltip= "Exportiert Kisteninhalt als Paket in Zwischenablage";
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsExport));
                };
                class buttonDelete: buttonSave {
                    idc = IDC_buttonDelete;
                    x = QUOTE(32.5 * GRID_W);
                    text = "Leere Kiste";
                    tooltip = "Löscht den gesamten Inhalt der Kiste";
                    colorBackgroundActive[] = {0.5,0,0,1};
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsClearBox));
                };
            };
        };
        class buttonClose: ctrlButton {
            idc = -1;
            x = QUOTE(safezoneW  + safezoneX - 32 * GRID_W);
            y = QUOTE(safezoneH + safezoneY - 9 * GRID_H);
            w = QUOTE(30 * GRID_W);
            h = QUOTE(7 * GRID_H);
            sizeEx = QUOTE(5 * GRID_H);
            text = "Close";
            shortcuts[]= {"0x01"};
            tooltip= "";
            onButtonClick = QUOTE(ctrlParent (_this select 0) closeDisplay 2);
        };

        class loadoutInfo: RscTree {
            idc = IDC_loadoutInfo;
            //text = "";
            //type = 13; //CT_STRUCTURED_TEXT;  // defined constant
            x = QUOTE(safezoneX + (5 * GRID_W));
            y = QUOTE(safezoneY + (5 * GRID_H));
            w = QUOTE(200 * GRID_W);
            h = QUOTE(safezoneH - (34 * GRID_H));
            sizeEx = QUOTE(5 * GRID_H);
            colorBackground[]={0,0,0,0.8};
        };



    };

};
