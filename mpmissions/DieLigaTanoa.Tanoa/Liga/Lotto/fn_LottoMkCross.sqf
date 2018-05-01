/*
	Author: Hirschi
*/

private['_dialog','_mstatus'];
disableSerialization;
_i 			= _this; 
_dialog 	= findDisplay 88888;
_mstatus 	= _dialog displayCtrl ( 89100 + _i );
if!( _i in Liga_LottoArr ) then {
	if!(count Liga_LottoArr >= 5) then {
		_mstatus ctrlSetStructuredText parseText "<img size='1.4' image='textures\lotto\kreu.paa'/>";
		Liga_LottoArr pushBack _i ;
		Liga_LottoArr sort true;
	}else{
		hint "Du hast schon 5 Zahlen gewaehlt !";
	};
}else{
	_mstatus ctrlSetStructuredText parseText "";
	Liga_LottoArr deleteAt (Liga_LottoArr find _i) ;				
};

for "_i" from 0 to 4 do {
	_dialog displayCtrl (88900 + _i) ctrlSetText "";
};

{
	_dialog displayCtrl (88900 + _forEachIndex) ctrlSetText str _x;
}forEach Liga_LottoArr;