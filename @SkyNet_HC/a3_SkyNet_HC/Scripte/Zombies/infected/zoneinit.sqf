_myzone= _this;
//_myzone spawn fncPop;
_playerInZone=true;
missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
_targetList=[];
missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
_deleteInfected=false;
missionNamespace setVariable [format ["%1_deleteInfected", _myzone], _deleteInfected];
//infected = createGroup east;
// Zone player list , check toutes les 5s///////////////////////////////////////////////////////////////
while {_playerInZone} do
{
	_targetList= [];
	{
		  //if (isPlayer _x && (alive _x) ) then { _playerList = _playerList + [_x] };		//List BLUFOR players only
		if ((alive _x ) && isPlayer _x && (_x != zomAirpoint)) then //List BLUFOR players & IA
		{
			_targetList = _targetList + [_x];
		};
		
	
	} forEach list _myzone;
	_targetCount= count _targetList;
	if (_targetCount isEqualTo 0 && (isNull ZomBox) )then
	{
		_playerInZone=false;
		missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
		ZomTarg = [];
		uisleep 20;
		Z_zoneakt = false;
	}else{
		_playerInZone=true;
		missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
		missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
		ZomTarg = _targetList;
		uisleep 20;
	};
	uisleep 1;
};
