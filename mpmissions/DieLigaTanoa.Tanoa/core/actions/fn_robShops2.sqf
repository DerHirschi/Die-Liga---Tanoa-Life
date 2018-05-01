#include "..\..\Liga_script_macros.hpp"
/*         
		file: fn_robShops.sqf
		Author: MrKraken
		Edit: Hirschi - Die Liga	
		Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
		Description:
		Executes the rob shob action!
		Idea developed by PEpwnzya v2.0
            
*/ 
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_marknam"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if !(alive _robber) exitWith {};
_marknam = format ["RaubMark_%1",round (random(99999))];
_rip = true;
_kassa = 3000 + round(random 49000); //setting the money in the registry, anywhere from 3000 to 15000. 
[_shop,_robber,_action,-1] remoteExec ["TON_fnc_shopState",RSERV];
_chance = random(100); //calling a random number between 0-100. 
if(_chance >= 100) then { hint "Die Polizei wurde heimlich informiert !!"; [0,format["ALARM! - Tankstelle: %1 wird ausgeraubt!", _shop]] remoteExecCall ["life_fnc_broadcast",west]; }; //We set a 15% chance that the silent alarm is being triggered, wich sends a 911-message to the police. 

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Es wird ausgeraubt , bleib in der nähe (5m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{
    while{true} do
    {
        sleep  1.2;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["Es wird ausgeraubt , bleib in der nahe (5m) (%1%2)...",round(_cP * 100),"%"];
		
		_Pos = position player; // by ehno: get player pos
				                _marker = createMarker [_marknam, _Pos]; //by ehno: Place a Maker on the map
				                _marknam setMarkerColor "ColorRed";
				                _marknam setMarkerText "!Achtung! Ueberfall !Achtung!";
				                _marknam setMarkerType "mil_warning";			
								
        if(_cP >= 1) exitWith {  };
    if(_robber distance _shop > 5) exitWith { deleteMarker _marknam; hint "Du warst zu weit weg! - Hier kannst du nicht mehr ausrauben."; 5 cutText ["","PLAIN"]; _rip = false;  };
        if!(alive _robber) exitWith { deleteMarker _marknam; _rip = false;  };
        
    }; // the loop continues til the progressbar is full, distance is exceeded or robber dies. 
    if!(alive _robber) exitWith { _rip = false; deleteMarker _marknam; };

    if(_robber distance _shop > 5) exitWith { deleteMarker _marknam; hint "Du warst zu weit weg! - Hier kannst du nicht mehr ausrauben."; 5 cutText ["","PLAIN"]; _rip = false; };
    5 cutText ["","PLAIN"];
    titleText[format["Du hast %1 geklaut, nichts wie weg hier , die Cops sind auf dem Weg!",[_kassa] call life_fnc_numberText],"PLAIN"];
    life_cash = life_cash + _kassa; 
    _rip = false;
    life_use_atm = false;
	

	[0,format["112 - Tankstelle: %2 wurde gerade von %1 ausgeraubt für ein Preis von $%3",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];	
	sleep 180;
    life_use_atm = true; // Robber can not use the ATM at this point.
    if!(alive _robber) exitWith { deleteMarker _marknam; };

	[getPlayerUID _robber,name _robber,"211A"] remoteExecCall ["life_fnc_wantedAdd",RSERV];	
	
	
	deleteMarker _marknam;
};

[_shop,_robber,_action,0] remoteExec ["TON_fnc_shopState",RSERV];