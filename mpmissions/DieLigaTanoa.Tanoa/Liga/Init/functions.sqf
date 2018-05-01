life_fnc_sidechat =
compileFinal "
	if(life_sidechat) then {life_sidechat = false;} else {life_sidechat = true;};	
	[player,life_sidechat,side player] remoteExecCall ['TON_fnc_managesc',2];
	[] call life_fnc_settingsMenu;
";


TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";


TON_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from isEqualTo """") exitWith {};
	life_atmcash = life_atmcash + _val;
	hint format[""%1 hat dir $%2 Ueberwiesen."",_from,[_val] call life_fnc_numberText];
	
";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;	
	{	if(_x in _valid) then{}	else{	_return = false;	};	} foreach _array;
	_return;
";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player isEqualTo _unit && (group player) isEqualTo _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""Du wurdest aus der Gang gekickt"";		
	};
";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"" OR isNil ""_vehicle"") exitWith {};
	if(player isEqualTo _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 hat dir den Schluessel fuer %2 gegeben..."",_giver,_name];
		life_vehicles pushBack _vehicle;
		[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ['TON_fnc_keyManagement',2];
		if(typeOf _vehicle isEqualTo 'Land_Research_house_V1_F') then { [_vehicle,getPlayerUID player] remoteExecCall ['LIGA_fnc_updateTurm',HC_id]};
		if(typeOf _vehicle in ['Land_FuelStation_01_pump_F','Land_FuelStation_02_pump_F']) then { [_vehicle,getPlayerUID player] remoteExecCall ['TON_fnc_updateTankTrunk',2];};
	};
";

TON_fnc_clientKeyGesch =
compileFinal "
	private[""_vehicle"",""_unit"",""_uid""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_uid = _this select 2;	
	_giver = _this select 3;	
	if(isNil ""_unit"" OR isNil ""_uid"" OR isNil ""_vehicle"" OR isNil ""_giver"") exitWith {};
	if(player isEqualTo _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 hat dir den Schluessel fuer %2 geschenkt..."",_giver,_name];
		life_vehicles pushBack _vehicle;
		[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ['TON_fnc_keyManagement',2];
		[_vehicle,getPlayerUID player,_uid] remoteExecCall ['TON_fnc_keyDBchange',2];
		
	};
";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player isEqualTo _unit && (group player) isEqualTo _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Du bist der Leader!"";
	};
";

TON_fnc_clientGangLeft =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""Du hast die Gang verlassen."";
	};
";