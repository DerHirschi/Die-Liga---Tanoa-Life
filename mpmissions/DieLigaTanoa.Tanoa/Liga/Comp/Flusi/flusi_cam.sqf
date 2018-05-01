/*
	Author: Bryan "Tonic" Boardwine
	Edit Hirschi
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/

_laptop = _this select 0;
_mode = _this select 1;
//hint format ["%1",_laptop,_mode];
if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};


switch (_mode) do {
	case "vor_1": {
		
		if(isNil "liga_flusi_scam1") then {
			liga_flusi_scam1 = "camera" camCreate [0,0,0];
			liga_flusi_scam1 camSetFov 0.5;
			liga_flusi_scam1 camCommit 0;
			"rendertarget0" setPiPEffect [0];
			liga_flusi_scam1 cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
			_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
		};
		liga_flusi_scam1 camSetPos [14595.5,16749.6,5];
		liga_flusi_scam1 camSetTarget [14640.9,16735.9,0];
		liga_flusi_scam1 camCommit 0;
	};
	
	case "vor_2": {
		
		if(isNil "liga_flusi_scam2") then {
			liga_flusi_scam2 = "camera" camCreate [0,0,0];
			liga_flusi_scam2 camSetFov 0.5;
			liga_flusi_scam2 camCommit 0;
			"rendertarget2" setPiPEffect [0];
			liga_flusi_scam2 cameraEffect ["INTERNAL", "BACK", "rendertarget2"];
			_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget2,1.0)"];
		};
		liga_flusi_scam2 camSetPos [14679.1,16775.2,5];
		liga_flusi_scam2 camSetTarget [14758.5,16766.4,0];
		liga_flusi_scam2 camCommit 0;
	};	
	
	case "vor_3": {
		
		if(isNil "liga_flusi_scam3") then {
			liga_flusi_scam3 = "camera" camCreate [0,0,0];
			liga_flusi_scam3 camSetFov 0.5;
			liga_flusi_scam3 camCommit 0;
			"rendertarget3" setPiPEffect [0];
			liga_flusi_scam3 cameraEffect ["INTERNAL", "BACK", "rendertarget3"];
			_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget3,1.0)"];
		};
		liga_flusi_scam3 camSetPos [14768.8,16864.9,5];
		liga_flusi_scam3 camSetTarget [14813.8,16821.7,0];
		liga_flusi_scam3 camCommit 0;
	};	
	
	
	
	case "off" :{
		if!(isNil "liga_flusi_scam1")then { liga_flusi_scam1 cameraEffect ["terminate", "back"];camDestroy liga_flusi_scam1;_laptop setObjectTexture [0,""];liga_flusi_scam1 = nil;};
		if!(isNil "liga_flusi_scam2")then { liga_flusi_scam2 cameraEffect ["terminate", "back"];camDestroy liga_flusi_scam2;_laptop setObjectTexture [0,""];liga_flusi_scam2 = nil;};
		if!(isNil "liga_flusi_scam3")then { liga_flusi_scam3 cameraEffect ["terminate", "back"];camDestroy liga_flusi_scam3;_laptop setObjectTexture [0,""];liga_flusi_scam3 = nil;};
	
	};
};
