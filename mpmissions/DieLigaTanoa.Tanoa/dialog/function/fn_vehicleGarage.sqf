#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type","_side"];
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _spawnPos) exitWith {};
if(!isClass (missionConfigFile >> "LigaHousingClass" >> typeOf _spawnPos)) exitWith {};
_confArr = M_CONFIG(getArray,"LigaHousingClass",(typeOf _spawnPos),"GaragSP");

life_garage_sp = [(_spawnPos modelToWorld SEL(_confArr,0)),(getDir _spawnPos) - (SEL(_confArr,1))];
life_garage_type = _type;

_side = "civ";
if(playerSide in [civilian,independent]) then {		
	if(liga_cop_on) then {_side = "cop";};	
	if(liga_lrk_on) then {_side = "med";};	
}else{	
	_side = switch(playerSide) do {
		case west: {"cop"}; 
		//case independent: {"med"}; 
		case east: {"alac"};
		//default {"civ"};
	};			
};

[getPlayerUID player,_side,_type,player] remoteExec ["TON_fnc_getVehicles",RSERV];
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];

