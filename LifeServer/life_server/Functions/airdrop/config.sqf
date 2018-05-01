/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright © 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"
*/

airdrop_helicopter_main = "B_T_VTOL_01_vehicle_blue_F";
airdrop_helicopter_scnd = "B_Plane_CAS_01_F";
//airdrop_chance = 100;
airdrop_positions = [[8111.38,22579.8,0.00156784],[7255.38,12048.8,0.00156784],[11264.38,17903.8,0.00156784],[10318.38,7196.8,0.00156784],[20073.38,6738.8,0.00156784],[24813.38,19270.8,0.00156784],[20753.38,13215.8,0.00156784],[11568.38,20800.8,0.00156784],[4573.38,10907.8,0.00156784],[10962.38,11935.8,0.00156784]];
_airdrop_time_interval = [1,3]; //Time given in hours, this is the interval in which the airdrop should take place

// Do not modify the following code

airdrop_time_min = _airdrop_time_interval select 0;
airdrop_time_max = _airdrop_time_interval select 1;
airdrop_time_min = airdrop_time_min*3600;
airdrop_time_max = airdrop_time_max*3600;

if (airdrop_time_min>=airdrop_time_max) exitWith {airdrop_enable=false;};
airdrop_enable=true;
airdrop_goingon=false;