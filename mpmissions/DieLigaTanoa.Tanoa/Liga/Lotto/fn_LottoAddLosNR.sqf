/*
	Author: Hirschi
*/

_zahhleArr  = [_this,0,[],[[]]] call BIS_fnc_param;
if((count _zahhleArr) isEqualTo 0) exitWith {};
hint format ['Du hast ein Lotterielos fue 100.000 Dollar erworben .. Deine Zahlen lauten: %1, %2, %3, %4, %5 . Viel Glück.',(_zahhleArr select 0),(_zahhleArr select 1),(_zahhleArr select 2),(_zahhleArr select 3),(_zahhleArr select 4)];

if(life_cash < 100000) then {
	life_atmcash = life_atmcash - 100000;
}else{
	life_cash = life_cash - 100000;
};	