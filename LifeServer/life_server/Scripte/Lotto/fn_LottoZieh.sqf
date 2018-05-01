#include "\life_server\Liga_Macros.hpp"
//#include "..\..\..\Liga_Macros.hpp"
/*
	Author: Hirschi - Die Liga
*/

if!(EQUAL(LottoDay,3) ) exitWith {};
LottoDay = 4;
diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║ LOTTO Ziehung !!   ";
diag_log "╠══════════════════════════════════════════════════╣";

private["_zahl","_temp","_count","_queryResult","_LottoScheine"];
_ziehArray 		= [] ;
_LottoScheine	= [] ;
allgewinner		= [] ;
gewinner3		= [] ;
gewinner4		= [] ;
gewinner5		= [] ;


/* Bitte erfen Sie eine Münze ein */
for "_i" from 0 to 4 do {

	while {true} do { 

			_zahl = ( floor random 34) + 1;
			_zahl = _zahl min 35;
			_zahl = _zahl max 1;
			if!( _zahl in _ziehArray ) exitWith {
			_ziehArray pushBack _zahl;
		};
	};
};
/*!! DEBUG !!!*/
/*!! DEBUG !!!*/
/*!! DEBUG !!!*/
/*!! DEBUG !!!*/
//_ziehArray = [1,2,3,4,5];
/*!! DEBUG !!!*/
/*!! DEBUG !!!*/
/*!! DEBUG !!!*/
LottoGlZahl = _ziehArray;
/* Hier ist Ihre persönliche Glücksmelodie */
_queryResult = ["LottoInit",2,true] call DB_fnc_asyncCall;
if(EQUAL(count _queryResult,0)) exitWith {};
diag_log format["║ _queryResult		: %1",_queryResult];
{
	_LottoScheine pushBack [(call compile format["%1",(SEL(_x,0))]),SEL(_x,1),SEL(_x,2)];
} foreach _queryResult;
diag_log format["║ _LottoScheine	: %1",_LottoScheine];
{
	if(!(EQUAL(SEL(_x,2),0))  ) then {
		_count = 0;		
		for "_a" from 0 to 4 do {
			if( (SEL(_ziehArray,_a))  in (SEL(_x,0)) ) then {	_count = _count + 1;	};				
		};		
		if(_count >= 3) then {
			_temp  = missionNamespace GVAR [(format["gewinner%1",_count]),  []  ];
			_temp pushBack SEL(_x,1);
			missionNamespace SVAR [(format["gewinner%1",_count]),  _temp  ];
			allgewinner pushBack SEL(_x,1);
		};		
	};
}forEach _LottoScheine;





diag_log format["║ _ziehArray	: %1",_ziehArray];
diag_log format["║ gewinner3	: %1",gewinner3];
diag_log format["║ gewinner4	: %1",gewinner4];
diag_log format["║ gewinner5	: %1",gewinner5];
diag_log format["║ allgewinner	: %1",allgewinner];
diag_log "╠══════════════════════════════════════════════════╣";
_LottoScheine call TON_fnc_LottoCalPot;

diag_log "║ - Count Lottoscheine  ";
["countLottoSchein",1] spawn DB_fnc_asyncCall;
diag_log "║ - Call Liganews  ";
[9,_ziehArray] remoteExec ["life_fnc_ligaNews",RCLIENT];
diag_log "║ - Call Winners  ";
[]call TON_fnc_callLottoWinner;

diag_log "╚══════════════════════════════════════════════════╝";