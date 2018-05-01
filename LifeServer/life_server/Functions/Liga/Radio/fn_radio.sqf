#define RADIOSWITCH(chan) if(_bool) then \
		{\
			chan radioChannelAdd [_unit];\
		}\
			else\
		{\
			chan radioChannelRemove [_unit]; \
		}
	
/*
╔══════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠══════════════════════════════════════════════════╝
║ File: fn_radio.sqf
║ Author: Hirschi - Die Liga
║ Vorlage: Bryan "Tonic" Boardwine
║
║ Description:
║ Funk System 
╚══════════════════════════════════════════════════╝	
*/
private["_unit","_bool","_chan"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;
_chan = [_this,2,0,[0]] call BIS_fnc_param;

if(isNull _unit) exitWith {};


	/*			
		if(_bool) then
		{
			liga_radio_not radioChannelAdd [_unit];
		}
			else
		{
			liga_radio_not radioChannelRemove [_unit];
		};
	*/
	
switch (_chan) do 
	{
		case 0:{};											//Fehlererkennung Default wert von BIS_fnc_param
				
		case 1:{ RADIOSWITCH(liga_radio_bos1);};			//BOS Kanal 1
		case 2:{ RADIOSWITCH(liga_radio_bos2);};			//BOS Kanal 2
		case 3:{ RADIOSWITCH(liga_radio_bos3);};			//BOS Kanal 3
		case 4:{ RADIOSWITCH(liga_radio_bos4);};			//BOS Kanal 4
		case 5:{ RADIOSWITCH(liga_radio_bos5);};			//BOS Kanal 5
		case 6:{ RADIOSWITCH(liga_radio_bos6);};			//BOS Kanal 6
		case 7:{ RADIOSWITCH(liga_radio_fs);};				//Flugsicherung
			
		case 8:{ RADIOSWITCH(liga_radio_not);};				//Notruf Channel	
			
		case 9:{ RADIOSWITCH(life_radio_west);};			//BOS 4 Meter
			
		default {};											//Fehlererkennung
	};	