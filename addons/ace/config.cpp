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
