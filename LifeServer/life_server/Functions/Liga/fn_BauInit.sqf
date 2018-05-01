	_query = format["BaustGET"];
	
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	_row = call compile format["%1",_queryResult]; 	
	
	Liga_Baust_bes = _row;
	publicVariable "Liga_Baust_bes";