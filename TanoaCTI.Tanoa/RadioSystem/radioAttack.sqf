//Radio station or tower is being attacked

_Attackers = _this select 0;
_Area = _this select 1;
_QARRAY = ((str _Area) splitString "_");
_AreaName = _QARRAY select 0;

//if blue is present then warn players
systemChat (_AreaName + " is being attacked");
//if blue is not present and zombies do not warn players
  //timer for so long area is no longer usable by blue notify players they have lost the point
  //find a way to store time
//if blue is not present and opfor Notify players that they have lost base
  //Area is no longer usable by blue
//if Opfor and Zombies no Blue
  //fight it out!
