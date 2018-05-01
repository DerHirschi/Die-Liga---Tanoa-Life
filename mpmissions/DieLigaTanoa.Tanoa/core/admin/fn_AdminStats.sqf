#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_AdminStats.sqf
	Author: Hirschi Liga-Life	
*/	

ad_debugRPT = false;			//Debug ausgabe in  RPT
ad_debugHint = false;			//Debug ausgabe als Hint
  
  if(__GETC__(life_adminlevel) == 1)exitWith{	 
	ad_debugRPT = false;
	ad_debugHint = false;
 };
 
 
 if(__GETC__(life_adminlevel) == 2)exitWith{	 
	ad_debugRPT = false;
	ad_debugHint = false;
 };


 if(__GETC__(life_adminlevel) == 3)exitWith{	 
	ad_debugRPT = true;
	ad_debugHint = true;
 };