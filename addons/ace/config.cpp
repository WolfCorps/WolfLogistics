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
    displayName = Buchstabe - let; \
    requiredItem = GVAR(spraypaint); \
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
        requiredItem = GVAR(spraypaint);
        textures[] = {QPATHTOF(data\pointer_ca.paa)};
        materials[] = {QPATHTOF(data\pointer.rvmat)};
        tagModel = "UserTexture10m_F";
    };
    
};

