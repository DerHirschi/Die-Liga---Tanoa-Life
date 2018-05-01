#include "..\..\Liga_script_macros.hpp"
/*
    Sending robbery-request to server 
*/
private["_shop","_robber"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;

if((west countSide playableUnits) < 2) exitWith { hint "Die Kasse ist leer, komm später vorbei!"};//This line has been commented out, but can be set so that you can limit the ability to robb based on cops online.
if(isNull _shop OR isNull _robber) exitWith {};
if(side _robber != civilian) exitWith { hint "Du bist ein Cop! " };// We do not want anyone but civilianz to rob the stations.
if (vehicle player != _robber) exitWith { hint "Raus aus dem Fahrzeug du Pussy!" };
if (EQUAL(currentWeapon _robber,"") || EQUAL(currentWeapon _robber,"Rangefinder") || EQUAL(currentWeapon _robber,"Binocular")) exitWith { hint "HaHa, du machst mir keine Angst , ab raus hier du Lappen !!" };//is he trying to rob without a weapon? Lets taunt him a bit!
if(_robber distance _shop > 4) exitWith { hint "Du bist zu weit weg!" };
[_shop,_robber,_action] remoteExecCall ["TON_fnc_robShops",RSERV];