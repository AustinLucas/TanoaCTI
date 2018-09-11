_trigger = _this select 0;
_NtownName = ((str _trigger) splitString "_");
_NtownName = _NtownName select 0;
_counter = 0;

if ((str _trigger) == (_NtownName + "_Trigger_Blue")) then
{
  _markername = (_NtownName + "_Capture");
  [west,("Capture " + _NtownName),[("Capture the town of " + _NtownName), ("Capture " + _NtownName), _markername], getMarkerPos _markername,"Created",1,true,"Attack"]call BIS_fnc_taskCreate;
  {
     _counter = ((str _x) splitString "_");
     _counter = _counter select 1;
     _markername = ((_NtownName) + ("_Inf_Building_") + _counter);
     _markername setMarkerAlpha 100;
     _taskName = ("Destory Infected building " + _counter);
     //systemChat _taskName;
     [west,[_taskName, ("Capture " + _NtownName)],[("Destory Infected building"), _taskName, _markername], getMarkerPos _markername,"Created",1,false,"Attack"]call BIS_fnc_taskCreate;
     null = [_NtownName, _x, _trigger, _taskName] execVM "TownSystem\InfectedBuildingCheck.sqf";
  }forEach (synchronizedObjects _trigger);
};

if ((str _trigger) == (_NtownName + "_Capture_Trigger_Blue")) then
{
  _bluePresent = triggerActivated (missionNamespace getVariable (_NtownName + "Capture_Trigger_Blue"));
  _redPresent = triggerActivated (missionNamespace getVariable (_NtownName + "Capture_Trigger_Red"));
  _greenPresent = triggerActivated (missionNamespace getVariable (_NtownName + "Capture_Trigger_Green"));

  While{_redPresent || _greenPresent || _bluePresent} do
  {
    _bluePresent = triggerActivated (missionNamespace getVariable (_NtownName + "Capture_Trigger_Blue"));
    _redPresent = triggerActivated (missionNamespace getVariable (_NtownName + "Capture_Trigger_Red"));
    _greenPresent = triggerActivated (missionNamespace getVariable (_NtownName + "Capture_Trigger_Green"));
    sleep 2;
    if (_bluePresent && (!_greenPresent && !_greenPresent) && (isNull(synchronizedObjects _trigger))) exitwith
    {
      systemChat "Captured town!";
    };
  };
  [("Capture " + _NtownName), "SUCCEEDED", true] call BIS_fnc_taskSetState;

};
