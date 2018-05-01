#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = SEL(_this,3);

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;


if(SEL(_license,0) in ["lci_uhrspawn","lci_civspawn"]) then {		
	
	_license spawn {
		closeDialog 0;
		_action = [									
			'Deine Entscheidung ist permanent...',
			'Bist du dir sicher ?',
			'JA',
			'NEIN'
			] call BIS_fnc_guiMessage;
			
			
		if(_action) then {			
			sleep 0.2;
			
			if(EQUAL(SEL(_this,0),"lci_uhrspawn") ) then { // UHR
				
				"Bitte logge Dich um ." hintC
				[
					"Du hast dich dafür entschieden, als Ureinwohner zu spielen.",
					"Bitte gehe zurück in die Lobby und wechsel die Fraktion (Widerstand). ",
					"",
					"Weitere Infos in unserem Forum unter",
					"http://liga-life.de/Liga-Forum/"
				];
				
				[]spawn {
					uiSleep 60;
					hint "Du wirst in einer Minute automatisch in die Lobby befoerdert ... ";
					uiSleep 60;
					[] call SOCK_fnc_updateRequest; 
					["NotUhr",false,true] call BIS_fnc_endMission;
					sleep 35;					
				};
				
			}else{	//CIV
				"Glückwunsch Keule," hintC
				[
					"aus dir ist grade ein Mann geworden ... "
					
				];
			};
			missionNamespace setVariable[SEL(_this,0),true];
			[] call SOCK_fnc_updateRequest; 
		};
	};
	
}else {
	if(life_cash < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

	life_cash = life_cash - _price;
	titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
	missionNamespace setVariable[(_license select 0),true];
};