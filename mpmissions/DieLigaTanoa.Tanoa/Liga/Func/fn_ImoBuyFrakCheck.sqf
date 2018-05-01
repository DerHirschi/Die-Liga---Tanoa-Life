#include "..\..\Liga_script_macros.hpp"

/*
	Author Hirschi

*/
private["_ret"];

_house	= param [0,ObjNull,[ObjNull]];
_ret 	= "";

if(isNull _house) exitWith {_ret 	= "Fehler .. Bitte beim Support melden .. "; _ret;};

if (lci_reb) then {	
	if(		(player distance2D (getMarkerPos "reb_haus")) > 2090	) then {
		_ret = "Du gehoerst der Guerilla an und kannst nur Immobilien im Guerilla Gebiet kaufen.";
	};	
}else{
	switch (playerSide) do {
		
		case civilian	: {
			if((player distance2D (getMarkerPos "reb_haus")) < 2090) then {
				_ret = "Du gehoerst nicht der Guerilla an ....";
			};	
			if(((player distance2D (getMarkerPos "civ_haus")) > 6100) && ((player distance2D (getMarkerPos "civ_haus2")) > 2700)) then {
				_ret = "Du kannst keine Immobilien im Stammesgebiet kaufen...";
			};
		};
		case independent: {
			if!((typeOf _house) in ["Land_House_Native_01_F","Land_House_Native_02_F"] ) then { 
				if((player distance2D (getMarkerPos "reb_haus")) < 2090) then {
					_ret = "Du gehoerst nicht der Guerilla an ....";
				};
				if( ((player distance2D (getMarkerPos "civ_haus") < 6100) || (player distance2D (getMarkerPos "civ_haus2") < 2700)) ) then {
					_ret = "Du kannst nur Immobilien im Stammesgebiet kaufen";
				};		
			}; 			
		};
		default {ret = "Du darfst keine Immobilien kaufen, wenn du im Dienst bist...";};
	};	
};

_ret;