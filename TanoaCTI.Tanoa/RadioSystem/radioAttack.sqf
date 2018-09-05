//Radio station or tower is being attacked

_Attackers = _this select 0;
_Area = _this select 1;
_list = _this select 2;
_unitsInTrigger = [];
_QARRAY = ((str _Area) splitString "_");
_AreaName = _QARRAY select 0;
_bluePresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Blue"));
_redPresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Red"));
_greenPresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Green"));
_Warned = false;

while {_greenPresent || _redPresent} do {
  sleep 1.5;
  _bluePresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Blue"));
  _redPresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Red"));
  _greenPresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Green"));

  if (_bluePresent && _redPresent || _greenPresent) then //if _bluePresent then warn players and create a task to defend point
  {
    if(!_Warned)then
    {
      systemChat (_AreaName + " is being attacked! Send reinforcements!");
      _Warned = true;
    };
  };

  if (!_bluePresent && !_redPresent && _greenPresent) then //if not blue and zombies then no warning. after time loose point and notify point lost
  {
    systemChat ("Zombies in point " + _AreaName);
    null = [_AreaName]execVM "RadioSystem\looseRadio.sqf";
    exit;
    // no warning
    //timer for so long area is no longer usable by blue notify players they have lost the point
    //find a way to store time
  };

  if(!_bluePresent && !_greenPresent && _redPresent) then
  {
    //Area is no longer usable by blue
    //Notify Blue that point was lost
    systemChat (_AreaName + " has been lost!");
    null = [_AreaName]execVM "RadioSystem\looseRadio.sqf";
    exit;
  };
};
//if Opfor and Zombies no Blue
  //fight it out!

  //create point lost function
