

/*
#include "\life_server\Liga_Macros.hpp"
//TON_fnc_IntroControll
private["_playerAr","_blacki"];
	
_mode	= [_this,0,-1,[0]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_blacki = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_group  = [_this,3,grpNull,[grpNull]] call BIS_fnc_param;

if(EQUAL(_mode,-1) || isNull _player ) exitWith {};

if(isNil "Intro_Array") then {Intro_Array = [[],[]]};
switch (_mode) do {
	case 0: {//Login
		_playerAr = SEL(Intro_Array,0);
		{
			if((isNull _x) || (_x isEqualTo _player)) then {
				_playerAr deleteAt _forEachIndex;
				Intro_Array set [0,_playerAr];
			};
		}forEach _playerAr;
	
		
		_playerAr = SEL(Intro_Array,1);
		{
			if((isNull (_x select 1)) ) then {
				_playerAr deleteAt _forEachIndex;
				Intro_Array set [1,_playerAr];
			};
		}forEach _playerAr;
		_playerAr = SEL(Intro_Array,0);
		
		_playerAr pushBack _player;
		Intro_Array set [0,_playerAr];	// Wait Array
		Intro_Go = false;
		PVAR_ID("Intro_Go",owner _player);
		uiSleep 2;


		diag_log str Intro_Array;
		diag_log str (SEL(SEL(Intro_Array,0),0));
		if(count SEL(Intro_Array,1) isEqualTo 0) then {
			waitUntil{
				sleep 0.5; 
				(SEL(SEL(Intro_Array,0),0) isEqualTo _player)  
				
			};
		}else{
			waitUntil{
				sleep 0.5; 
				if!(count SEL(Intro_Array,1) isEqualTo 0) then {
					
					(SEL(SEL(Intro_Array,0),0) isEqualTo _player) &&  (((SEL(SEL(Intro_Array,1),1)) distance [7636.64,1086.43,680]) > 2500 )
				}else{
					(SEL(SEL(Intro_Array,0),0) isEqualTo _player) 
				};
			};			
		};
		Intro_Go = true;
		PVAR_ID("Intro_Go",owner _player);
		Intro_Go = false;
		//_playerAr = SEL(Intro_Array,0);
		//_playerAr deleteAt 0;
		//Intro_Array set [0,_playerAr];
		//_playerAr = SEL(Intro_Array,1);
		//_playerAr pushBack [_player,ObjNull,grpNull];	// Activ Array
		//Intro_Array set [1,_playerAr];
		diag_log format [">>>>> INTRO LOGIN ARRAY: %1",Intro_Array];
	};		
	case 1: {//DISCO Failsafe
		if(isNull _blacki ) exitWith {};
		
		_playerAr = SEL(Intro_Array,1);
		{
			if(EQUAL(_player,_x)) exitWith {
				_playerAr pushBack [_player,_blacki,_group];
				Intro_Array set [1,_playerAr];
				_playerAr = SEL(Intro_Array,0);
				_playerAr deleteAt _forEachIndex;
				Intro_Array set [0,_playerAr];
			};
		}forEach SEL(Intro_Array,0);
		
	//	if(isNull _group ) exitWith {};
		while {!isNull _blacki} do {
			if!(isNull _player) then {
				if!(isPlayer _player) then {
					_blacki engineOn true;
					_blacki land "NONE";
					
					_blacki forceSpeed  147;
					_blacki flyInHeight 4000;
					_blacki move [50,50,5000];
					
					_playerAr = SEL(Intro_Array,1);
					{
						if(EQUAL((_this select 1),SEL(_x,1))) exitWith {
							_playerAr deleteAt _forEachIndex;
							Intro_Array set [1,_playerAr];
						};
					}forEach _playerAr;
					[_group,_blacki] spawn {	
						private["_i"];
						for "_i" from 0 to 180 do {
							uiSleep 1;
							if(((getPos (_this select 1) )select 2) > 3000) exitWith { };				
						};


						{if!(isPlayer _x) then {deleteVehicle _x};}forEach units (_this select 0) ;
						deleteVehicle (_this select 1);
					};
					

				};
			}else{
				_blacki engineOn true;
				_blacki land "NONE";
				
				_blacki forceSpeed  147;
				
				_blacki move [50,50,5000];
				_blacki flyInHeight 4000;
				_playerAr = SEL(Intro_Array,1);
				{
					if(EQUAL((_this select 1),SEL(_x,1))) exitWith {
						_playerAr deleteAt _forEachIndex;
						Intro_Array set [1,_playerAr];
					};
				}forEach _playerAr;				
				[_group,_blacki] spawn {	

					private["_i"];
					for "_i" from 0 to 180 do {
						uiSleep 1;
						if(((getPos (_this select 1) )select 2) > 3000) exitWith { };				
					};


					{if!(isPlayer _x) then {deleteVehicle _x};}forEach units (_this select 0) ;
					deleteVehicle (_this select 1);
				};
				

			};			
			uiSleep 1;
			diag_log format [">>>>> INTRO FAILSAFE ARRAY: %1",Intro_Array];
		};		
	};
	case 2: {//EXIT
		_playerAr = SEL(Intro_Array,1);
		{
			if(EQUAL(_player,SEL(_x,0))) exitWith {
				_playerAr deleteAt _forEachIndex;
				Intro_Array set [1,_playerAr];
			};
		}forEach _playerAr;
		diag_log format [">>>>> INTRO EXIT ARRAY: %1",Intro_Array];
	};
	case 3: {//EXIT Fail
		_playerAr = SEL(Intro_Array,0);
		{
			if(EQUAL(_player,_x)) exitWith {
				_playerAr deleteAt _forEachIndex;
				Intro_Array set [0,_playerAr];
			};
		}forEach _playerAr;
		diag_log format [">>>>> INTRO EXIT FAIL ARRAY: %1",Intro_Array];
	};	
};
*/

#include "\life_server\Liga_Macros.hpp"
//TON_fnc_IntroControll
private["_playerAr","_blacki"];
	
_mode	= [_this,0,-1,[0]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_blacki = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_group  = [_this,3,grpNull,[grpNull]] call BIS_fnc_param;

if(EQUAL(_mode,-1) || isNull _player ) exitWith {};

if(isNil "Intro_Array") then {Intro_Array = [[],[]]};
switch (_mode) do {
	case 0: {//Login
		_playerAr = SEL(Intro_Array,0);
		_playerAr pushBack _player;
		Intro_Array set [0,_playerAr];	// Wait Array
		Intro_Go = false;
		PVAR_ID("Intro_Go",owner _player);
		uiSleep 2;
		{		
			if(!isNull SEL(_x,1)) then { 
				if((SEL(_x,1) distance2D [7636.64,1086.43,680]) < 3000 ) then {
					waitUntil{
						uiSleep 0.3;
						if(!isNull SEL(_x,1)) then { 
							((SEL(_x,1) distance2D [7636.64,1086.43,680]) > 2500 ) && (EQUAL(SEL(SEL(Intro_Array,0),0),_player))
						}else{
							(EQUAL(SEL(SEL(Intro_Array,0),0),_player))
						}	
					};
				};
			}else{
				waitUntil{
					uiSleep 0.3;
					(EQUAL(SEL(SEL(Intro_Array,0),0),_player))
				};	
			};
		}forEach SEL(Intro_Array,1);
		
		Intro_Go = true;
		PVAR_ID("Intro_Go",owner _player);
		Intro_Go = false;
		//_playerAr = SEL(Intro_Array,0);
		//_playerAr deleteAt 0;
		//Intro_Array set [0,_playerAr];
		//_playerAr = SEL(Intro_Array,1);
		//_playerAr pushBack [_player,ObjNull,grpNull];	// Activ Array
		//Intro_Array set [1,_playerAr];
		//diag_log format [">>>>> INTRO LOGIN ARRAY: %1",Intro_Array];
	};		
	case 1: {//DISCO Failsafe
		if(isNull _blacki ) exitWith {};
		
		_playerAr = SEL(Intro_Array,1);
		{
			if(EQUAL(_player,_x)) exitWith {
				_playerAr pushBack [_player,_blacki,_group];
				Intro_Array set [1,_playerAr];
				_playerAr = SEL(Intro_Array,0);
				_playerAr deleteAt _forEachIndex;
				Intro_Array set [0,_playerAr];
			};
		}forEach SEL(Intro_Array,0);
		
		if(isNull _group ) exitWith {};
		while {!isNull _blacki} do {
			if!(isNull _player) then {
				if!(isPlayer _player) then {
					_blacki engineOn true;
					_blacki land "NONE";
					_blacki flyInHeight 4000;
					_blacki forceSpeed  0;
					_blacki move [50,50,5000];
					[_group,_blacki] spawn {	
						private["_i"];
						for "_i" from 0 to 180 do {
							uiSleep 1;
							if(((getPos (_this select 1) )select 2) > 3000) exitWith { };				
						};

						_playerAr = SEL(Intro_Array,1);
						{
							if(EQUAL((_this select 1),SEL(_x,1))) exitWith {
								_playerAr deleteAt _forEachIndex;
								Intro_Array set [1,_playerAr];
							};
						}forEach _playerAr;
						{if!(isPlayer _x) then {deleteVehicle _x};}forEach units (_this select 0) ;
						deleteVehicle (_this select 1);
					};
					
				};
			}else{
				_blacki engineOn true;
				_blacki land "NONE";
				_blacki flyInHeight 4000;
				_blacki forceSpeed  0;
				_blacki move [50,50,5000];
				[_group,_blacki] spawn {	
					private["_i"];
					for "_i" from 0 to 180 do {
						uiSleep 1;
						if(((getPos (_this select 1) )select 2) > 3000) exitWith { };				
					};

					_playerAr = SEL(Intro_Array,1);
					{
						if(EQUAL((_this select 1),SEL(_x,1))) exitWith {
							_playerAr deleteAt _forEachIndex;
							Intro_Array set [1,_playerAr];
						};
					}forEach _playerAr;
					{if!(isPlayer _x) then {deleteVehicle _x};}forEach units (_this select 0) ;
					deleteVehicle (_this select 1);
				};
			};			
			uiSleep 1;
		//	diag_log format [">>>>> INTRO FAILSAFE ARRAY: %1",Intro_Array];
		};		
	};
	case 2: {//EXIT
		_playerAr = SEL(Intro_Array,1);
		{
			if(EQUAL(_player,SEL(_x,0))) exitWith {
				_playerAr deleteAt _forEachIndex;
				Intro_Array set [1,_playerAr];
			};
		}forEach _playerAr;
		//diag_log format [">>>>> INTRO EXIT ARRAY: %1",Intro_Array];
	};
};
