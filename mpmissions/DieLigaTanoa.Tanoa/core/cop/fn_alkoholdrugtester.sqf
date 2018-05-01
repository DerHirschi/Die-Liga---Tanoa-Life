/*
	file:fn_alkoholdrugtester 

	author:[midgetgrimm] 
	Edit: Hirschi - Die Liga
	edited by nic_noc for testing drugusing on civs
*/

_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _cop) exitWith {};

//Den Wert > 0.4 kann man natuerlich aendern
if(life_drink > 0.4) then 
	{
		[1,format["Alkoholtest %1 \n\n Promille: %2 \n\n Nicht im legalen Bereich! ",name player,[life_drink] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_cop];
	} 
	else 
	{
		[1,format["Alkoholtest %1 \n\n Promille: %2 \n\n Im legalen Bereich! ",name player,[life_drink] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_cop];
	
	};
	
	//Beide Tests werden nacheinander (5 Sekunden unterschied) angezeigt - man testet also quasi beides in einem
uiSleep 7;

//Wenn > 0 dann hat der Spieler irgendwas genommen - also ist es dann ein positives Ergebnis
if(life_drug > 0) then 
	{
		[1,format["Drogentest %1 \n\n Ergebnis: Positiv \n\n Der Spieler steht unter Drogeneinfluss! ",name player]] remoteExecCall ["life_fnc_broadcast",_cop];
	} 
	else 
	{
		[1,format["Drogentest %1 \n\n Ergebnis: Negativ \n\n Der Spieler ist clean! ",name player]] remoteExecCall ["life_fnc_broadcast",_cop];
	}; 