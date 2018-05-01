#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	Vorlage:Tonic´s Altis RPG (fn_sellTank.sqf)

	LIGACL_fnc_sellTank 
	
*/

private["_house","_uid","_action","_houseCfg","_index"];
_house = param [0,ObjNull,[ObjNull]];
_uid = steamid;

if(isNull _house) 						exitWith {};
if!(typeOf _house in ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"]) exitWith {};
if(isNil {_house GVAR "house_owner"}) 	exitWith {hint "Die Tankstelle gehoert dir nicht..."};


_preis = M_CONFIG(getNumber,"Ligaworld","Liga_Tankstellen","TankstVerkPreis");

_action = [
	format["Bist Du sicher, dass du die Tankstelle verkaufen möchtest? Sie wird für %1 $ verkauft",
	[_preis] call life_fnc_numberText],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;


if(_action) then {
	_house SVAR ["house_sold",true,true];	
	[_house] remoteExecCall ["TON_fnc_sellTank",RSERV];	
	_house SVAR ["locked",false,true];	
	_house SVAR ["Trunk",nil,true];			
	_house SVAR ["TankPreis",nil,true];	
	_house SVAR ["Kasse",nil,true];
	
	deleteMarkerLocal format["tankst_%1",_house GVAR "uid"];	
	_house SVAR ["uid",nil,true];
	
	_flag = _preis;
	BANK = BANK + _flag;
	_index = life_vehicles find _house;
	
	_log = [player, player, _flag, 8, BANK, CASH];
	LOG_to_HC(0,_log);
	
	[6] call SOCK_fnc_updatePartial;	
	
	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),liga_tankhouses] call TON_fnc_index;
	if(_index != -1) then {
		liga_tankhouses set[_index,-1];
		liga_tankhouses = liga_tankhouses - [-1];
	};
};
