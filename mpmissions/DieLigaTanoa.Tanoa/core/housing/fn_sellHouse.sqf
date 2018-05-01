#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the house?
*/
private["_uid","_action","_houseCfg","_index"];

_uid = steamid;

if(isNull life_pInact_curTarget) exitWith {};
if(!(life_pInact_curTarget isKindOf "House_F")) exitWith {};
if(isNil {life_pInact_curTarget GVAR "house_owner"}) exitWith {hint "Das Haus gehoert dir nicht..."};
closeDialog 0;

_houseCfg = [(typeOf life_pInact_curTarget)] call life_fnc_houseConfig;
if(EQUAL(count _houseCfg,0)) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round(SEL(_houseCfg,0)/2)) call life_fnc_numberText,
	SEL(_houseCfg,1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	life_pInact_curTarget SVAR ["house_sold",true,true];	
	[life_pInact_curTarget] remoteExecCall ["TON_fnc_sellHouse",RSERV];	
	life_pInact_curTarget SVAR ["locked",false,true];		
	life_pInact_curTarget SVAR ["Trunk",nil,true];			
	life_pInact_curTarget SVAR ["containers",nil,true];			
	deleteMarkerLocal format["house_%1",life_pInact_curTarget GVAR "uid"];
	life_pInact_curTarget SVAR ["uid",nil,true];
	
	_flag = (round((_houseCfg select 0)/2));
	BANK = BANK + _flag;
	_index = life_vehicles find life_pInact_curTarget;
	
	_log = [player, player, _flag, 8, BANK, CASH];
	LOG_to_HC(0,_log);
	
	[6] call SOCK_fnc_updatePartial;
	
	
	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};
	
	_index = [str(getPosATL life_pInact_curTarget),life_houses] call TON_fnc_index;
	if(_index != -1) then {
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
	_numOfDoors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf life_pInact_curTarget), "numberOfDoors");
	private["_var"];
	for "_i" from 1 to _numOfDoors do {
		//life_pInact_curTarget SVAR [format["bis_disabled_Door_%1",_i],0,true];
		_var = format["bis_disabled_Door_%1",_i];
		SVARALL(life_pInact_curTarget,_var,0);
	};
};
