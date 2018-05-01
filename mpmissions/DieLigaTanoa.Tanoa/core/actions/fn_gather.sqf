#include "..\..\Liga_script_macros.hpp"
/*
	╔══════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
	║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
	║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠══════════════════════════════════════════════════╝
	║	File: fn_gather.sqf	
	║		
	║	Author:  	Hirschi - Die Liga		
	║	Vorlage:  	Bryan "Tonic" Boardwine		
	╚══════════════════════════════════════════════════╝
*/
private["_gather","_itemWeight","_diff","_itemName","_ranzoon","_val","_resourceZones","_zone","_iin","_arr","_ent"];
if(life_action_inUse) exitWith {};
if(life_action_gathering) exitWith {};
if(vehicle player != player) exitWith {};

_zone 	 		= "";
_resourceZones 	= M_CONFIG(getArray,"LigaGather","Zones","gather");
_machZone		= M_CONFIG(getArray,"LigaGather","Zones","machete");
_pickZone		= M_CONFIG(getArray,"LigaGather","Zones","pickaxe");
_axtZone 		= M_CONFIG(getArray,"LigaGather","Zones","axt");
_ranzoon 		= M_CONFIG(getArray,"LigaGather","Zones","RandomZone");

_resourceZones	= _resourceZones + _machZone + _pickZone + _axtZone;

if(EQUAL(playerSide,independent) && !(GVAR_MNS ["lci_reb",false]) ) then {
	_resourceZones	= _resourceZones + _ranzoon;
};

/*Such den Marker Baby*/
{
	if(player distance (getMarkerPos _x) < 35) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) 									exitWith {	hint localize "STR_NOTF_notNearResource";	};
if( _zone in _pickZone) 								exitWith {[] spawn life_fnc_pickAxeUse;};
_guVal 	 = GVAR_MNS (["a7",0] 	 call life_fnc_varHandle);	//Axt
_guVal_1 = GVAR_MNS (["a8",0] 	 call life_fnc_varHandle);	//Kettensäge
_guVal_2 = GVAR_MNS (["mache",0] call life_fnc_varHandle);	//Machete
if( _zone in _axtZone  && _guVal   < 1 && _guVal_1 < 1) exitWith {hint "Du benoetigst eine Axt oder Kettensaege !!!";};
if( _zone in _machZone && _guVal_2 < 1) 				exitWith {hint "Ohne Machete wird das nichts Keule....";};
if( _zone in _ranzoon && !lci_wert) 					exitWith {hint "Du musst dir erst die Lizenz beim Dorfaeltesten holen..";};

_iin = false;
if!(_zone in _ranzoon) then {
	_ent = switch(playerSide) do {
		case civilian 		: {"CIVgath"};
		case independent 	: {"UHRgath"};
	};
	_arr	= M_CONFIG(getArray,"LigaGather",_ent,_zone);
	_gather = SEL(_arr,0);
	_val 	= SEL(_arr,1);	
	if( _gather in ["a1","a1t"] && _guVal_1 >= 1) then {_val = _val * 2;};
	_val 	= round random _val;
	_diff 	= [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
}else{
	_val = round random [1,0,7];
	if!(EQUAL(_val,0))then {
		_iin 	= false;
		_arr	= M_CONFIG(getArray,"LigaGather","Zones","RandomLoot");
		_gather = SEL(_arr,(round (random ((count _arr)-1))));		
		_diff 	= [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	}else{
		_iin 	= true;
		_arr	= M_CONFIG(getArray,"LigaGather","Zones","RandomILoot");
		_gather = SEL(_arr,(round (random ((count _arr) - 1))));
		_val 	= floor random [1,0,4];
		_val 	= _val min 1;		
		_diff	= 1;
	};	
};	

if(EQUAL(_diff,0)) exitWith {/*hint localize "STR_NOTF_InvFull"*/};

life_action_gathering 	= true;
life_action_inUse 		= true;

for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	
	/*1´st step*/
	if!(_iin) then {
		if(EQUAL(_i,1)) then {
			if(([true,_gather,_diff] call life_fnc_handleInv)) then
			{
				_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
				titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
			};
		};
		/*Müllzonen*/
		if(EQUAL(_i,2)) then {
			if(_zone in (M_CONFIG(getArray,"LigaGather","Zones","muellZone")))then {
				_gather = "mull";
				_val    = floor random [2,0,7];	
				_diff 	= [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
				if!(EQUAL(_diff,0)) then {
					if(([true,_gather,_diff] call life_fnc_handleInv)) then
					{			
						_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
						titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
					};
				};
			};
		};
	}else{
		if(EQUAL(_i,2)) then {
			if!(EQUAL(_val,0))then {
				player addItemToBackpack _gather;
				_itemName = [_gather] call life_fnc_fetchCfgDetails;
				titleText[format[localize "STR_NOTF_Gather_Success",SEL(_itemName,1),1],"PLAIN"];
			};
		}else{
			titleText["Du hast nichts gefunden ...","PLAIN"];
		};
	};	
	uiSleep 2.5;
};
life_action_gathering 	= false;
life_action_inUse 		= false;
