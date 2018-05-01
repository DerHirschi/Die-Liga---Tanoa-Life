/*
Edited by Hirschi - Die Liga
*/
private ["_distance","_houseList"];
if!(Z_zoneakt)exitWith {};
_mkr = Zom_Trig;
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


if (_houseCount >=100)then{_probability=10};
if ((_houseCount >=60)and(_houseCount<100))then{_probability=15};
if ((_houseCount >=30)and(_houseCount<60))then{_probability=25};
if ((_houseCount >10)and(_houseCount<30))then{_probability=40};
if (_houseCount <=10)then{_probability=70};
{
	if!(Z_zoneakt)exitWith {};
	_house=_x;
	if (!(typeOf _house in _exclusionList))then
	{
		for "_n" from 0 to 110 do {
			if (((count units infected) > 100) || !(Z_zoneakt)) exitWith{};
			_buildingPos=_house buildingpos _n;
			if (str _buildingPos isEqualTo "[0,0,0]") exitwith {};

				_object=[_buildingPos, 180, "O_Soldier_F", EAST] call bis_fnc_spawnvehicle;
				[_object,_mkr] spawn infectedinit;	
			sleep 0.2;
		};
	};
	
}foreach _houseList;
if!(Z_zoneakt)exitWith {};
sleep 5;
_atPos = getPos zomAirpoint;
if(Z_zoneakt) then {		{_x doMove _atPos}forEach units infected; 			};
