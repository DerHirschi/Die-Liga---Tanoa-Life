#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_federalUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Uhhh, adds to it?
*/


private ["_fnc_owner2HC","_fnc_srv_diag","_fnc_D41_WetterWerte","_timeend","_time1","_time5","_time30","_time60","_time20","_fnc_Dealer","_fnc_fed","_fnc_group","_fnc_wetter","_fnc_dbSave"];

_time1  = time;
_time5  = time;
_time20 = time;
_time30 = time;
_time60 = time;
_timeend = time;
//_timeLotto = time;

srv_diag_run = false;

D41_Nebel = [0,0,0];
D41_Wellen = 1;
D41_Vorschau = 0.5;
D41_Wind = [1, 1, true];
D41_Regen = 0;
D41_RegenCounter = 1;

_fnc_srv_diag = {
	if(srv_diag_run)then {
		SKY_srvdiag_link = [0,(count diag_activeSQFScripts),diag_fps,diag_fpsMin,(count playableUnits)];		
		//[4] spawn SKY_fnc_DBlogSys
		HC_id publicVariableClient 'SKY_srvdiag_link';
		[4] remoteExec ["SKY_fnc_DBlogSys",HC_id];
	};
};

	
_fnc_D41_WetterWerte =
	{
			D41_ChanceN = round(random 100);
			if(D41_ChanceN <= 5) then
				{
					D41_Nebel = [0,0,0]; D41_Wellen = 1; D41_Vorschau = 0.2; D41_Wind = [2, 2, true]; D41_Regen = 0; D41_RegenCounter = 0;
					D41_WMod = round(random 9);
					if(EQUAL(D41_WMod,0))	exitWith {D41_Nebel = [0,0,0];		D41_Regen = 0;	D41_Vorschau = 0.4;}; //Dicht
					if(EQUAL(D41_WMod,1))	exitWith {D41_Nebel = [0,0,0];		D41_Regen = 0;	D41_Vorschau = 0.3;};
					if(EQUAL(D41_WMod,2))	exitWith {D41_Nebel = [0,0,0];		D41_Regen = 0;	D41_Vorschau = 0.2;}; //geht so, akzeptabler Nebel
					if(EQUAL(D41_WMod,3))	exitWith {D41_Nebel = [0,0,0];	D41_RegenCounter = 0;}; //Dicht
					if(EQUAL(D41_WMod,4))	exitWith {D41_Nebel = [0,0,0];	D41_Regen = 0;	D41_Vorschau = 0.4;};
					if(EQUAL(D41_WMod,5))	exitWith {D41_Nebel = [0,0,0];	D41_RegenCounter = 0;}; //geht so, akzeptabler Nebel
					if(EQUAL(D41_WMod,6))	exitWith {D41_Nebel = [0,0,0];	D41_RegenCounter = 0;};
					if(EQUAL(D41_WMod,7))	exitWith {D41_Nebel = [0,0,0];	D41_Regen = 0;	D41_Vorschau = 0.5;};
					if(EQUAL(D41_WMod,8))	exitWith {D41_Nebel = [0,0,0];	D41_RegenCounter = 0;}; //geht so, akzeptabler Nebel
					if(EQUAL(D41_WMod,9))	exitWith {D41_Nebel = [0,0,0];	D41_Regen = 0;	D41_Wellen = 1;	D41_Vorschau = 0.5;}; //Hoch halt
				};
			if(D41_ChanceN >=6 && D41_ChanceN <= 35 && D41_RegenCounter == 0) then
				{
					D41_Nebel = [0,0,0]; D41_Wellen = 1; D41_Vorschau = 1; D41_Regen = 0; D41_RegenCounter = 0;
					D41_WMod = round(random 9);
					if(EQUAL(D41_WMod,0))	exitWith {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 1; 	D41_Wind = [4, 4, true];	D41_Regen = 0.6;};
					if(EQUAL(D41_WMod,1))	exitWith {D41_Nebel = 0.3;	D41_Wellen = 1;		D41_Vorschau = 1; 	D41_Wind = [4, 4, true];	D41_Regen = 0.6;};
					if(EQUAL(D41_WMod,2))	exitWith {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.9; D41_Wind = [4, 4, true];	D41_Regen = 0.5;};
					if(EQUAL(D41_WMod,3))	exitWith {D41_Nebel = 0.2;	D41_Wellen = 1;		D41_Vorschau = 0.8; D41_Wind = [0, 5, true];	D41_Regen = 0.5;};
					if(EQUAL(D41_WMod,4))	exitWith {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.7; D41_Wind = [6, 0, true];	D41_Regen = 0.3;};
					if(EQUAL(D41_WMod,5))	exitWith {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.7; D41_Wind = [0, 6, true];	D41_Regen = 0.3;};
					if(EQUAL(D41_WMod,6))	exitWith {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.6; D41_Wind = [5, 0, true];	D41_Regen = 0.2;};
					if(EQUAL(D41_WMod,7))	exitWith {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.5; D41_Wind = [2, 4, true];	D41_Regen = 0.2;};
					if(EQUAL(D41_WMod,8))	exitWith {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.4; D41_Wind = [3, 2, true];	D41_Regen = 0.2;};
					if(EQUAL(D41_WMod,9))	exitWith {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.4; D41_Wind = [2, 1, true];	D41_Regen = 0.1;};
				};
			if(D41_ChanceN >=6 && D41_ChanceN <= 35 && D41_RegenCounter == 1) then {D41_ChanceN = 36};
			if(D41_ChanceN >=36 && D41_ChanceN <= 90) then
			{
				D41_Nebel = [0,0,0]; D41_Wellen = 1; D41_Vorschau = 0.2; D41_Wind = [5, 5, true]; D41_Regen = 0; D41_RegenCounter = 0;
				D41_WMod = round(random 9);
				if(EQUAL(D41_WMod,0))	exitWith {D41_Vorschau = 0.9;	D41_Wind = [3, 0, true];};
				if(EQUAL(D41_WMod,1))	exitWith {D41_Vorschau = 0.9;	D41_Wind = [0, 3, true];};
				if(EQUAL(D41_WMod,2))	exitWith {D41_Vorschau = 0.7;	D41_Wind = [2, 3, true];};
				if(EQUAL(D41_WMod,3))	exitWith {D41_Vorschau = 0.7;	D41_Wind = [3, 2, true];};
				if(EQUAL(D41_WMod,4))	exitWith {D41_Vorschau = 0.6;	D41_Wind = [0, 3, true];};
				if(EQUAL(D41_WMod,5))	exitWith {D41_Vorschau = 0.6;	D41_Wind = [2, 0, true];};
				if(EQUAL(D41_WMod,6))	exitWith {D41_Vorschau = 0.5;	D41_Wind = [2, 2, true];};
				if(EQUAL(D41_WMod,7))	exitWith {D41_Vorschau = 0.5;	D41_Wind = [2, 0, true];};
				if(EQUAL(D41_WMod,8))	exitWith {D41_Vorschau = 0.4;	D41_Wind = [0, 2, true];};
				if(EQUAL(D41_WMod,9))	exitWith {D41_Vorschau = 0.4;	D41_Wind = [1, 1, true];};
				
			};
			if(D41_ChanceN >=91 && D41_ChanceN <= 100) then
			{
				D41_Nebel = [0,0,0]; D41_Wellen = 1; D41_Vorschau = 0.2; D41_Wind = [1, 1, true]; D41_Regen = 0; D41_RegenCounter = 1;
				D41_WMod = round(random 2);
				if(EQUAL(D41_WMod,0))	exitWith {D41_Vorschau = 0.2;	D41_Wind = [3, 0, true];};
				if(EQUAL(D41_WMod,1))	exitWith {D41_Vorschau = 0.2;	D41_Wind = [0, 3, true];};
				if(EQUAL(D41_WMod,2))	exitWith {D41_Vorschau = 0.1;	D41_Wind = [0, 0, true];};				
			};
			Diag_log format ["::::::::: WETTER SYSTEM ::::::::: D41_ChanceN = %1 ::: D41_WMod = %2",D41_ChanceN, D41_WMod];
	//		publicVariable "D41_Nebel";
			publicVariable "D41_Wellen";
			publicVariable "D41_Vorschau";
			publicVariable "D41_Wind";
	//		publicVariable "D41_Regen";
		
};

_fnc_wetter = {
	[] call _fnc_D41_WetterWerte;
	uiSleep 2;
	0 setOvercast (D41_Vorschau);
	setWind (D41_Wind);
	60 setWaves (D41_Wellen);	
	0 setFog 0;
};

_fnc_Dealer ={
	private["_logic","_queue"];
	_logic = missionnamespace GVAR ["bis_functions_mainscope",objnull];
	_queue = _logic GVAR "BIS_fnc_MP_queue";
	_logic SVAR["BIS_fnc_MP_queue",[],true];
	{_x SVAR["sellers",[],true];} foreach [Dealer_1,Dealer_2,Dealer_3];	
};

_fnc_group = {
    {   if(local _x && EQUAL(count units _x,0) ) then {deleteGroup _x;	};} foreach allGroups;	
	
};

_fnc_fed = {
	private["_funds"];
		
	_funds = fed_bank GVAR["safe",0];
	fed_bank SVAR["safe",round(_funds+((count playableUnits)/3)),true];	
};


_fnc_dbSave = {	
	
	{
		diag_log format["║ WH Save- %1  gestartet !!!!!",_x];
		diag_log format["║ QUERRY : %1",(GVAR_MNS [_x,[]])];
		_query 			= format["WHset:%1:%2",_x,GVAR_MNS _x];	
		_query 			= [_query,1] call DB_fnc_asyncCall;
			
	}forEach ["liga_wh_1","liga_wh_2","liga_wh_3","liga_wh_4"];
	
};	

_fnc_owner2HC = {
	if(SKY_HC_aktiv_1)then{
		{		
			if(local _x && !(isPlayer _x)) then {				
				_x setOwner HC_id; 
			};			
		}forEach (vehicles);	
	};
};
//[] spawn TON_fnc_RestartClean;	
//[] spawn TON_fnc_cleanup;

// >>>>>>>>> MAIN LOOP <<<<<<<<<<<<

[] call _fnc_D41_WetterWerte;

while {true} do
{
	/*Restart Cleanup ENDE*/
	if((time - _timeend)    > 28680	)then {[]call TON_fnc_cleanup;[] call TON_fnc_RestartClean;[] call _fnc_dbSave;  _timeend = time;};	
	/*FPS LOG 1 Minute */
	if((time - _time1)     > 60		)then {[]call _fnc_srv_diag; /*[] call _fnc_dbSave;*/_time1 = time;};
	/*GRP Cleanup 5 Minuten */
//	if((time - _time5)     > 301	)then {[]call _fnc_group; _time5 = time;};
	/*Wetter 20 Minuten*//*Junk 2 HC*/
	if((time - _time20)    > 1199	)then {[]call _fnc_wetter;/*[]call _fnc_owner2HC;*/ _time20 = time;};
	
	//if((time - _timeLotto)    > 1800	)then {   if(EQUAL(LottoDay,3) )  then   {   []spawn TON_fnc_LottoZieh; LottoDay = 4; };	_timeLotto = time; };
	/*Dealer & FED 30 Minuten*/
	if((time - _time30)    > 1801	)then {/*[]call _fnc_fed;[]call _fnc_Dealer;*/_time30 = time;[]call TON_fnc_cleanup; [] call TON_fnc_ligaWHranDump;[] call _fnc_dbSave; if(EQUAL(LottoDay,3) )  then   {   []spawn TON_fnc_LottoZieh;  };};
	/*DB Save & Cleanup 60 Minuten*/
	//if((time - _time60)    > 85	)then {[]call TON_fnc_cleanup;[] call _fnc_dbSave; _time60 = time; };
	/*60 Minuten */
	if((time - _time60)    > (10000 + ((round  (random 60)) * (round  (random 60)) ) )	)then {	[]call TON_fnc_ligaWHdump;	[] call _fnc_dbSave;_time60 = time;};


	//diag_log format ["<<<<< %1",count diag_activeSQFScripts];
	uiSleep 5;
	0 setfog 0;
};