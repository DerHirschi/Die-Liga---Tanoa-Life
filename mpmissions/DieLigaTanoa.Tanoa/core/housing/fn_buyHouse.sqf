#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi & Otti Liga-Life
	
	Description:
	Buys the house?
	
*/
private["_house","_uid","_action","_houseCfg"];

_house = param [0,ObjNull,[ObjNull]];
_uid = steamid;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house GVAR ["house_owned",false])) exitWith {hint "Dieses Haus gehoert bereits jemanden... "};
if(!isNil {(_house GVAR "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!lci_home) exitWith {hint localize "STR_House_License"};
if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
closeDialog 0;

if((typeOf _house) in ["Land_House_Native_01_F","Land_House_Native_02_F"] && EQUAL(playerSide,civilian)) exitWith { hint "Du bist kein Uhreinwohner .. Du kannst die Huette nicht kaufen.";}; 
/*
	if(EQUAL(playerSide,civilian) && ((player distance2D (getMarkerPos "civ_haus") > 6100) && ( (player distance2D (getMarkerPos "reb_haus") > 2090) && lci_reb ) && (player distance2D (getMarkerPos "civ_haus2") > 2700))) exitWith {hint "Du kannst kein Haus im Stammesgebiet kaufen..."};
	if(EQUAL(playerSide,independent) && ((player distance2D (getMarkerPos "civ_haus") < 6100) || (player distance2D (getMarkerPos "civ_haus2") < 2700)) && !(typeOf _house in ["Land_House_Native_01_F","Land_House_Native_02_F"])) exitWith {hint "Du kannst nur Strohhuetten oder Hauser im Stammesgebiet kaufen";};
	if((player distance2D (getMarkerPos "reb_haus") < 2090) && !lci_reb && !(typeOf _house in ["Land_House_Native_01_F","Land_House_Native_02_F"])) exitWith {hint "Du gehoerst nicht der Guerilla an ....";};
*/
_flag1 = [_house]call LIGACL_fnc_ImoBuyFrakCheck;
if!(EQUAL(_flag1,"")) exitWith {hint _flag1;}; 


_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(EQUAL(count _houseCfg,0)) exitWith {};
[_house,player,0] remoteExec ["TON_fnc_preCheckHouse",RSERV];

waitUntil{	!isNil "kaufmich" };
if!(kaufmich) exitWith {hint "Dieses Haus gehoert bereits jemanden... "};

kaufmich = nil;


_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(BANK < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	[_uid,_house] remoteExec ["TON_fnc_addHouse",RSERV];
	//SVARALL(_house,"house_owner",[_uid,profileName]);
	_house SVAR ["house_owner",[_uid,profileName],true];
	_house SVAR ["locked",true,true];
	//SVARALL(_house,"locked",true);
	_house SVAR ["Trunk",[[],0],true];
	//SVARALL(_house,"Trunk",[[],0]);
	_house SVAR ["containers",[],true];
	//SVARALL(_house,"containers",[]);
	_house SVAR ["uid",floor(random 99999),true];
	//SVARALL(_house,"uid",floor(random 99999));
	//SUB(BANK,(SEL(_houseCfg,0)));
	_flag = SEL(_houseCfg,0);
	BANK = BANK - _flag;
	_log = [player, player, -_flag, 8, BANK, CASH];
	LOG_to_HC(0,_log);
	[6] call SOCK_fnc_updatePartial;
	life_vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house GVAR "uid")],getPosATL _house];
	_houseName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _house), "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _house),"numberOfDoors");
	/*
	for "_i" from 1 to _numOfDoors do {
		_house SVAR [format["bis_disabled_Door_%1",_i],1,true];
		
	};
	*/
	private["_var"];
	for "_i" from 1 to _numOfDoors do {
		//_house SVAR [format["bis_disabled_Door_%1",_i],0,true];
		_var = format["bis_disabled_Door_%1",_i];
		SVARALL(_house,_var,1);
	};
};