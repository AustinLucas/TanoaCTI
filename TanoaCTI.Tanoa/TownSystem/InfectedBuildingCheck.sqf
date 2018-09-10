_ntownName = _this select 0;
_Spawner = _this select 1;
_trigger = _this select 2;
_infectedBuilding = (nearestBuilding (getPos _Spawner));

systemChat (str _spawner);

While {(Alive _infectedBuilding) && (triggerActivated _trigger)} do
{
  sleep 2;
  //systemChat "building alive and you are in the point";
};

if(triggerActivated _trigger)then
{
  systemChat "Infected Building Destoried";
  //systemChat (str _spawner);
  deleteVehicle _spawner;
};
