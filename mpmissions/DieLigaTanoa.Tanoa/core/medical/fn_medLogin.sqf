#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	
	LRK Login
	LIFE_fnc_medLogin
*/
if(lci_reb)exitWith{hint "Du bist Rebell ... ";};
		
if!(liga_lrk_on) then {
	liga_lrk_on = true;
	if(isNil "liga_lrk_group")then {
		liga_lrk_group = createGroup independent; 
		publicVariable "liga_lrk_group";
		[player] join liga_lrk_group;				
	};	
	if(isNull liga_lrk_group) then {
		liga_lrk_group = createGroup independent; 
		publicVariable "liga_lrk_group";
		[player] join liga_lrk_group;
	}else{
		[player] join liga_lrk_group;		
	};		

	switch(__GETC__(life_mediclevel)) do
		{
			case 1: {life_paycheck = 1500;};
			case 2: {life_paycheck = 3000;};
			case 3: {life_paycheck = 6000;};  
			case 4: {life_paycheck = 9000;};
			case 5: {life_paycheck = 12000;};
			case 6: {life_paycheck = 24000;};
			case 7: {life_paycheck = 34000;};
			case 8: {life_paycheck = 37000;};
		};	
	[player,false,civilian] remoteExecCall ["TON_fnc_managesc",RSERV];
	[player,true,west] remoteExecCall ["TON_fnc_managesc",RSERV];
	hint parseText format["<t align='center'><t color='#15C30C'><t size='3'>Angemeldet</t></t></t><br/><br/><t size='1.3'><t align='left'>Du hast dich angemeldet. <br/><br/>Ruhige Schicht ...<br/>"];
}else{
	liga_lrk_on = false;
	hint parseText format["<t align='center'><t color='#E0163B'><t size='3'>Abgemeldet</t></t></t><br/><br/><t size='1.3'><t align='left'>Du hast dich abgemeldet. <br/> <br/>  Schönen Feierabend ...<br/>"];
	
	if(!(EQUAL(count life_gangData,0))) then {
		[player] join (createGroup civilian);
		[] spawn life_fnc_initGang;
	}else{
		[player] join (createGroup civilian);
	};
	life_paycheck = 500;
	[player,true,civilian] remoteExecCall ["TON_fnc_managesc",RSERV];
	[player,false,west] remoteExecCall ["TON_fnc_managesc",RSERV];
	/*ne For Schleife hätts hier auch getan .... */
	{
		[player,false,(_x + 1)] remoteExecCall ["TON_fnc_radio",RSERV];
		liga_bos set [_x,false];
	}forEach [0,1,2,3,4,5,6,7,8];	
};


