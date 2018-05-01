#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
private["_house","_tank"];
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};
//diag_log format [">>>>>>> %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %111",(_this select 0),(_this select 1),(_this select 2),(_this select 3),(_this select 4),(_this select 5),(_this select 6),(_this select 7),(_this select 8),(_this select 9),(_this select 10)];
0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this")  					exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(typeName _this,"STRING")) 	exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(count _this,0)) 			exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(SEL(_this,0),"Error")) 	exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(!(EQUAL(steamid,SEL(_this,0)))) 	exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator")) exitWith {
	[profileName,getPlayerUID player,"VariablesAlreadySet",(format["Variables set before client initialization...\nlife_adminlevel %1\nlife_coplevel %2\nlife_donator %3",life_adminlevel,life_coplevel,life_donator])] remoteExec ["SPY_fnc_cookieJar",RSERV];
	//[profileName,format["Variables set before client initialization...\nlife_adminlevel %1\nlife_coplevel %2\nlife_donator %3",life_adminlevel,life_coplevel,life_donator]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
	sleep 0.9;
	SKYNET_END
};


//Parse basic player information.
CASH = parseNumber (SEL(_this,2));
BANK = parseNumber (SEL(_this,3));
CONST(life_adminlevel,parseNumber (SEL(_this,4)));
//CONST(life_donator,parseNumber (SEL(_this,5)));
CONST(life_donator,0);

//Loop through licenses
if(count (SEL(_this,6)) > 0) then {
	{SVAR_MNS [SEL(_x,0),SEL(_x,1)];} foreach (SEL(_this,6));
};

life_gear = SEL(_this,8);
[] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
	//	CONST(life_coplevel, parseNumber(SEL(_this,7)));
		CONST(life_coplevel,SEL(_this,7));
		life_blacklisted = 0;
		CONST(life_medicLevel,0);
		CONST(life_adaclevel,0);		
	};
/*	
	case independent: {
		//CONST(life_medicLevel, parseNumber(SEL(_this,7)));
		CONST(life_medicLevel,SEL(_this,7) );
		CONST(life_coplevel,0);
	};
*/
	case east: {
		CONST(life_adaclevel,SEL(_this,7));
		CONST(life_copLevel,0);
		CONST(life_medicLevel,0);      
    };
	case default {
	
		life_is_arrested = SEL(_this,7);
		CONST(life_coplevel,SEL(_this,14));
		CONST(life_medicLevel,SEL(_this,15));
		//CONST(life_coplevel,0);
		//CONST(life_medicLevel,0);
		CONST(life_adaclevel,0);		
		life_houses = SEL(_this,9);
		{
			_house = nearestBuilding (call compile format["%1", SEL(_x,0)]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		[] spawn life_fnc_initHouses;
		life_gangData = SEL(_this,10);
		if(!(EQUAL(count life_gangData,0))) then {
			[] spawn life_fnc_initGang;
		};//else{[player] join (createGroup west);};
		
		life_blacklisted = SEL(_this,11);
		
		liga_tankhouses = SEL(_this,13);
		{	//_tank = nearestObject [SEL(_x,0),"Land_FuelStation_01_pump_F"];	
			_tank = nearestObjects [SEL(_x,0), ["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"], 20];
			_tank = SEL(_tank,0);		
			life_vehicles pushBack _tank;
		} foreach liga_tankhouses;	
		[]spawn LIGACL_fnc_InitTank;
		
		liga_ladenhouses = SEL(_this,16);
		[]spawn LIGACL_fnc_initLaden;
	};	
};

if(count (SEL(_this,12)) > 0) then {
	{life_vehicles pushBack _x;} foreach (SEL(_this,12));
};

life_session_completed = true;