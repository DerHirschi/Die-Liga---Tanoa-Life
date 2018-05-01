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
	║	Author: Hirschi Liga - Life
	║	File: fn_ligaSetClothText.sqf	
	╚══════════════════════════════════════════════════╝
*/	
private["_backConf","_uniConfi","_ent","_uni","_bak"];
//if (EQUAL(playerSide,civilian)) exitWith {};
if (EQUAL(uniform player,"")) exitWith {};

_uni = uniform player;
_bak = backpack player;
_textBp = backpackContainer player GVAR ["texture",""];
_textUn = uniformContainer  player GVAR ["texture",""];

if(!isClass (missionConfigFile >> CONFIG_KLAMOTTEN >> _uni )) then {
	_uni = "Default"; //Use Default class if it doesn't exist	
};

if(!isClass (missionConfigFile >> CONFIG_KLAMOTTEN >> _bak )) then {	
	_bak = "Default"; //Use Default class if it doesn't exist		
};

switch (playerSide) do {
    case west: {			
		_uniConfi = M_CONFIG(getText,CONFIG_KLAMOTTEN,_uni,"ligatextureLPD");		
	
		(unitBackpack player) setObjectTextureGlobal  [0,_textBp];
		
		if!(EQUAL(_textUn,"")) then {
			player setObjectTextureGlobal  [0,_textUn];
		}else{
			if!(EQUAL(_uniConfi,"")) then {
				player setObjectTextureGlobal [0,_uniConfi];
				uniformContainer player SVAR ["texture",_uniConfi,true];	
			};
		};		
	};	
	/*
	case independent: {	
		_ent = "ligatextureLRK";		
	};	
	*/
    case east: {
		_ent = "ligatextureALAC";		
	};
	/*
	case civilian : {		
		_ent = "ligatextureCIV";
	};
	*/
	default {
		_ent = "ligatextureCIV";
		if(liga_cop_on) then {
			_uniConfi = M_CONFIG(getText,CONFIG_KLAMOTTEN,_uni,"ligatextureLPD");		
	
			(unitBackpack player) setObjectTextureGlobal  [0,_textBp];
		
			if!(EQUAL(_textUn,"")) then {
				player setObjectTextureGlobal  [0,_textUn];
			}else{
				if!(EQUAL(_uniConfi,"")) then {
					player setObjectTextureGlobal [0,_uniConfi];
					uniformContainer player SVAR ["texture",_uniConfi,true];	
				};
			};		
		};	
		if(liga_lrk_on) then {
			_ent = "ligatextureLRK";
		};
	};		
};


if!(EQUAL(playerSide,west) || liga_cop_on) then {
	_backConf = M_CONFIG(getText,CONFIG_KLAMOTTEN,_bak,_ent);
	_uniConfi = M_CONFIG(getText,CONFIG_KLAMOTTEN,_uni,_ent);	
	if!(EQUAL(_textBp,"")) then {
		(unitBackpack player) setObjectTextureGlobal  [0,_textBp];
	}else{
		if!(EQUAL(_backConf,"")) then {
			(unitBackpack player) setObjectTextureGlobal  [0,_backConf];
			backpackContainer player SVAR ["texture",_backConf,true];
		};
	};		
	
	if!(EQUAL(_textUn,"")) then {
		player setObjectTextureGlobal  [0,_textUn];
	}else{
		if!(EQUAL(_uniConfi,"")) then {
			player setObjectTextureGlobal [0,_uniConfi];
			uniformContainer player SVAR ["texture",_uniConfi,true];	
		};
	};		
};