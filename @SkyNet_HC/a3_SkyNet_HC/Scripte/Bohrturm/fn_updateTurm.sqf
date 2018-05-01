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
	║ File: fn_updateTurm.sqf
	║ Author: Hirschi - Die Liga
	╚═════════════════════════════════════════════════════╝
	
	[	
		[x.y.z],							|	Pos				|0	|0
		0,									|	DIR				|1	|1
		0,									|	RestartCount	|2	|2
		[[["sig",8],["oilu",7]],66],	|	Trunk Tank 1	|3	|3
		[[["sig",8],["oilu",7]],66],	|	Trunk Tank 2		|4	
		[[["sig",8],["oilu",7]],66],	|	Gerätehaus		|5	
		"7658554546466",					|	STEAM ID pid	|6	|4
		18,									|	Plate			|7	|5
		"Mas Tobias",					|	ProfilName		|8	
		8455								|	VID in DB vid	|9	
		["UID","UID"]					|	KEY UID´s			|10	
	]		
*/
private["_trunk","_n","_turmData"];		
_obj 	 	= [_this,0,Objnull,	[Objnull]	] call BIS_fnc_param;
_keyUID		= [_this,1,"",		[""]		] call BIS_fnc_param;
//RPT("_keyUID",_keyUID);
if(isNull _obj) exitWith {diag_log "ERROR : fn_updateTurm.sqf .. NO _obj"; };
if!(typeOf _obj in ["Land_Tank_rust_F","Land_Research_house_V1_F"]) exitWith {diag_log "ERROR : fn_updateTurm.sqf .. falsches Objekt"; };

_slot 		= _obj GVAR ["turm_slot",""];
if(EQUAL(_slot,"")) exitWith {diag_log "ERROR : fn_updateTurm.sqf .. Keine SLOT VAR";};
//RPT("_slot",_slot);
_turmData 	= profileNamespace GVAR [_slot,[]];
if(EQUAL(_turmData,[])) exitWith {diag_log "ERROR : fn_updateTurm.sqf .. Keine Turm Daten";};
//RPT("_turmData",_turmData);
_objArr		= _obj GVAR ["turm_ObArr",[]];
if(EQUAL(_objArr,[])) exitWith {diag_log "ERROR : fn_updateTurm.sqf .. Keine Obj Array";};
//RPT("_objArr",_objArr);
_n = 0;		
/*Loop durchs ObjektArray*/	
{
	if( EQUAL(typeOf _x,"Land_Research_house_V1_F")	) then {
		_trunk 	=	_x GVAR ["Trunk"		,[[],0]	];
		_turmData set [5,_trunk];
	};
	if( EQUAL(typeOf _x,"Land_Tank_rust_F")			) then {
		_trunk 	=	_x GVAR ["Trunk"		,[[],0]	];
		_turmData set [(3 + _n),_trunk];
		_n = _n + 1;
	};
}forEach _objArr;	
/*KEY*/
if!(EQUAL(_keyUID,"")) then {
	_n = SEL(_turmData,10);
	_n pushBack _keyUID;
	_turmData set [10,_n];
};	
/*Speichern*/	

///RPT("KEY UID",_keyUID);
//RPT("KEY _n",_n);
//RPT(_slot,_turmData);
profileNamespace SVAR [_slot,_turmData];
SYSLOG(SKYID,"Bohrturm Save","Bohrturm Daten gespeichet",_slot,str _turmData);
		
			
			