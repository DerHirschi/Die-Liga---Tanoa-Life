/*
	Author: Benargee
	Quelle: Wiki Example
	Edit  : Hirschi - Die Liga 

*/


_hour = floor daytime;
_minute = floor ((daytime - _hour) * 60);
if(_minute < 10) then {_minute = format["0%1",_minute];};
if(_hour   < 10) then {_hour   = format["0%1",_hour  ];};
_time24 = text format ["%1:%2",_hour,_minute];
_time24;

