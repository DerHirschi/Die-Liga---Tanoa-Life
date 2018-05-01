#include "..\..\Liga_script_macros.hpp"
/* 
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (EQUAL(_item,"water")):
	{
		if!(EQUAL(life_thirst,100)) then {
			if(([false,_item,1] call life_fnc_handleInv)) then
			{			
				[true,"a10",1] call life_fnc_handleInv;
				life_thirst = 100 min (life_thirst + 25);
				SVAR_PRONS ["liga_thi",life_thirst];
				player setFatigue 0;
			};
		};
	};
	
	case (EQUAL(_item,"c6")): {
		[cursorTarget]spawn fn_tankmani;
	};
	case (EQUAL(_item,"prl")): {
		
		press_tausch = true;
		hint "Die Pressluftflasche wird getauscht ...";
	};

	case (EQUAL(_item,"boltcutter")): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (EQUAL(_item,"defusekit")): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["kasse","schrank"]): {
		//[_item] call life_fnc_storageBox;
		[_item] spawn LIGACL_fnc_LigaAddKass;
	};

	case (_item in ["storagebig"]): {
		[_item] call life_fnc_storageBox;
		//["storagebig"] call life_fnc_storageBox;
		//[_item] spawn LIGACL_fnc_LigaAddKass;
	};

	case (EQUAL(_item,"redgull")):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[true,"dose",1] call life_fnc_handleInv;
			life_thirst = 100;
			SVAR_PRONS ["liga_thi",life_thirst];
			playSound "drink";
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (EQUAL(_item,"coffee")):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100 min (life_thirst + 30);
			SVAR_PRONS ["liga_thi",life_thirst];
			playSound "drink";
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;

				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (2 * 65))};
				player enableFatigue true;
			};
		};
	};
	
	case (EQUAL(_item,"spikeStrip")):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (EQUAL(_item,"mauer")):
	{
		if(!isNull life_mauer) exitWith {hint "Du stellst schon eine Absperrung auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[0] spawn life_fnc_mauer;
		};
	};
	
	case (EQUAL(_item,"strahler")):
	{
		if(!isNull life_mauer) exitWith {hint "Du stellst schon einen Strahler auf !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[1] spawn life_fnc_mauer;
		};
	};

	case (EQUAL(_item,"fireWo")):
	{
		if(!isNull life_mauer) exitWith {hint "Du stellst schon ein Feuerwerk auf !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[7] spawn life_fnc_mauer;
		};
	};	
	
	case (_item isEqualTo "fuelF" || _item isEqualTo "ben"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (EQUAL(_item,"lockpick")):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (EQUAL(_item,"15")):
	{
		if(!isNull life_dest) exitWith {hint "Du stellst schon ein Destille auf !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_ligaDes;
		};
	};
	
		case (EQUAL(_item,"17")):
	{
		if(!isNull life_zelt) exitWith {hint "Du stellst schon ein Zelt auf !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[3] spawn life_fnc_mauer;
		};
	};
	case (EQUAL(_item,"16")):
	{
		if(!isNull life_fass) exitWith {hint "Du stellst schon ein Maischefass auf !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_ligaFass;
		};
	};
	
	case (EQUAL(_item,"14")):
	{
		if(!isNull life_fass) exitWith {hint "Du stellst schon ein Tarnnetz auf !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[4] spawn life_fnc_mauer;
		};
	};
	
	case (EQUAL(_item,"a10")):
	{		
		if (!(life_is_processing)) exitWith { closeDialog 0; [ObjNull,"","","moon"] spawn life_fnc_processAction; playSound "FlBef";};	
	};
	
	case (EQUAL(_item,"kaffmasch")):
	{		
		if (!(life_is_processing)) exitWith { closeDialog 0; [ObjNull,"","","kafmasch"] spawn life_fnc_processAction; /*playSound "FlBef";*/};	
	};	
	
	case (EQUAL(_item,"fuelE")):
	{		
		if (!(life_is_processing)) exitWith { closeDialog 0; [ObjNull,"","","methy"] spawn life_fnc_processAction;};	
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","banan","tuna","mullet","catshark","turtlesoup","donuts","tbacon","peach","doen","sheepraw","goatraw","roosterraw","henraw","bw","stofish","tutrei","hode","ana","schok"]):
	{
		playSound "eat";
		[_item] call life_fnc_eatFood;
	};

	case (EQUAL(_item,"pickaxe")):
	{
		hint "Du kannst auch die WIN-Taste drücken um die Spitzhacke zu benutzen ....";
		[] spawn life_fnc_pickAxeUse;
	};

	case (EQUAL(_item,"marijuana"))://Grass
	{
		//if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1] call life_fnc_handleInv)) then			{
			[] spawn life_fnc_weed;
		};
	};
	
	case (EQUAL(_item,"zig"))://zigarette
	{		
		if(([false,_item,1] call life_fnc_handleInv)) then			{
			[] spawn life_fnc_zig;
		};
	};
		
	case (EQUAL(_item,"methp"))://Meth
	{
		//if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1] call life_fnc_handleInv)) then			{
				[] spawn life_fnc_meth;
		};	
	};
	case (EQUAL(_item,"lsdp"))://Meth
	{
	//	if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1] call life_fnc_handleInv)) then			{
			[] spawn life_fnc_lsd;
		};
	};
	
case (EQUAL(_item,"uwsl")): {
                _OBJ = nearestObject [player, "Land_Wreck_Traw_F"];
                if (_OBJ==objNull) then {_OBJ = nearestObject [player, "Land_Wreck_Traw2_F"];};
		if (("Land_Wreck_Traw_F" == typeOf _OBJ) OR ("Land_Wreck_Traw2_F" == typeOf _OBJ)&&(player distance _OBJ < 30)) then {
                        if (!([false,_item,1] call life_fnc_handleInv)) exitWith {hint "Error: Object not found";};
			_ship = _OBJ GVAR "opened";
			_ship_obj = _OBJ;
			if (_ship) then {hint "Das Schiff wurde bereits geoeffnet!"};
			if (!_ship) then {
				hint "Die Sprengladung wurde gezuendet!! Der Laderaum ist jetzt offen ....!!!";
				//playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _ship_obj];
				//sleep 45;
				"M_NLAW_AT_F" createVehicle [getPos _ship_obj select 0, getPos _ship_obj select 1, 0];
				schiffwoffen = true;
				publicVariableServer "schiffwoffen";
			};
		};
	};

	case (EQUAL(_item,"gpstracker")): 
	{
		[cursorTarget] spawn life_fnc_gpsTracker;
	};

	case (EQUAL(_item,"cocainep")):
	{
	//	if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1] call life_fnc_handleInv)) then		{
			[] spawn life_fnc_useKokain;
		};
	};
	case (EQUAL(_item,"heroinp")):
	{
	//	if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};

	case (EQUAL(_item,"sfb")):
	{
		hint "Du kannst die Fernbedienung im Auto in der Nähe von Schranken mit der Taste O benutzen !!"
	};
	
	case (EQUAL(_item,"prl")):
	{
		hint "Die Pressluftflaschen werden automatisch gewechselt, wenn du sie beim tauchen dabei hast."
	};

	case (EQUAL(_item,"bottledbeer")):
	{
	//if(playerSide in [west,independent]) exitWith {hint localize "Kein Alkohol im Dienst mein Freund !!";};
	if((player GVAR ["inDrink",false])) exitWith {hint localize "Du hast schon was getrunken.";};
	if(([false,_item,1] call life_fnc_handleInv)) then
		{
		playSound "drink";
		if(isNil "life_drink") then {life_drink = 0;};

		//Wenn ihr das Bier trinkt, dann habe ihr also 0.15 Promille
		life_drink = life_drink + 0.15;

		if (life_drink < 0.2) exitWith {};
		[] spawn life_fnc_drinkbeer;
		[true,"a10",1] call life_fnc_handleInv;
		};
	}; 

	case (EQUAL(_item,"wein")):
	{
	//if(playerSide in [west,independent]) exitWith {hint localize "Kein Alkohol im Dienst mein Freund !!";};
	if((player GVAR ["inDrink",false])) exitWith {hint localize "Du hast schon was getrunken.";};
	if(([false,_item,1] call life_fnc_handleInv)) then
		{
		playSound "drink";
		if(isNil "life_drink") then {life_drink = 0;};

		//Wenn ihr das Bier trinkt, dann habe ihr also 0.15 Promille
		life_drink = life_drink + 0.25;

		if (life_drink < 0.2) exitWith {};
		[] spawn life_fnc_drinkbeer;
		};
	}; 
	
	case (EQUAL(_item,"uzo")):
	{
	//if(playerSide in [west,independent]) exitWith {hint localize "Kein Alkohol im Dienst mein Freund !!";};
	if((player GVAR ["inDrink",false])) exitWith {hint localize "Du hast schon was getrunken.";};
	if(([false,_item,1] call life_fnc_handleInv)) then
		{
		playSound "drink";
		if(isNil "life_drink") then {life_drink = 0;};

		//Wenn ihr das Bier trinkt, dann habe ihr also 0.15 Promille
		life_drink = life_drink + 0.45;

		if (life_drink < 0.2) exitWith {};
		[] spawn life_fnc_drinkbeer;
		};
	}; 
	
	case (EQUAL(_item,"21")):
	{
	//if(playerSide in [west,independent]) exitWith {hint localize "Kein Alkohol im Dienst mein Freund !!";};
	if((player GVAR ["inDrink",FALSE])) exitWith {hint localize "Du hast schon was getrunken.";};
	if(([false,_item,1] call life_fnc_handleInv)) then
		{
		playSound "drink";
		if(isNil "life_drink") then {life_drink = 0;};

		//Wenn ihr das Bier trinkt, dann habe ihr also 0.15 Promille
		life_drink = life_drink + 0.85;

		if (life_drink < 0.2) exitWith {};
		[] spawn life_fnc_drinkbeer;
		[true,"a10",1] call life_fnc_handleInv;
		};
	}; 
	
	case (EQUAL(_item,"20")):
	{
	//if(playerSide in [west,independent]) exitWith {hint localize "Kein Alkohol im Dienst mein Freund !!";};
	if((player GVAR ["inDrink",false])) exitWith {hint localize "Du hast schon was getrunken.";};
	if(([false,_item,1] call life_fnc_handleInv)) then
		{
		playSound "drink";
		if(isNil "life_drink") then {life_drink = 0;};

		//Wenn ihr das Bier trinkt, dann habe ihr also 0.15 Promille
		life_drink = life_drink + 2.25;

		if (life_drink < 0.2) exitWith {};
		[] spawn life_fnc_drinkbeer;
		};
	}; 
	
	case (EQUAL(_item,"rio")):  
	{
			hint "Offshore Oel kannst du zu Benzin, Diesel und Kerosin weiter verarbeiten.."
	};	
	
	case (EQUAL(_item,"rig")):  
	{
			hint "Methangas kannst du beim Gaswerk verkaufen"
	};	
		
	
	case (EQUAL(_item,"rib")): 
	{
			hint "Bohrgestaenge kannst du auf der Liga Oel Rig verkaufen.."
	};	
		

	case (EQUAL(_item,"rip")):   
	{
			hint "Die Oelpumpe brauchst du, um auf der Liga Oel Rig Oel abzubauen"
	};	
		
		
	case (EQUAL(_item,"ghy")):   //Hydroriffel
	{
			hint "Hydro Riffel erhoehen die Ausbeute beim Goldschuerfen.."
	};
	
	case (EQUAL(_item,"kegel")):
	{
		if(!isNull life_kegel) exitWith {hint "Du stellst schon einen Kegel auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[2] spawn life_fnc_mauer;
		};
	};
	
	case (EQUAL(_item,"b22")):
	{
		if(!isNull life_kegel) exitWith {hint "Du stellst schon einen Klappstuhl auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[5] spawn life_fnc_mauer;
		};
	};
	
	case (EQUAL(_item,"b23")):
	{
		if(!isNull life_kegel) exitWith {hint "Du stellst schon einen Klappstuhl auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[6] spawn life_fnc_mauer;
		};
	};
	
	case (EQUAL(_item,"c5")):
	{
		if(EQUAL(playerSide,east))then{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				missionNamespace SVAR["lada_air",true];
			};
		};
		
		if(EQUAL(playerSide,west) || liga_cop_on)then{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				missionNamespace SVAR["lada_air",true];
			};
		};

	};			
		
	default	{	hint localize "STR_ISTR_NotUsable";	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;