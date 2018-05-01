#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi & Otti Liga-Life
	
	Description:
	Buys the LigaLaden?
	
	
*/
private["_house","_uid","_action","_houseCfg"];

_house = param [0,ObjNull,[ObjNull]];
_uid = steamid;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house GVAR ["house_owned",false])) exitWith {hint "Dieses Geschaeft gehoert bereits jemanden... "};
if(!isNil {(_house GVAR "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!lci_home) exitWith {hint localize "STR_House_License"};
if(count liga_ladenhouses >= (M_CONFIG(getNumber,"LigaLadenCFG","LimitCFG","buylimit1"))) exitWith {hint "Du hast schon genug Laeden ...";};
closeDialog 0;
/*
	if(EQUAL(playerSide,civilian) && ((player distance2D (getMarkerPos "civ_haus") > 6100) && ( (player distance2D (getMarkerPos "reb_haus") > 2090) && !lci_reb )  && (player distance2D (getMarkerPos "civ_haus2") > 2700))) exitWith {hint "Du kannst kein Laden im Stammesgebiet kaufen..."};
	if(EQUAL(playerSide,independent) && ((player distance2D (getMarkerPos "civ_haus") < 6100) || (player distance2D (getMarkerPos "civ_haus2") < 2700)) ) exitWith {hint "Du kannst nur Laeden im Stammesgebiet kaufen";};
	if((player distance2D (getMarkerPos "reb_haus") < 2090) && !lci_reb ) exitWith {hint "Du gehoerst nicht der Guerilla an ....";};
*/
_flag1 = [_house]call LIGACL_fnc_ImoBuyFrakCheck;
if!(EQUAL(_flag1,"")) exitWith {hint _flag1;}; 

_houseCfg = [(typeOf _house)] call LIGACL_fnc_LigaLadenCfg;
if(EQUAL(count _houseCfg,0)) exitWith {};
[_house,player,1] remoteExec ["TON_fnc_preCheckHouse",RSERV];

waitUntil{	!isNil "kaufmich" };
if!(kaufmich) exitWith {hint "Dieses Geschaeft gehoert bereits jemanden... "};

kaufmich = nil;


_action = [
	format[localize "STR_Laden_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1) , (_houseCfg select 2)],localize "STR_Laden_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(BANK < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	[_uid,_house] remoteExec ["TON_fnc_addLaden",RSERV];

	_house SVAR ["house_owner",[_uid,profileName],true];
	//_house SVAR ["locked",true,true];

	//_house SVAR ["Trunk",[[],0],true];

	_house SVAR ["ladextra",["Liga Laden",0,0],true];

	_house SVAR ["luid",floor(random 99999),true];

	_flag = SEL(_houseCfg,0);
	BANK = BANK - _flag;
	_log = [player, player, -_flag, 8, BANK, CASH];
	LOG_to_HC(0,_log);
	[6] call SOCK_fnc_updatePartial;
	life_vehicles pushBack _house;
	liga_ladenhouses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["laden_%1",(_house GVAR "luid")],getPosATL _house];
	_houseName = "Liga Laden";
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorYellow";
	_marker setMarkerTypeLocal "loc_Lighthouse";


};