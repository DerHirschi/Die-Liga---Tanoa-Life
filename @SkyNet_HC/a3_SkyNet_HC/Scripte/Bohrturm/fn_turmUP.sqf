#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	╔═════════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░░░║
	║░░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░▀▀▀█▀▀▀░░░║
	║░░░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░█░░░░░░║
	║░░░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░▀░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠═════════════════════════════════════════════════════╝
	║ File: fn_turmUP.sqf
	║ Author: Hirschi - Die Liga
	╚═════════════════════════════════════════════════════╝
	
	[	
		[x.y.z],							|	Pos				|0	|0
		0,									|	DIR				|1	|1
		0,									|	RestartCount	|2	|2
		[[["sig",8],["oilu",7]],66],	|	Trunk Tank 1	|3	|3
		[[["sig",8],["oilu",7]],66],	|	Trunk Tank 2		|4	
		[[["sig",8],["oilu",7]],66],	|	Gerätehaus			|5	
		"7658554546466",					|	STEAM ID pid	|6	|4
		18,									|	Plate			|7	|5
		"Mas Tobias",						|	ProfilName			|8	
		8455								|	VID in DB vid		|9	
		["UID","UID"]						|	KEY UID´s			|10	
	]		
				   Procc,Gas	, ,_ratearray
	SteuerArray [false,false,0,[]]
*/
private["_obj","_varNam","_turm","_turmData","_steuData","_flag","_trig","_trunk","_vidorg","_numOfDoors","_n"];
//_pos = [_this,0,[],[[]]] call BIS_fnc_param;
//diag_log str (_this select 0);
_obj 	 = [_this,0,Objnull,[Objnull]	] call BIS_fnc_param;
_new 	 = [_this,1,false,	[false]		] call BIS_fnc_param;
_unit 	 = [_this,2,Objnull,[Objnull]	] call BIS_fnc_param;
_varNam  = [_this,3,"",		[""]		] call BIS_fnc_param;
_side 	 = civilian;

if(isNull _obj) exitWith {diag_log "ERROR : fn_turmup.sqf .. NO _obj"; };
if!(_obj isKindOf "Land_Device_assembled_F" || _obj isKindOf "Land_dp_transformer_F") exitWith {diag_log "ERROR : fn_turmup.sqf .. falsches Objekt"; };

/*Bohrturm*/
if(_obj isKindOf "Land_Device_assembled_F") exitWith {
	_objpos = getPos _obj;
	_objdir = getDir _obj;
	_obVar 	= _obj GVAR ["dbInfo",["",-1,"",-1]];
	_uid 	= SEL(_obVar,0);
	_vid 	= SEL(_obVar,1);
	_name 	= SEL(_obVar,2);
	_vidorg	= SEL(_obVar,3);
	_trig	= true;
	
	if((EQUAL(_uid,"")) || (EQUAL(_vid,-1)) || (EQUAL(_name,"")) || (EQUAL(_vidorg,-1))) exitWith {diag_log "ERROR : fn_turmup.sqf .. ObjektVariablen konnten nicht gelesen werden ...";};
	// Suche freien Slot .. für neuaufbau
	
	if(_new) then {
		_trig = false;
		/*5 Slots nach Nil suchen*/
		for "_i" from 1 to 5 do {
			if(_trig) exitWith {};
			_varNam 	= format ["LigaBohrturm_%1",_i];
			_turmData 	= profileNamespace GVAR [_varNam,""];
			
			if(EQUAL(_turmData,"")) then {
				/*Default Array*/
				_flag = [	
							_objpos,	//0		Pos
							_objdir,	//1		DIR
							3,			//2		Zähler
							[[],0],		//3		Trunk Tank1
							[[],0],		//4		Trunk Tank2
							[[],0],		//5		Gerätehaus
							_uid,		//6		STEAM ID pid
							_vid,		//7		Plate	
							_name, 		//8		ProfilName
							_vidorg,	//9		VID vid
							[]			//10	Key Array
						];
				/*Default Array*/
				profileNamespace SVAR [_varNam, _flag];					
				_trig = true;			
				
			};	
		};	
	};
	/*Slot Frei*/
	if(_trig)then{
		
		if(EQUAL(_varNam,"")) exitWith {};

		deleteVehicle _obj;
		//waitUntil {isNull _obj};
		_obj  = "Land_Device_disassembled_F" createVehicle [0,0,0];
	//	_obj1 = "ContainmentArea_01_sand_F"  createVehicle [0,0,0];
		_obj  setPos _objpos;
	//	_obj1 setPos _objpos;
		_obj  setDir _objDir;
	//	_obj1 setDir _objDir;

		_objarray  = [_objpos,"BT_1"]call SKY_fnc_objBuilder;
		_obj1 = SEL(_objarray,0);
		_obj1 setPos _objpos;
		_obj1 setDir (_objDir + 90);
		_obj1 setVectorUp [0,0,1];
		_trunkData = profileNamespace GVAR [_varNam,""];
		/* Steuer VARS */
		_steuData  = profileNamespace GVAR [(_varNam + "_steu"),""];
		if(EQUAL(_steuData,"")) then {
			_steuData = [false,false,0,0];	//Default
			profileNamespace SVAR [(_varNam + "_steu"),_steuData];
		};			
		profileNamespace SVAR [(_varNam + "_ObjArr"), 	nil];
		profileNamespace SVAR [(_varNam + "_ObjArr"), 	_objarray];
		SYSLOG(SKYID,"Turm aufgebaut",_varNam,_name,_uid);
		//if!(isNull _unit) then {
		//	[1,"Der Turm wird jetzt aufgebaut. Bitte entferne dich und deine Fahrzeuge aus dem Baubereich."] remoteExec ["life_fnc_broadcast",(owner _unit)];
		//};
		_n 	= 0;
		/* LagerTanks Setup */
		{
			/*Gerätehaus*/
			if( EQUAL(typeOf _x,"Land_Research_house_V1_F")	) then {
			/*Set local Vars*/				
							
			/*Trunk from Array*/	
				
				if(EQUAL(_varNam,"")) then {
					RPT("fn_turmUP.sqf","FEHLER beim auslesen der Profildaten");
					SYSLOG(SKYID,"Turm Aufbau Fehler","fn_turmUP.sqf","FEHLER beim auslesen der Profildaten",_varNam);
					_trunk = [[],0];
				}else{
					_trunk = SEL(_trunkData,5);	// Gerätehaus 5
				};
			/*Set global Vars*/	
				_x SVAR ["turm_ObArr"	,_objarray 		,true];	
				_x SVAR ["turm_slot"	,_varNam 		,true];
				_x SVAR ["Trunk"		,_trunk 		,true];				
				_x SVAR ["trunk_in_use"	,false			,true];
				_x SVAR ["locked"		,true			,true];
				_x SVAR ["house_owner"	,[_uid,_name]	,true];	
								
			/*Key over Net*/
				[_uid,_side,_x,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
				if(_new) then {
					[_x] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
				};
			/*Lock Doors*/	
				_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "numberOfDoors");
				for "_i" from 1 to _numOfDoors do {
					_x SVAR[format["bis_disabled_Door_%1",_i],1,true];
				};
				_obj = _x;
			};
			
			/*Tanks*/
			if( EQUAL(typeOf _x,"Land_Tank_rust_F")	) then {	
			/*VARS local*/					
				
			/*Trunk from Array*/					
				if(EQUAL(_varNam,"")) then {
					RPT("fn_turmUP.sqf","FEHLER beim auslesen der Profildaten");
					SYSLOG(SKYID,"Turm Aufbau Fehler","fn_turmUP.sqf","FEHLER beim auslesen der Profildaten",_varNam);
					_trunk = [[],0];
				}else{
					_trunk = SEL(_trunkData,3 + _n);	// Tanks | 3 & 4
				};
			/*VARS global*/		
				_x SVAR ["turm_ObArr"	,_objarray 	,true];	
				_x SVAR ["turm_slot"	,_varNam 	,true];	
				_x SVAR ["Trunk"		,_trunk 	,true];
				_x SVAR ["trunk_in_use"	,false		,true];
				_x SVAR ["locked"		,true		,true];
					
				_n	= _n + 1;
			/*Key to NET*/	
				[_uid,_side,_x,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
				if(_new) then {
					[_x] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
					
				};
				_flag = _x;
				{
					[_x,_side,_flag,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
				}forEach SEL(_trunkData,10);
			};
		}forEach _objarray;
		
		{
			[_x,_side,_obj,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
		}forEach SEL(_trunkData,10);
		
		uiSleep 50;
		
		[_objarray,"BT_1",_objpos,_objDir] call SKY_fnc_objAttatch;
		uiSleep 20;
		[_steuData,_obj] call LIGA_fnc_ProccInit;
		//Liga_t = Liga_t + _objarray;
		//PVAR_ALL("Liga_t");
		/*Kein Slot Frei*/
	}else{
		if!(isNull _unit) then {
			[1,"Es sind bereits alle 5 Bohrplätze vergeben... Versuche es spaeter noch einmal .."] remoteExec ["life_fnc_broadcast",(owner _unit)];
		};
	};
};

//if(EQUAL(_pos,[])) exitWith {diag_log "ERROR : fn_turmup.sqf .. NO _pos"; SYSLOG(SKYID,"ERROR : fn_turmup.sqf .. NO _pos","","","");};






