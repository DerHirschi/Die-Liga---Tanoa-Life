/*
Edited by Hirschi - Die Liga
*/
private ["_distance","_houseList","_t"];
if!(Z_zoneakt)exitWith {};
_mkr = _this;
_probability=10;
_exclusionList=[];
_pos=getpos _mkr;
_mkrY= (triggerArea _mkr) select 0;
_mkrX= (triggerArea _mkr) select 1;

_distance=_mkrX;
if (_mkrY > _mkrX)then
{
	_distance=_mkrY;
};

_houseList= nearestObjects [_pos ,["Land_Hotel_02_F","Land_House_Big_02_F","Land_House_Native_02_F","Land_House_Big_01_F","Land_House_Big_05_F","Land_House_Small_06_F","Land_House_Small_05_F","Land_i_Shed_Ind_F"],_distance];

_houseCount= count _houseList;


while {Z_zoneakt && ((count units infected) < 111)} do {
	{
		if!(Z_zoneakt)exitWith {};
		_house=_x;
		if (!(typeOf _house in _exclusionList))then
		{
			for "_n" from 0 to 3  do {
				if (((count units infected) > 110) || (!Z_zoneakt)) exitWith{};
				_buildingPos=_house buildingpos _n;
				if (str _buildingPos isEqualTo "[0,0,0]") exitwith {};
				_t= true;
				{
					if(_buildingPos distance2D _x < 50)exitWith {_t= false;};	
				}forEach playableUnits;
				if(_t) then {
				
					_object=[_buildingPos, 180, "O_Soldier_F", EAST] call bis_fnc_spawnvehicle;
					[_object,_mkr] spawn infectedinit;
					uisleep 0.2;				
				};
			};
		};	
		uiSleep 0.6;
	}foreach _houseList;
	uisleep 2;
};

