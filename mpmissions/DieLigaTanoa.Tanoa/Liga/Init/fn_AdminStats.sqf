#include "..\..\Liga_script_macros.hpp"
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
║	File: fn_AdminStats.sqf
║	Author: Hirschi Liga-Life.de
╚══════════════════════════════════════════════════╝	
*/	

	ad_debugRPT = false;			//Debug ausgabe in  RPT
	ad_debugHint = false;			//Debug ausgabe als Hint
	ad_debugNPC = false;		
	ad_spwn = false;
	ad_DevSpawn = false;			//Developer Spawn + Config
  
  if(__GETC__(life_adminlevel) isEqualTo 0)exitWith{};
  if(__GETC__(life_adminlevel) isEqualTo 1)exitWith{	 
	ad_debugRPT = false;
	ad_debugHint = false;
	ad_debugNPC = false;	

 };
 
 
 if(__GETC__(life_adminlevel) isEqualTo 2)exitWith{	 
	ad_debugRPT = false;
	ad_debugHint = false;
	ad_debugNPC = false;	

 };
 
  if(__GETC__(life_adminlevel) isEqualTo 3)exitWith{	 
	ad_debugRPT = false;
	ad_debugHint = false;
	ad_debugNPC = false;
	ad_spwn = false;
 };

 if(__GETC__(life_adminlevel) isEqualTo 4)exitWith{	 
	ad_debugRPT = true;
	ad_debugHint = true;
	ad_debugNPC = true;

	ad_spwn = true;
 };
 if(__GETC__(life_adminlevel) isEqualTo 5)exitWith{	 
	ad_debugRPT = false;
	ad_debugHint = false;
	ad_debugNPC = true;
	
	ad_spwn = true;
	ad_DevSpawn = false;
//	life_maxWeight = 5544; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
//	life_maxWeightT = 5544; //Static variable representing the players max carrying weight on start.
 };
 
  if(__GETC__(life_adminlevel) isEqualTo 6)exitWith{	 
	ad_debugRPT = true;
	ad_debugHint = true;
	ad_debugNPC = true;	
	ad_spwn = true;
	ad_DevSpawn = false;
//	life_maxWeight = 5544; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
//	life_maxWeightT = 5544; //Static variable representing the players max carrying weight on start.
 };