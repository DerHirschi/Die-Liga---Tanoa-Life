#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the house?
	Nöö .. Shop´s :p
*/
private["_house","_uid","_action","_houseCfg","_index"];
_house = param [0,ObjNull,[ObjNull]];
_uid = steamid;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house GVAR "house_owner"}) exitWith {hint "Das Haus gehoert dir nicht..."};
closeDialog 0;


_houseCfg = [(typeOf _house)] call LIGACL_fnc_LigaLadenCfg;
if(EQUAL(count _houseCfg,0)) exitWith {};

_action = [
	format[localize "STR_Laden_SellHouseMSG",
	(round(SEL(_houseCfg,0)/2)) call life_fnc_numberText,
	SEL(_houseCfg,1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;


if(_action) then {
	_house SVAR ["house_sold",true,true];	
	_house SVAR ["ladextra",nil,true];
	//_house SVAR["kassen",nil,true];
	_house SVAR["slots",nil,true];
	//_house SVAR["house_owner",nil,true];
	//_house SVAR["laden_id",nil,true];
	_house SVAR["locked",false,true]; 

	[_house] remoteExecCall ["TON_fnc_sellLaden",RSERV];	

	deleteMarker format["laden_%1",_house GVAR "luid"];
	deleteMarkerLocal format["laden_%1",_house GVAR "luid"];
	_house SVAR ["luid",nil,true];	
	

	
	_flag = (round((_houseCfg select 0)/2));
	BANK = BANK + _flag;
	_index = life_vehicles find _house;
	
	_log = [player, player, _flag, 8, BANK, CASH];
	LOG_to_HC(0,_log);
	
	[6] call SOCK_fnc_updatePartial;
	
	
	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),liga_ladenhouses] call TON_fnc_index;
	if(_index != -1) then {
		liga_ladenhouses set[_index,-1];
		liga_ladenhouses = liga_ladenhouses - [-1];
	};
	life_vehicles = life_vehicles - [ObjNull];

};







