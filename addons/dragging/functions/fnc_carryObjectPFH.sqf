// by commy2
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;

if (
    !([_unit] call EFUNC(common,isAlive))           // drop if the player is dead
    || {!([_target] call EFUNC(common,isAlive))}    // drop if the crate is destroyed
    || {currentWeapon _unit != ""}
    || {stance _unit != "STAND"}                    // drop when crouching or inside a vehicle
    || {!([_unit] call EFUNC(common,isPlayer))}
) then {
    [_unit, _target] call FUNC(dropObject_carry);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};
