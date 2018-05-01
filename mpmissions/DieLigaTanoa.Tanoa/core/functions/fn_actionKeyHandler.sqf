#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine  
	Edited by Hirschi
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_exit"];

if(life_action_inUse || life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
//Temp fail safe.
if(life_interrupted) exitWith {life_interrupted = false;};
if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
{player reveal _x;} foreach (player nearObjects 30);

_curTarget = cursorTarget;
_objarr = nearestObjects [position player,["Land_Device_assembled_F"],3];
if!((count _objarr) isEqualTo 0)exitWith {
	_curTarget = SEL(_objarr,0); 
	if(SKY_HC_aktiv_1 &&  (_curTarget in life_vehicles) && ( player distance _curTarget < 8))then {  	[_curTarget,1]spawn LIGACL_fnc_TurmMenu;/*[_curTarget,true,player] remoteExec ["LIGA_fnc_turmUP",HC_id];playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _curTarget]; */};
};
//if!((count (nearestObjects [position player,["Land_dp_transformer_F"],  4])) isEqualTo 0)exitWith { };
if(EQUAL(typeOf _curTarget,"Land_Research_house_V1_F"))exitWith {
	//hint "test";
	if(SKY_HC_aktiv_1 && (_curTarget in life_vehicles) && ( player distance _curTarget < 8))exitWith {  [_curTarget,0]spawn LIGACL_fnc_TurmMenu; };
	if(SKY_HC_aktiv_1 && ( player distance _curTarget < 8))exitWith {  [] spawn ligafn_alac_vehinfo; };
};



_turtle = ((nearestObjects[getPos player,["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F","Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F"],3]) select 0); 

_isWater = underwater player;

if(isNull _curTarget) exitWith {	
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") exitWith {	[_fish] call life_fnc_catchFish;	};
		_fish = (nearestObjects[getPos player,["Turtle_F"],5]) select 0;
		if(!isNil "_fish" && !alive _fish) exitWith {	[_fish] call life_fnc_gutAnimal;	};
	} else {		
		if(/*playerSide isEqualTo civilian &&*/ !life_action_gathering && !life_action_inUse) exitWith {
			 [] spawn life_fnc_gather;			
		};
	};
};

if(_curTarget isKindOf "Animal" && {!alive _curTarget}) exitWith {[_turtle] call life_fnc_gutAnimal;}; 
//if(_curTarget isKindOf "Animal" ) exitWith {[_turtle] call life_fnc_gutAnimal;}; 

_exit = false;
if(_curTarget isKindOf "House_F" && {player distance _curTarget < 10} /*OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) isEqualTo _curTarget*/ OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) isEqualTo _curTarget) exitWith {
	 
	 // Ligahaus
/*
	{
	if(player distance (getMarkerPos _x) < 50) exitWith 
		{
			hint "Du kannst dieses Gebäude nicht kaufen!";
			_exit = true;
		};
	} foreach ["house_1","house_2","house_3","house_4","house_5","house_6","house_7","house_8","house_9","house_10","house_11","house_12"];
	if (_exit) exitWith {};
*/
	
	life_action_inUse = true;
	[]spawn {		
		sleep 1;
		waitUntil {isNull (findDisplay 37400)};
		life_action_inUse = false;	
	};
	[_curTarget] call life_fnc_houseMenu;
	//sleep 1.5;
	//life_action_inUse = false;	

};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} /*&& {playerSide in [west,independent]}*/) exitWith {
	//Hotfix code by ins0
	if((/*(playerSide isEqualTo blufor && {(call life_revive_cops)}) || playerSide isEqualTo independent*/liga_cop_on || liga_lrk_on || EQUAL(playerSide,west)) && {"Medikit" in (items player)}) then {
		[_curTarget] call life_fnc_revivePlayer;
	};
};

if(_curTarget isKindOf "Man" && (alive _curTarget) && (EQUAL(playerSide,east))) 	exitWith { closeDialog 0; [_curTarget,0]spawn life_fnc_adacInteractionMenu;};
if(_curTarget isKindOf "Man" && (alive _curTarget) && !(EQUAL(life_blacklisted,0)))  exitWith { closeDialog 0; [_curTarget,1]spawn life_fnc_adacInteractionMenu;};


if(isPlayer _curTarget && _curTarget isKindOf "Man") exitWith {
	if(/*(_curTarget getVariable["restrained",false]) && */!dialog && EQUAL(playerSide,west) || liga_cop_on) exitWith 
	{
		if((player distance _curTarget > 3)) exitWith {};
		life_action_inUse = true;
		[_curTarget] call life_fnc_copInteractionMenu;
		sleep 1.5;
		life_action_inUse = false;
	};
	if((_curTarget GVAR["restrained",false]) && !dialog && liga_lrk_on) exitWith 
	{
		if((player distance _curTarget > 3)) exitWith {};
		life_action_inUse = true;
		[_curTarget] call life_fnc_medInteractionMenu;
		sleep 1.5;
		life_action_inUse = false;
	};
	if((_curTarget GVAR["restrained",false]) && !dialog && playerSide in [civilian,independent] && (!liga_cop_on && !liga_lrk_on)) then 
	{
		if((player distance _curTarget > 3)) exitWith {};
		life_action_inUse = true;
		[_curTarget] call life_fnc_civInteractionMenu;
		sleep 1.5;
		life_action_inUse = false;
	};
};
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if(KIND_TRUNK_KH(_curTarget)) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_money = "Land_Money_F";
	
	if(_isVehicle) then 
	{
		if(!dialog) then 
		{
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then 
			{
				
				life_action_inUse = true;
				[_curTarget] spawn life_fnc_vInteractionMenu;
				sleep 1.5;
				life_action_inUse = false;
			};
		};
	};	
			if((typeOf _curTarget) in _miscItems) then {
				[_curTarget,player,false] remoteExecCall ["TON_fnc_pickupAction",RSERV];
			} else {
				//It wasn't a misc item so is it money?
				if(EQUAL((typeOf _curTarget),_money) && {!(_curTarget GVAR ["inUse",false])}) then {
					[_curTarget,player,true] remoteExecCall ["TON_fnc_pickupAction",RSERV];
				};
			}; 