_ntownName = _this select 0;
_Spawner = _this select 1;
_trigger = _this select 2;
_task = _this select 3;
_infectedBuilding = (nearestBuilding (getPos _Spawner));

//systemChat (str _spawner);

While {(Alive _infectedBuilding) && (triggerActivated _trigger)} do
{
  sleep 2;
  //systemChat _task;
};

if(triggerActivated _trigger)then
{
  systemChat "Infected Building Destoryed";
  //systemChat (str _spawner);
  _nearestMarker = [allMapMarkers, _spawner] call BIS_fnc_nearestPosition;
  [_task, "SUCCEEDED", true] call BIS_fnc_taskSetState;
  deleteMarker _nearestMarker;
  deleteVehicle _spawner;
};
