#include "\life_server\Liga_Macros.hpp"
/*
	Vorlage: Bryan "Tonic" Boardwine
	Author: Hirschi
	
	Description:
	Blah
	
	preistabelle
	[
		[
			["item",preis],
			["item",preis]
		],
		[
			["item",preis],
			["item",preis]		
		]
	];
	kassen
	[
		0,
		0
	];
*/
private["_house","_uid","_housePos","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR _uid isEqualTo "") exitWith {};

_housePos = getPosATL _house;


_query = format["LadenAddLaden:%1:%2:%3:%4:%5:%6:%7",_uid,_housePos,	
	[	//Extras
		"Liga Laden",	//Name	
		0,				//Marker
		0				//Beleuchtung
	],
	[/*[],[],[],[],[]*/],	//Preistab 3
	[],					//Kassen 4
	[			//upgrade 5
		[		//KASSE / SLOT 1
			[]
		],
		[		//KASSE / SLOT 2
			[]
		],
		[		//KASSE / SLOT 3
			[]
		],
		[		//KASSE / SLOT 4
			[]
		],
		[		//KASSE / SLOT 5
			[]
		]		
	],
	1
];
_queryResult = [_query,2] call DB_fnc_asyncCall;
diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║ Laden wurde gekauft !! DB LOG ";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format["║ Query		: %1",_query];
diag_log format["║ _queryResult	: %1",_queryResult];
diag_log "╚══════════════════════════════════════════════════╝";


_house SVAR["laden_id",(_queryResult select 0),true];
