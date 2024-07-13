class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

// Make RHS jerrycan usable in ACE https://github.com/acemod/ACE3/pull/8603
class Extended_InitPost_EventHandlers {
    class rhsusf_props_JerryCan_Base {
        class ADDON {
            init = "call ace_refuel_fnc_makeJerryCan";
        };
    };
};
