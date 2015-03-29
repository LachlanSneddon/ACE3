// by commy2
#include "script_component.hpp"

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 dragObjectPFH running", time];
#endif

private ["_unit", "_target"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;

if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// drop if the crate is destroyed
if !([_target] call EFUNC(common,isAlive)) then {
    [_unit, _target] call FUNC(dropObject);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};
