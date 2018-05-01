private "_oldDir";
params["_vehicle"];
while {!isNull _vehicle} do
{
    _oldDir = getDir _vehicle;
    _vehicle setDir (_oldDir + 0.5);
    uiSleep 0.01;
};