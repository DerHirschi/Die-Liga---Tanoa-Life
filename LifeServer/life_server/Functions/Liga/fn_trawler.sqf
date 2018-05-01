//////////////////////////////////////////////////////////////
// BlackOpsMercenaries Special Forces [BOMSF]
// http://www.bomsf.com
// BOMSF Scripts
// cobra@bomsf.com
// Trawler Mgmt System
//
// In the mission editor, Place the trawler, speedboat, and submarine near each other.
// Name each in the editor as below or change to your specifications.
//
// Then in your mission init.sqf place the following line (code):
// [] spawn compile preprocessFileLineNumbers "trawler.sqf"; // -->  (this file or code)
// 
// modify the actions as you desire, experiment to improve
//////////////////////////////////////////////////////////////

/// Trawler Ini
trawler1 attachTo [rib1,[0,9,2.5]]; 
/// Submarine Ini
sub1 attachTo [rib1,[0,-8,2]]; 
/// U Boot
sub_b attachTo [sub_m,[0,-15,-3]]; 
//sub_b setDir 90;

//sub_b addAction ["Board Ship as Driver",{player moveInDriver sub_m;}, [], 3, false, true, ""]; 
//sub_b addAction ["Board Ship as Cargo",{player moveInCargo sub_m;}, [], 3, false, true, ""];
//sub_b addAction ["Board Ship as Cargo",{player moveInGunner sub_m;}, [], 3, false, true, ""];
//trawler1 addAction ["Get In Sub as Driver",{player moveInDriver sub1;}, [], 3, false, true, ""];
//trawler1 addAction ["Get In Sub as Gunner",{player moveInGunner sub1;}, [], 3, false, true, ""];
//trawler1 addAction ["Get In Sub as Cargo",{player moveInCargo sub1;}, [], 3, false, true, ""];
/// Mini U-Boot
//sub_m lockturret [[0,0],true]; //this locks the commander 
//sub_m lockturret [[0],true]; //this locks the gunner  
//sub_m addAction ["Detach Sub",{detach sub1;}, [], 3, false, true, ""]; 
//sub_m addAction ["Attach Sub",{sub1 attachTo [rib1,[0,-8,2]];}, [], 3, false, true, ""];
