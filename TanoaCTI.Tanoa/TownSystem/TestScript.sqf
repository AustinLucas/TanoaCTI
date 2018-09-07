_data = _this select 0;
_spawner = (_this select 1) select 0;
systemChat (str _data);
while {(alive _data)} do
{
  sleep 2;
  systemChat (str _spawner);
};
systemChat "Building Destoried";
systemChat (str _spawner);
delete3delete3DENEntities (_spawner);
