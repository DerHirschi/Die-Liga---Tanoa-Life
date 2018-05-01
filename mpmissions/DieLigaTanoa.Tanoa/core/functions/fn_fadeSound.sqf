/*
	File: fn_fadeSound.sqf
	Auhtor: Michael Francis
	
	Description:
	Fades out sound.
*/
life_fadeSound = !life_fadeSound;

if (life_fadeSound) then 
{
	1 fadeSound 0.08; // Faded to 10%
	titleText ["Du hast dein Gehoerschutz aufgesetzt.", "PLAIN"];
}
else
{
	1 fadeSound 1; // Returned to 100%
	titleText ["Du hast dein Gehoerschutz abgesetzt.", "PLAIN"];
};