if(!hasInterface && !isDedicated)then{
	_me=(_this select 0)select 0;
	_myzone=_this select 1;
	infectedCount = infectedCount + 1;
	_me disableAI "FSM";
	_me disableAI "AUTOTARGET";
	_me disableAI "TARGET";
	_me setBehaviour "COMBAT";
	_me enableFatigue false;
	_me addRating -99999999;
	_me setVariable ["BIS_noCoreConversations", true];
	[_me] join infected;
	infected setCombatMode "COMBAT";
	infected setSpeedMode "FULL";
	_initialPos=getPos _me;
	[_me] spawn fncStuff;
	_onAttack=false;
	missionNamespace setVariable [format ["%1_onAttack", _me],_onAttack];
	_me addEventHandler ["hit",{
		[_this select 0, "hurt"] spawn fncNextSound;
		(_this select 0) lookAt (_this select 1);
	}];
	
	_target=[false];
	while{alive _me}do
	{	
		_step=0;
		_playerInZone=missionNamespace getVariable [format ["%1_playerInZone", _myzone],[]];
		_static=
		{
			_step=2;
			unitReady _me;
		};
		_deleteInfected= missionNamespace getVariable [format ["%1_deleteInfected", _myzone],[]];	
		if(_playerInZone && {call _static} ) then
		{
			//[_me,_initialPos] spawn fncRoaming;
			_target=[_me,_myzone] call fncNearestTarget;
			sleep (1+(random 1));
			
		}else{
			if(_step==2)then
			{
				_target=[_me,_myzone] call fncNearestTarget;
				sleep (1+(random 1));
			};
			if(!_playerInZone)then
			{
				_me removeAllEventHandlers "hit";
				deleteVehicle _me;
			};
		};
		if (_target select 0)then
		{
			_onAttack=true;
			missionNamespace setVariable [format ["%1_onAttack", _me],_onAttack];
			[_me,_target select 1,_myzone] call fncAttack;
		};
		
	};
	if(!alive _me)then
	{
		infectedCount = infectedCount - 1;
		_onAttack=false;
		_notOnAttack=true;
		_me removeAllEventHandlers "hit";
		sleep 18;
		deleteVehicle _me;
	};
};
