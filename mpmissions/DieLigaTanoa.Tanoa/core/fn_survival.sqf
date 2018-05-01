#include "..\Liga_script_macros.hpp"
#define COUNTEAST east countSide playableUnits
#define COUNTWEST west countSide playableUnits
#define COUNTIND independent countSide playableUnits
#define COUNTCIV civilian countSide playableUnits

#define CHECKARR [BANK,CASH,COUNTWEST,COUNTEAST,COUNTIND,COUNTCIV,life_hunger,life_thirst]
#define EQCHECK CHECKARR isEqualTo _checkAr
#define ZEIT time
#define SIDECHECK (!isNull findDisplay 63) && (!isNull findDisplay 55)
#define SIDECHECK2 (ctrlText ((findDisplay 63) displayCtrl 101) isEqualTo "Side ! NICHT REDEN !") && (ctrlText ((findDisplay 55) displayCtrl 101) isEqualTo "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa")
#define SUBT(TIMER) ZEIT - TIMER
//#define CMDMCHECK (commandingMenu in ["RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoveDir","#GETIN","#RscStatus","RscCallSupport","#ACTION","RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#User:BIS_Menu_GroupCommunication","#CUSTOM_RADIO","RscRadio","RscGroupRootMenu","RscMenuReply","RscMenuStatus","","#User:BIS_fnc_addCommMenuItem_menu","RscMenuMove","RscMenuFormations"])
//#define CMDMEQ commandingMenu != _lastMenu
/*
	Quellen: Altis Life RPG 3.1.4.8 , 4.3 , 4.4
	Author: Hirschi - Die Liga
*/
private["_fnc_food","_fnc_water","_fnc_bp","_fnc_radioakt","_walkTime","_foodTime",
		"_SaveTime",/*"_updateTime",*/"_radioATime","_waterTime","_TagATime","_DelGroupTime","_IgiTime",
		"_vp","_bp","_un","_dam","_nuke","_validMenus",/*"_lastMenu",*/"_checkAr","_walkDis","_lastPos","_curPos","_lastState"];
		
_foodTime 		= ZEIT;
_waterTime 		= ZEIT;
//_updateTime 	= ZEIT;
_radioATime 	= ZEIT;
_TagATime 		= ZEIT;
_DelGroupTime 	= ZEIT; // Gruppen u Wetter
_walkTime 		= ZEIT;
_SaveTime 		= ZEIT;
_IgiTime 		= ZEIT;

//_lastMenu 		= "";
_vp 			= "";
_bp 			= "";
_un 			= "";
_dam 			= damage player;
_checkAr 		= [];
_lastPos 		= visiblePosition player;
_lastPos 		= (SEL(_lastPos,0)) + (SEL(_lastPos,1));
_lastState 		= vehicle player;
_walkDis 		= 0;
_radioMark		= getMarkerPos "Warm_Marker";
if(isNil "nu_de") 			then {_nuke = true;	 nu_de = false;		}
							else {	if(nu_de) then {_nuke = false;	}
											  else {_nuke = true; 	};
								 };
if(isNil "D41_Vorschau") 	then {D41_Vorschau 	= 0.5;			};		
if(isNil "D41_Wind"	) 		then {D41_Wind		= [1, 1, true];	};		
if(isNil "D41_Wellen"	) 	then {D41_Wellen 	= 1;			};	
0  	setOvercast 	(D41_Vorschau);
0  	setFog 			0;	
60 	setWaves 		(D41_Wellen);
	setWind 		(D41_Wind);
		
_fnc_food =  {
	if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
	else
	{
		SUB(life_hunger,3);
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
		};
	};
	SVAR_PRONS ["liga_hun",life_hunger];
};

	
_fnc_water = {
	if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
	else
	{
		SUB(life_thirst,4);
		[] call life_fnc_hudUpdate;
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
		switch(life_thirst) do  {
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
		};
	};
	SVAR_PRONS ["liga_thi",life_thirst];	
};
	
_fnc_bp = {
	private["_bp","_vp","_load","_cfg","_vescfg"];

	_vp = vest player;
	_bp = backpack player;	
	if(EQUAL(_bp,"") && EQUAL(_vp,"")) exitWith {life_maxWeight = life_maxWeightT;};
	if!(EQUAL(_bp,"") && EQUAL(_vp,"")) exitWith {
		if(!isClass (missionConfigFile >> CONFIG_KLAMOTTEN >> _vp )) then {
			_vp = "Default"; //Use Default class if it doesn't exist	
		};	
		if(!isClass (missionConfigFile >> CONFIG_KLAMOTTEN >> _bp )) then {
			_cfg = getNumber(configFile >> CONFIG_VEHICLES >> (_bp) >> "maximumload");	
			_cfg = round(_cfg/8);
		}else{
			_cfg = M_CONFIG(getNumber,CONFIG_KLAMOTTEN,_bp,"LigaInv");
		};			
	//	_cfg = getNumber(configFile >> CONFIG_VEHICLES >> (_bp) >> "maximumload");		
	//	_cfg = M_CONFIG(getNumber,CONFIG_KLAMOTTEN,_bp,"LigaInv");
	//	_load = round(_cfg / 8);			
		_vescfg = M_CONFIG(getNumber,CONFIG_KLAMOTTEN,_vp,"LigaInv");	
		life_maxWeight = life_maxWeightT + _cfg + _vescfg;		
	};		
	if(EQUAL(_bp,"")) then  
	{	
		_vescfg = M_CONFIG(getNumber,CONFIG_KLAMOTTEN,_vp,"LigaInv");	
		life_maxWeight = life_maxWeightT + _vescfg;		
			
	}else{	
		//_cfg = getNumber(configFile >> CONFIG_VEHICLES >> (_bp) >> "maximumload");		
		if(!isClass (missionConfigFile >> CONFIG_KLAMOTTEN >> _bp )) then {
			_cfg = getNumber(configFile >> CONFIG_VEHICLES >> (_bp) >> "maximumload");	
			_cfg = round(_cfg/8);
		}else{
			_cfg = M_CONFIG(getNumber,CONFIG_KLAMOTTEN,_bp,"LigaInv");
		};	
		//_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _cfg;			
	};
};	

_fnc_radioakt = {
	if(player GVAR["Revive",false]) exitWith{};
    if(EQUAL(uniform player,"U_C_Scientist")) then {
        hint "!!! Du betrittst die Radioaktive Sperrzone !!! Aber dein Schutzanzug schuetzt dich";
    }else{
        hint "!!! ACHTUNG RADIOAKTIVE ZONE !!! DU KANNST STERBEN, WENN DU KEINEN SCHUTZANZUG AN HAST";
        player setDamage (damage player + 0.1);
        [] call life_fnc_hudUpdate;
    };	
};
[]call _fnc_bp;
/*>>>>>>>> MAIN LOOP <<<<<<<<<<*/
	while{true} do
	{
		if(SUBT(_SaveTime)   	> 1800	) then 	{[] call SOCK_fnc_updateRequest;hint "Naechster AutoSave in: 30 Minuten"; _SaveTime = ZEIT;};
		if(SUBT(_waterTime)  	> 601	) then 	{[] call _fnc_water; _waterTime = ZEIT;};
		if(SUBT(_foodTime)    	> 849	) then 	{[] call _fnc_food; _foodTime = ZEIT;};
		//if(SUBT(_updateTime)  	> 21	) then 	{if!(EQCHECK) then {[] call life_fnc_hudUpdate;_checkAr = CHECKARR;};_updateTime = ZEIT;};
		if(SUBT(_radioATime)  	> 15	) then 	{if!(EQCHECK) then {[] call life_fnc_hudUpdate;_checkAr = CHECKARR;}; if(player distance _radioMark < 550) then {if!(nu_de)then{nu_de = true; PVAR_ALL("nu_de");}; /*if(player distance _radioMark < 280) then {[]call _fnc_radioakt;};*/}; /*if (surfaceIsWater position player) then {enableEnvironment true;}else{enableEnvironment false;};*/ _radioATime = ZEIT;};
		UISL(0.3);	
		if(SIDECHECK					) then 	{if (SIDECHECK2) then {[player,false,side player] remoteExecCall ["TON_fnc_managesc",RSERV];[player,true,side player] remoteExecCall ["TON_fnc_managesc",RSERV];};};
		//if(CMDMEQ						) then  { _lastMenu = commandingMenu; if(!CMDMCHECK) then {		[profileName,steamid,"INFO... nicht erlaubtes CMD Menue",(format["Menue %1",commandingMenu])] remoteExec ["SPY_fnc_cookieJar",RSERV];		showCommandingMenu "";}; };
		if(SUBT(_TagATime)    	> 101	) then 	{{if(isNull _x) then {liga_tag deleteAt _forEachIndex;};}foreach liga_tag;  _TagATime = ZEIT;};
		if(SUBT(_DelGroupTime)	> 301	) then 	{/*0 setFog 0;*/ 20 setOvercast (D41_Vorschau);setWind (D41_Wind);	60 setWaves (D41_Wellen); {    	if(local _x && {(count units _x == 0)}) then {      deleteGroup _x;       	};           } foreach allGroups; _DelGroupTime = ZEIT;};
		if(SUBT(_walkTime) 	 	> 8 	) then	{
			if(!alive player) 			  then  {_walkDis = 0;} else {
				_curPos = visiblePosition player;
				_curPos = (SEL(_curPos,0)) + (SEL(_curPos,1));
				if(!(EQUAL(_curPos,_lastPos)) && {(isNull objectParent player)}) then {
					ADD(_walkDis,1);
					if(_walkDis >= 15) then {
						_walkDis = 0;
						SUB(life_thirst,2);
						SUB(life_hunger,1);
						[] call life_fnc_hudUpdate;
						SVAR_PRONS ["liga_thi",life_thirst];
						SVAR_PRONS ["liga_hun",life_hunger];
					};
				};
				_lastPos = visiblePosition player;
				_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));			
			};
			_walkTime = ZEIT;
		};
		// Fahrzeug Check
		if(!(EQUAL(vehicle player,_lastState)) OR {!alive player}) then {_lastState = vehicle player; [] call life_fnc_updateViewDistance;[]call LIGACL_fnc_IgiVehInit; []call life_fnc_fuelCheck; [] call life_fnc_hudUpdate; 15 setFog 0; UISL(1.5);};
		UISL(0.3);	
		if(SIDECHECK) then {if (SIDECHECK2) then {[player,false,side player] remoteExecCall ["TON_fnc_managesc",RSERV];[player,true,side player] remoteExecCall ["TON_fnc_managesc",RSERV];};};
		//if(CMDMEQ						) then  { _lastMenu = commandingMenu; if(!CMDMCHECK) then {		[profileName,steamid,"INFO... nicht erlaubtes CMD Menue",(format["Menue %1",commandingMenu])] remoteExec ["SPY_fnc_cookieJar",RSERV];		showCommandingMenu "";};};
		if(!(EQUAL(backpack player,_bp)) || !(EQUAL(vest player,_vp)) || !(EQUAL(uniform player,_un)))then	{[] call _fnc_bp; []call life_fnc_ligaSetClothText;	_vp = vest player;_bp = backpack player;_un = uniform player;};
		if(!(EQUAL(damage player,_dam)))	then {[] call life_fnc_hudUpdate;};	
		if(_nuke) 							then {if(nu_de) then {_nuke = false; [] execVM "scripts\nuke\nuke.sqf"; };	};
		UISL(0.4);			
		if(SIDECHECK) then {if (SIDECHECK2) then {[player,false,side player] remoteExecCall ["TON_fnc_managesc",RSERV];[player,true,side player] remoteExecCall ["TON_fnc_managesc",RSERV];};};
		//if(CMDMEQ						) then  { _lastMenu = commandingMenu; if(!CMDMCHECK) then {		[profileName,steamid,"INFO... nicht erlaubtes CMD Menue",(format["Menue %1",commandingMenu])] remoteExec ["SPY_fnc_cookieJar",RSERV];		showCommandingMenu "";}; };
		//if((unitRecoilCoefficient player) < 1) then {[profileName,steamid,"No recoil hack",(format["akt Recoil %1",unitRecoilCoefficient player]),player] remoteExec ["SPY_fnc_cookieJar",RSERV]; SKYNET_END};
	};