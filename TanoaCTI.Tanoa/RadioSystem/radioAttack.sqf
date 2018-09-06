//Radio station or tower is being attacked
sleep 1.5;
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
_zombieTimerStarted = false;
_RadioTower = 0;
_tsDefend = "";
{
    if (_x select 2 == _AreaName) exitWith {};
      _RadioTower = _RadioTower + 1;
} forEach RadioCoverage;

while {_greenPresent || _redPresent} do {
  sleep 1.5;
  //systemChat "loop";
  _bluePresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Blue"));
  _redPresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Red"));
  _greenPresent = triggerActivated (missionNamespace getVariable (_AreaName + "_Trigger_Green"));
  _TowerHeld = ((RadioCoverage select (parseNumber (str _RadioTower))) select 1);
  if(!_TowerHeld) exitWith{};
  //systemChat typeName _bluePresent;
  //systemChat (_AreaName + " " + ((str _bluePresent) + " " + (str _redPresent) + " " + (str _greenPresent)));

  if (_bluePresent && _TowerHeld && (_redPresent || _greenPresent)) then //if _bluePresent then warn players and create a task to defend point
  {
    if(!_Warned)then
    {
      //systemChat (_AreaName + " is being attacked! Send reinforcements!");
      [west,("Defend" + _AreaName),[(_AreaName + " is under attack! defend this location!"), ("Defend " + _AreaName), _AreaName], getMarkerPos _AreaName,"Created",1,true,"Defend"]call BIS_fnc_taskCreate;
      _tsDefend = ("Defend" + _AreaName);
      _Warned = true;
    };
  };

  if (!_bluePresent && !_redPresent && _greenPresent && _TowerHeld) exitWith //if not blue and zombies then no warning. after time loose point and notify point lost
  {
    if(!_zombieTimerStarted) then
    {
        null = [_RadioTower]execVM "RadioSystem\CaptureTimer.sqf";
        _zombieTimerStarted = true;
    };


    // no warning
    //timer for so long area is no longer usable by blue notify players they have lost the point
    //find a way to store time
  };

  if((!_bluePresent && !_greenPresent) && _redPresent && _TowerHeld) exitWith
  {
    //Area is no longer usable by blue
    //Notify Blue that point was lost
    systemChat (_AreaName + " has been lost!");
    null = [_RadioTower]execVM "RadioSystem\looseRadio.sqf";
    if([_tsDefend] call BIS_fnc_taskExists) then
    {
      [_tsDefend, "FAILED", true] call BIS_fnc_taskSetState;
    };
  };
  if (_bluePresent && _TowerHeld && !_redPresent && !_greenPresent) exitWith
  {
    if([_tsDefend] call BIS_fnc_taskExists) then
    {
      [_tsDefend, "SUCCEEDED", true] call BIS_fnc_taskSetState;
    };
  };
};
//if Opfor and Zombies no Blue
  //fight it out!

  //create point lost function
