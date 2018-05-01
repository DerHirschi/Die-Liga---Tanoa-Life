/*
File: welcome.sqf
Author: ZedBuster
Link: opendayz.net/threads/dayz-welcome-message-credits-style.13071/
Description:
Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 5; //Zeit wie lange ein Text angezeigt wird
sleep 0.5; //Zeit bis die Willkommensnachricht erscheint (in Sekunden)

_role1 = "Willkommen"; //In Gelb
_role1names = ["auf dem Liga-Life Server"]; //In Weiﬂ
_role2 = "Serverleitung:";
_role2names = ["Baskid, Hirschi, Zoran"]; 

_role3 = "Mapping:";
_role3names = ["Gladi"];

_role4 = "Scripting:";
_role4names = ["Hirschi und Zoran"];
_role5 = "Grafik und Design:";
_role5names = ["Baskid und John Manny"];

_role6 = "Unser Forum:";
_role6names = ["http://Liga-Life.de/Liga-Forum/"];
_role7 = "Unser TeamSpeak Server:";
_role7names = ["TS3.Liga-Life.de"];
_role8 = "Server Restarts:";
_role8names = ["2, 10, 18 Uhr"];
_role9 = "Wir wuenschen euch viel Spass";
_role9names = ["Bitte achtet auf Fair Play !!!"];
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.80' color='#097A1E' align='center'>%1<br /></t>", _memberFunction]; //Changes colours
_finalText = _finalText + "<t size='1.10' color='#FFFFFF' align='center'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 1.3,0.70], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.4,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
//[_role8, _role8names],
[_role9, _role9names]
];