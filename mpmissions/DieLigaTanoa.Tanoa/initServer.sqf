/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
if(!(_this select 0)) exitWith {}; //Not server
/*
//[] execVM "\life_server\init.sqf"; 
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
*/
setTerrainGrid 50;
setViewDistance 500;
setObjectViewDistance [0,0];
enableEnvironment false; 
//[8,true,true,12] execFSM "core\fsm\timeModule.fsm";
[] execVM "Liga\Init\functions.sqf";