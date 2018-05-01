/*
	File: fn_ligaDesAdAc.sqf
	Author: Hirschi Liga-Life
*/	
private ["_mode"];
_mode = _this select 0;

switch (_mode) do {
	
	case 0: {
		life_dest = _this select 1;

		if(isNull life_dest) exitWith {life_dest = ObjNull; publicVariableServer "life_dest";};

		life_action_destDeploy = player addAction["<t color='#00FF00'>Destille aufstellen</t>",{if(!isNull life_dest) then {detach life_dest; life_dest = ObjNull;  publicVariableServer "life_dest";}; player removeAction life_action_destDeploy; life_action_destDeploy = nil;},"",0,false,false,"",'!isNull life_dest'];
		waitUntil {isNull life_dest};
		if(!isNil "life_action_destDeploy") then {player removeAction life_action_destDeploy;};
	};
	
	case 1: { hint "Die Destille kann nicht arbeiten waehrend du reinschaust !!";	};
	case 2: { hint "Du brauchst 2 Baumstaemme um das Teil anzuheizen und 1 um es weiter im Betrieb zu halte...";	};
	case 3: { hint "Deine Destille hat kein Brennholz mehr...";};
	case 4: { hint "Deine Destille hat keine Maische mehr und verbraucht Sinnlos Brennholz..";};
	case 5: { hint "Der Methyl Eimer ist voll !!!";};
	case 6: { hint "Das Schnapps-Fass ist voll !!!";	};
	case 7: { hint "Irgendwas fehlt Dir um die Maische herzustellen ...";};

};


