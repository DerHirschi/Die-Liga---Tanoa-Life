/*
	Author: Hirschi - Die Liga
*/
private["_tuv"];
_tuv = life_vInact_curTarget getVariable ["tuv",[0,0]];
_tuv = _tuv select 0;
if(life_vInact_curTarget isKindOf "Car") then{
	hint parseText format ["<img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster TUEV Termin in: <t color='#ffffff'>%1 Monaten<br/>",(14 - _tuv)];				
}else{				
	if(life_vInact_curTarget isKindOf "Air")then{
		hint parseText format ["<img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster B-Check in: <t color='#ffffff'>%1 Monaten<br/>",(7 - _tuv)];
	}else{
		hint parseText format ["<img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster TUEV Termin in: <t color='#ffffff'>%1 Monaten<br/>",(7 - _tuv)];
	};						
};
