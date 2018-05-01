#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_query","_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
//diag_log format ["<<<<%1   %2   %3   %4 ",_uid,_name,_type];
if(_uid isEqualTo "" OR _type isEqualTo "" OR _name isEqualTo "") exitWith {}; //Bad data passed.
//diag_log format ["<<<<%1   %2   %3   %4 ",_uid,_name,_type];
//What is the crime?
switch(_type) do
{

	case "459": {_type = ["459",65000]};
	case "500": {_type = ["500",950]}; 
	case "501": {_type = ["501",1900]};
	case "502": {_type = ["502",3800]};
	case "503": {_type = ["503",7600]};
	case "504": {_type = ["504",15200]};
	case "505": {_type = ["505",30400]};
	case "506": {_type = ["506",35401]};
	case "507": {_type = ["507",40402]};
	case "508": {_type = ["508",1950]}; 
	case "509": {_type = ["509",3900]};
	case "510": {_type = ["510",4800]};
	case "511": {_type = ["511",9600]};
	case "512": {_type = ["512",19200]};
	case "513": {_type = ["513",40400]};
	case "514": {_type = ["514",55401]};
	case "515": {_type = ["515",65402]};	
	
	case "187V": {_type = ["187V",50000]};
    case "187": {_type = ["187",250000]};
    case "901": {_type = ["901",85000]};
    case "261": {_type = ["261",100000]};
    case "261A": {_type = ["261A",50000]};
    case "215": {_type = ["215",10000]};
    case "213": {_type = ["213",10000]};
    case "211": {_type = ["211",100000]};
    case "207": {_type = ["207",55000]};
    case "207A": {_type = ["207A",20000]};
    case "487": {_type = ["487",50000]};
    case "488": {_type = ["488",100000]};
    case "480": {_type = ["480",50000]};
    case "481": {_type = ["481",25000]};
    case "482": {_type = ["482",50000]};
    case "483": {_type = ["483",100000]};
    
    case "1": {_type = ["1",10000]};
    case "2": {_type = ["2",15000]};
    case "3": {_type = ["3",5000]};
    case "4": {_type = ["4",5000]};
    case "5": {_type = ["5",10000]};
    case "6": {_type = ["6",5000]};
    case "7": {_type = ["7",25000]};
    case "8": {_type = ["8",25000]};
    case "9": {_type = ["9",50000]};
    case "10": {_type = ["10",50000]};
    case "11": {_type = ["11",20000]};
    case "12": {_type = ["12",10000]};
    case "13": {_type = ["13",10000]};
    case "14": {_type = ["14",20000]};
    case "15": {_type = ["15",30000]};
    case "16": {_type = ["16",30000]};
    case "17": {_type = ["17",60000]};
    case "18": {_type = ["18",60000]};
    case "19": {_type = ["19",10000]};
    case "20": {_type = ["20",25000]};
    case "21": {_type = ["21",20000]};
    case "22": {_type = ["22",50000]};
    case "23": {_type = ["23",50000]};
    case "24": {_type = ["24",20000]};
    case "25": {_type = ["25",50000]};
    case "26": {_type = ["26",100000]};
    case "27": {_type = ["27",150000]};
    case "28": {_type = ["28",50000]};
    case "29": {_type = ["29",100]};
    case "30": {_type = ["30",50000]};
    case "31": {_type = ["31",45000]};
    case "32": {_type = ["32",10000]};
    case "33": {_type = ["33",15000]};
    case "34": {_type = ["34",50000]};
    case "35": {_type = ["35",100000]};
    case "36": {_type = ["36",25000]};
    case "37": {_type = ["37",15000]};
    case "38": {_type = ["38",30000]};
    case "39": {_type = ["39",25000]};
    case "40": {_type = ["40",50000]};
    case "41": {_type = ["41",25000]};
    case "42": {_type = ["42",10000]};
    case "43": {_type = ["43",15000]};
    case "44": {_type = ["44",5000]};
    case "45": {_type = ["45",25000]};
    case "46": {_type = ["46",15000]};
    case "47": {_type = ["47",25000]};
    case "48": {_type = ["48",100000]};
    case "49": {_type = ["49",100000]};
    case "50": {_type = ["50",100000]};
    case "51": {_type = ["51",100000]};
    case "52": {_type = ["52",50000]};
    case "53": {_type = ["53",150000]};
    case "54": {_type = ["54",125000]};
    case "55": {_type = ["55",250000]};
    case "56": {_type = ["56",100000]};
    case "57": {_type = ["57",10000]};
    case "58": {_type = ["58",100000]};
    case "59": {_type = ["59",10000]};	
	
	
	default {_type = [];};
};
if((count _type) isEqualTo 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
//diag_log format ["<<<<%1   %2   %3   %4 ",_uid,_name,_type];
_result = format["wantedGetCrimes:%1",_uid];
//waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;
//diag_log format ["<<<<%1   %2   %3   %4 ",_queryResult,_name,_type];
_val = [(_type select 1)] call DB_fnc_numberSafe;

if(count _queryResult != 0) then
{
	_pastCrimes = _queryResult select 1;
	_pastCrimes pushBack (_type select 0);
	_query = format["wantedUpdateCrimes:%1:%2:%3",_pastCrimes,_val,_uid];
} else {
	_crimes = [(_type select 0)];
	_query = format["wantedInsertCrimes:%1:%2:%3:%4:1",_uid,_name,_crimes,_val];
};
//diag_log format ["<<<<%1   %2   %3   %4 ",_queryResult,_query,_type];
if(!isNil "_query") then {
//	waitUntil{!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;
};