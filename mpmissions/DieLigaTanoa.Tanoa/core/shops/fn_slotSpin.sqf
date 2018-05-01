/*
	File: fn_slotspin.sqf
	Author: Jacob "PapaBear" Tyler
	Description: Takes bet, spins slots, determines if win, pays

*/
private["_slot","_slot1","_slot2","_slot3","_winnings","_slotcash","_betamt","_display","_jackpot"];
_betamt = [_this,0,1,[0]] call BIS_fnc_param;
if(life_cash < _betamt) exitWith {hint format["Du hast nicht genug geld dabei! (%1 $)",_betamt];};
life_cash = (life_cash - _betamt);

disableSerialization;
_display = findDisplay 5780;

_slotPic1 = _display displayCtrl 5771;
_slotPic2 = _display displayCtrl 5772;
_slotPic3 = _display displayCtrl 5773;
_winningsText = _display displayCtrl 5775;
_bet1 = _display displayCtrl 5778;
_bet2 = _display displayCtrl 5779;
_bet3 = _display displayCtrl 5781;
_bet4 = _display displayCtrl 5782;

_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;

life_action_inUse = true;

// ROTATE SIMULATION ;)
for "_i" from 0 to 10 do
{
_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot1 = 0; _slotPic1 ctrlSetText "slots\slot_zero.jpg";};
if (_number == 1) then {_slot1 = 100; _slotPic1 ctrlSetText "slots\slot_one.jpg";};
if (_number == 2) then {_slot1 = 200; _slotPic1 ctrlSetText "slots\slot_two.jpg";};
if (_number == 3) then {_slot1 = 300; _slotPic1 ctrlSetText "slots\slot_three.jpg";};
if (_number == 4) then {_slot1 = 400; _slotPic1 ctrlSetText "slots\slot_four.jpg";};
if (_number == 5) then {_slot1 = 500; _slotPic1 ctrlSetText "slots\slot_five.jpg";};
if (_number == 6) then {_slot1 = 600; _slotPic1 ctrlSetText "slots\slot_six.jpg";};
if (_number == 7) then {_slot1 = 700; _slotPic1 ctrlSetText "slots\slot_seven.jpg";};
sleep 0.1;

_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot2 = 0; _slotPic2 ctrlSetText "slots\slot_zero.jpg";};
if (_number == 1) then {_slot2 = 10; _slotPic2 ctrlSetText "slots\slot_one.jpg";};
if (_number == 2) then {_slot2 = 20; _slotPic2 ctrlSetText "slots\slot_two.jpg";};
if (_number == 3) then {_slot2 = 30; _slotPic2 ctrlSetText "slots\slot_three.jpg";};
if (_number == 4) then {_slot2 = 40; _slotPic2 ctrlSetText "slots\slot_four.jpg";};
if (_number == 5) then {_slot2 = 50; _slotPic2 ctrlSetText "slots\slot_five.jpg";};
if (_number == 6) then {_slot2 = 60; _slotPic2 ctrlSetText "slots\slot_six.jpg";};
if (_number == 7) then {_slot2 = 70; _slotPic2 ctrlSetText "slots\slot_seven.jpg";};	
sleep 0.1;

_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot3 = 0; _slotPic3 ctrlSetText "slots\slot_zero.jpg";};
if (_number == 1) then {_slot3 = 1; _slotPic3 ctrlSetText "slots\slot_one.jpg"; };
if (_number == 2) then {_slot3 = 2; _slotPic3 ctrlSetText "slots\slot_two.jpg"; };
if (_number == 3) then {_slot3 = 3; _slotPic3 ctrlSetText "slots\slot_three.jpg"; };
if (_number == 4) then {_slot3 = 4; _slotPic3 ctrlSetText "slots\slot_four.jpg"; ;};
if (_number == 5) then {_slot3 = 5; _slotPic3 ctrlSetText "slots\slot_five.jpg"; };
if (_number == 6) then {_slot3 = 6; _slotPic3 ctrlSetText "slots\slot_six.jpg"; };
if (_number == 7) then {_slot3 = 7; _slotPic3 ctrlSetText "slots\slot_seven.jpg"; };
sleep 0.1;
};



if((_slot1 == 0) && (_slot2 == 0) && (_slot3 == 0)) then { _slot = 999; } else 
{
_slot = _slot1 + _slot2 + _slot3;
};


//cases for wins
switch (_slot) do
{

	case 999: 	{_winnings = 2; _jackpot = 0;}; 			// Einsatz x2 | 3x Kiwi | 50k = 100k
	case 111:	{_winnings = 6; _jackpot = 0;}; 			// Einsatz x6 | 3x Kirsche | 50k = 300k
	case 222: 	{_winnings = 3; _jackpot = 0;}; 			// Einsatz x3 | 3x Pflaume | 50k = 150k 
	case 333: 	{_winnings = 0; _jackpot = 1500000;}; 		// Jackpot | 3x 3 Siebener 
	case 444: 	{_winnings = 5; _jackpot = 0;}; 			// Einsatz x5 | 3x Zitrone | 50k = 250k
	case 555: 	{_winnings = 3; _jackpot = 0;}; 			// Einsatz x3 | 3x Orange | 50k = 150k
	case 666: 	{_winnings = 2; _jackpot = 0;}; 			// Einsatz x2 | 3x Äpfel | 50k = 100k
	case 777: 	{_winnings = 0; _jackpot = 1000000;}; 		// Jackpot  | 3x Sieben
	case 110:	{_winnings = 4; _jackpot = 0;}; 			// Einsatz x4 | 3x  | 50k = 250k
	case 112:	{_winnings = 4; _jackpot = 0;}; 			// Einsatz x4 | 3x  | 50k = 250k
	case 113:	{_winnings = 4; _jackpot = 0;}; 			// Einsatz x4 | 3x  | 50k = 250k
	case 114:	{_winnings = 4; _jackpot = 0;}; 			// Einsatz x4 | 3x  | 50k = 250k
	case 115:	{_winnings = 4; _jackpot = 0;}; 			// Einsatz x4 | 3x  | 50k = 250k
	case 116:	{_winnings = 4; _jackpot = 0;}; 			// Einsatz x4 | 3x  | 50k = 250k
	case 117:	{_winnings = 4; _jackpot = 0;}; 			// Einsatz x4 | 3x  | 50k = 250k
	
	case 220:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 221:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 223:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 224:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 225:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 226:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 227:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 330:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 331:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 332:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 334:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 335:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 336:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 337:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 440:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 441:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 442:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 443:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 445:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 446:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 447:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 550:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 551:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 552:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 553:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 554:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 556:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 557:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 660:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 661:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 662:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 663:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 664:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 665:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 667:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 770:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 771:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 772:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 773:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 774:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 775:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus
	case 776:	{_winnings = 1; _jackpot = 0;}; 			// Einsatz raus	
	default {_winnings = 0; _jackpot = 0;}
};



if((_jackpot == 0) && (_winnings !=0)) then {     
	_slotcash = _winnings * _betamt;
};
if((_jackpot !=0) && (_winnings == 0)) then {     
	_slotcash = _jackpot;
};
if((_jackpot == 0) && (_winnings == 0)) then {     
	_slotcash = 0;
};

life_cash = life_cash + _slotcash;
_winningsText ctrlSetText format["%1",_slotcash];

_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
life_action_inUse = false;