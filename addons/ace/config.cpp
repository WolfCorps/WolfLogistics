#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"wolf_logistics_ui"};
        author = "";
        authors[] = {"Wolf Corps"};
        authorUrl = "https://wolfcorps.de";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

// https://github.com/acemod/ACE3/blob/master/addons/attach/CfgVehicles.hpp#L2
// Let me attach chemlights / gps trackers to boxes
#define MACRO_ATTACHTOVEHICLE \
    class ACE_Actions { \
        class ACE_MainActions { \
            class ace_attach_AttachVehicle { \
                displayName = "$STR_ace_attach_AttachDetach"; \
                condition = "_this call ace_attach_fnc_canAttach"; \
                insertChildren = "_this call ace_attach_fnc_getChildrenActions"; \
                exceptions[] = {"isNotSwimming"}; \
                showDisabled = 0; \
                icon = "\z\ace\addons\attach\UI\attach_ca.paa"; \
            }; \
            class ace_attach_DetachVehicle { \
                displayName = "$STR_ace_attach_Detach"; \
                condition = "_this call ace_attach_fnc_canDetach"; \
                statement = "_this call ace_attach_fnc_detach"; \
                exceptions[] = {"isNotSwimming"}; \
                showDisabled = 0; \
                icon = "\z\ace\addons\attach\UI\detach_ca.paa"; \
            }; \
        }; \
    };

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_SelfActions {
                class GVAR(aceself) {
                    displayName = "Wolf Logistik";
                    condition = QUOTE(true);
                    statement = "";
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 0;
                    icon = "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa";

                    class GVAR(OpenPresetInfo) {
                        displayName = "Öffne Logistik Info";
                        condition = QUOTE(true);
                        statement = QUOTE(call wolf_logistics_ui_fnc_openPresetInfo);
                        exceptions[] = {"isNotSwimming"};
                        showDisabled = 1;
                        icon = "";
                    };
                };
            };
        };
    };

    class Items_base_F;
    class rhsusf_props_JerryCan_Base: Items_base_F {
        ace_cargo_size = 1;
        ace_cargo_canLoad = 1;
        MACRO_ATTACHTOVEHICLE
    };

    class ThingX;
    class FlexibleTank_base_F: ThingX {
        ace_cargo_size = 3;
        ace_cargo_canLoad = 1;
        MACRO_ATTACHTOVEHICLE
    };

    class PlasticCase_01_base_F: ThingX {
        MACRO_ATTACHTOVEHICLE
    };

    class ReammoBox_F: ThingX {
        MACRO_ATTACHTOVEHICLE
    };
};

class CfgWeapons {
    class ACE_SpraypaintBlack;
    class GVAR(spraypaint) : ACE_SpraypaintBlack {
        author = "dedmen";
        displayName = "Logistik Sprühfarbe";
    };
};

class ACE_Tags {
    class ACE_XBlack;

#define LETTER(let) \
class GVAR(letter_##let) : ACE_XBlack { \
    displayName = QUOTE(Buchstabe - let); \
    requiredItem = QGVAR(spraypaint); \
    textures[] = {QPATHTOF(data\letter_##let##_ca.paa)}; \
    materials[] = {QPATHTOF(data\letter_##let.rvmat)}; \
    tagModel = "UserTexture10m_F"; \
}

    LETTER(A);
    LETTER(B);
    LETTER(C);
    LETTER(D);
    LETTER(E);
    LETTER(F);
    LETTER(G);
    LETTER(H);
    LETTER(X);
    LETTER(Y);
    LETTER(Z);

    class GVAR(pointer) : ACE_XBlack {
        displayName = "Pfeil";
        requiredItem = QGVAR(spraypaint);
        textures[] = {QPATHTOF(data\pointer_ca.paa)};
        materials[] = {QPATHTOF(data\pointer.rvmat)};
        tagModel = "UserTexture10m_F";
    };
};

// I don't like this either, but ACE uses a special onUnload, making the DisplayUnload EH non-functional, and there are no other eventhandlers to grab this
class ace_cargo_renameMenu {
    class controls {
        class HeaderName {
            onDestroy = QUOTE(call FUNC(onPostObjectRename)); // When the display is closed, without messing with the existing onUnload EH of the display
        };
    };
};

class RscEmpty;
class RscPicture;
class GVAR(boxName) : RscEmpty
{
    idd = -1; // Will be accessed by variable via onLoad
    movingEnable = 0;
    onLoad = QUOTE(call FUNC(initBoxNameDisplay));
    class controlsBackground {
        class SrcTex : RscPicture
        {
            idc = 1;
            x = 0;
            y = 0;
            w = 1;
            h = 1;
            // Text will be set by init to original texture path
        };
    };
    class controls {};
};