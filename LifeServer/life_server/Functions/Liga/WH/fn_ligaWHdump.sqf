#include "\life_server\Liga_Macros.hpp"
/*
	Author: Hirschi - Die Liga
	Warehouse Dump wenn voll
	
	Artikel Bestand 100 & > - 50 %
	Artikel Bestand > 25 % - 20 %
	TON_fnc_ligaWHdump
	

*/
private["_whArray","_whVar","_max","_flag","_query","_tr"];
if(!isNil "WH_dumpTrig") exitWith {diag_log format["║ WH DUMP Versuch  !!!!!"];};
WH_dumpTrig = true;
_tr 		= false;
_minBest   =  M_CONFIG(getNumber,"Warehouse","WHdump","minBestan");
_maxSUBval =  M_CONFIG(getNumber,"Warehouse","WHdump","maxSUBval");
_minSUBval =  M_CONFIG(getNumber,"Warehouse","WHdump","minSUBval");
{
	_whArray 	= GVAR_MNS [_x,[[]]];
	_whVar		= _x;

	if!(EQUAL(_whArray,[[]])) then {
		
		{			
			_max = M_CONFIG(getArray,"Warehouse",_whVar,SEL(_x,0));		
			if(!isNil "_max") then {
				if!(EQUAL(count _max,0)) then {
		
					_max = SEL(_max,0);

					if( SEL(_x,1) > (_max * (_minBest / 100 ))) then {				
						if(SEL(_x,1) >= (_max * 0.95)) then {	//MAX Wert
							_whArray set [_forEachIndex,[(SEL(_x,0)),(round (_max * (_maxSUBval / 100)))]];
							_tr = true;
						}else{
							_whArray set [_forEachIndex,[(SEL(_x,0)),(round(SEL(_x,1) * (_minSUBval / 100)))]];
							_tr = true;
						};				
					};		
				};
			};	
		}forEach _whArray;
		SVAR_MNS [_whVar,_whArray];
	};	
	if(_tr)then {
		diag_log format["║ WH DUMP Save- %1  gestartet !!!!!",_x];
		diag_log format["║ QUERRY : %1",(GVAR_MNS [_x,[]])];
		_query 			= format["WHset:%1:%2",_x,GVAR_MNS _x];	
		_query 			= [_query,1] call DB_fnc_asyncCall;
	};
}forEach ["liga_wh_1","liga_wh_2"];

if(_tr)then {
	[8,""] remoteExec ["life_fnc_ligaNews",RCLIENT];
}else{
	WH_dumpTrig = nil;
};

