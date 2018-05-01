#include "..\..\Liga_script_macros.hpp"
/*
    Author: Joey LosPepes
    Edit: Hirschi - Die Liga
    
    Description:
    Guts the animal!
*/
private["_animalCorpse","_upp","_ui","_progress","_pgText","_cP","_displayName","_itemName","_diff","_val","_itemName_1","_diff_1","_val_1"];
_animalCorpse = param [0,ObjNull,[ObjNull]];

if(isNull _animalCorpse) exitWith {}; //Object passed is null?
life_interrupted = false;
_type = (typeOf _animalCorpse);
if(!(_type in ["Turtle_F","Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F"])) exitWith {};
if(player distance _animalCorpse > 3.5) exitWith {};
life_action_inUse = true;
 switch(_type) do {
 
   // case "Hen_random_F": {_displayName = "Huhn"; _itemName = "henraw"; _val = 1;};
   // case "Cock_random_F": {_displayName = "Hahn"; _itemName = "roosterraw"; _val = 1;};
    case "Goat_random_F": {_displayName = "Ziege"; _itemName = "goatraw"; _val = 2; _itemName_1 = "goatrawf"; _val_1 = 3;};
    case "Sheep_random_F": {_displayName = "Schaf"; _itemName = "sheepraw"; _val = 2;_itemName_1 = "sheeprawf"; _val_1 = 2;};
    case "Rabbit_F": {_displayName = "Hase"; _itemName = "rabbit"; _val = 1;_itemName_1 = "rabbitf"; _val_1 = 1;	};
	case "Turtle_F": {_displayName = "Schildkroeten"; _itemName = "turtle"; _val = 1;_itemName_1 = "turtle"; _val_1 = 0;	};
	
  
	default {_displayName = ""; _itemName = ""; _val = 0; _itemName_1 = ""; _val_1 = 0;};
};

if(EQUAL(_displayName,"")) exitWith {life_action_inUse = false;};
_upp = format["Schlachte %1",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

_KnifeVal = missionNamespace GVAR (["jame",0] call life_fnc_varHandle);

if(_KnifeVal > 0) then {

while{true} do {
    if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player action ["SwitchWeapon", player, player, 100]; //EDIT
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
        player playActionNow "stop";
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
        player playActionNow "stop";
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		};
    uiSleep 0.025;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if(_cP >= 1) exitWith {};
    if(!alive player) exitWith {};
    if(isNull _animalCorpse) exitWith {};
    if(player != vehicle player) exitWith {};
    if(life_interrupted) exitWith {};
		};
	}	
	else
	{
	while{true} do {
    if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];

        player action ["SwitchWeapon", player, player, 100]; //EDIT
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
        player playActionNow "stop";
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
        player playActionNow "stop";
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		};
    uiSleep 0.12;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if(_cP >= 1) exitWith {};
    if(!alive player) exitWith {};
    if(isNull _animalCorpse) exitWith {};
    if(player != vehicle player) exitWith {};
    if(life_interrupted) exitWith {};
	};

};
        
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(isNull _animalCorpse) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player != vehicle player) exitWith {life_action_inUse = false;};

deleteVehicle _animalCorpse;


_diff_1= [_itemName_1,_val_1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(([true,_itemName_1,_diff_1] call life_fnc_handleInv)) then {
    
    titleText [format["Du hast %1fell gesammelt",_displayName],"PLAIN"];
	sleep 1;
} else {
    titleText ["Dein Rucksack ist voll !!","PLAIN"];
};

_diff = [_itemName,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(([true,_itemName,_diff] call life_fnc_handleInv)) then {
    
    titleText [format["Du hast rohes %1fleisch gesammelt",_displayName],"PLAIN"];
	sleep 1;
} else {
    titleText ["Dein Rucksack ist voll !!","PLAIN"];
};
if(_type in ["Goat_random_F","Sheep_random_F"])then {
	_diff = ["hode",(round random 2),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff; // Her mit den Klöten .. .
	if(([true,"hode",_diff] call life_fnc_handleInv)) then {    
		titleText [format["Du hast %1 Tierhoden gesammelt",_diff],"PLAIN"];
		sleep 1;
	} else {
		titleText ["Dein Rucksack ist voll !!","PLAIN"];
	};
};

life_action_inUse = false;