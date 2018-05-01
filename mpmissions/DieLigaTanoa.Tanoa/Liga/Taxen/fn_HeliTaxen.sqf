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
	║ File: fn_turmPreProcess.sqf
	║ Author: Hirschi - Die Liga
	╚══════════════════════════════════════════════════╝
*/
if(isServer || !hasInterface) exitWith {};

_fnc_addAction = {
	_this addAction["<t color='#FF4000'>Georgetown</t>",  { 
		if!(vehicle player isEqualTo (_this select 0) ) exitWith {hint "Du musst schon einsteigen Junge ...";};
		[(_this select 0),5]  remoteExec ["LIGACL_fnc_HeliTaxen1",(_this select 0) ];
	}];		
	_this addAction["<t color='#0040FF'>Aeroport de Tanoa</t>",  { 
		if!(vehicle player isEqualTo (_this select 0) ) exitWith {hint "Du musst schon einsteigen Junge ...";};
		[(_this select 0),0]  remoteExec ["LIGACL_fnc_HeliTaxen1",(_this select 0) ];
	}];	
	_this addAction["<t color='#FF0000'>St George Airstip</t>",  { 
		if!(vehicle player isEqualTo (_this select 0) ) exitWith {hint "Du musst schon einsteigen Junge ...";};
		[(_this select 0),1]  remoteExec ["LIGACL_fnc_HeliTaxen1",(_this select 0) ];
	}]; 	
	_this addAction["<t color='#74DF00'>Bala Airstip</t>",  { 
		if!(vehicle player isEqualTo (_this select 0) ) exitWith {hint "Du musst schon einsteigen Junge ...";};
		[(_this select 0),2]  remoteExec ["LIGACL_fnc_HeliTaxen1",(_this select 0) ];
	}]; 
	_this addAction["<t color='#FACC2E'>Tuvanaka Airbase</t>",  { 
		if!(vehicle player isEqualTo (_this select 0) ) exitWith {hint "Du musst schon einsteigen Junge ...";};
		[(_this select 0),3]  remoteExec ["LIGACL_fnc_HeliTaxen1",(_this select 0) ];
	},"",0,false,false,"",'lci_reb']; 	
	_this addAction["<t color='#CC2EFA'>La Rochelle Aerodrom</t>",  { 
		if!(vehicle player isEqualTo (_this select 0) ) exitWith {hint "Du musst schon einsteigen Junge ...";};
		[(_this select 0),4]  remoteExec ["LIGACL_fnc_HeliTaxen1",(_this select 0) ];
	}]; 	
};

_this spawn _fnc_addAction;