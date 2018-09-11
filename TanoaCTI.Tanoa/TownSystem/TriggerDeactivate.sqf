_trigger = _this select 0;
_NtownName = ((str _trigger) splitString "_");
_NtownName = _NtownName select 0;
_counter = 0;
_makername = "";
_task = "";
_MainTask = ("Capture " + _NtownName);
[_MainTask] call BIS_fnc_deleteTask;
While {_counter <= 20} do
{
   _counter = _counter + 1;
   _makername = ((_NtownName) + ("_Inf_Building_") + (str (_counter)));
   _makername setMarkerAlpha 100;
   _task = ("Destory Infected building " + (str _counter));
   if ([_task] call BIS_fnc_taskExists) then
   {
     [_task] call BIS_fnc_deleteTask;
   };
};
