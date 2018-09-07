_TimerEnd = 10; // Time to wait in seconds
_loopCounter = 0;
_RadioTower = _this select 0;
_tsDefend = ("Defend" + (str _RadioTower));
systemChat (typeName _loopCounter);
systemChat (typeName _TimerEnd);

while {(_loopCounter <= _TimerEnd)} do

{
  if (((RadioCoverage select (parseNumber (str _RadioTower))) select 1)) then
  {
    sleep 1;
    _loopCounter = _loopCounter + 1;
  };
};

if(_loopCounter >= _TimerEnd) then
{
  null = [_RadioTower]execVM "RadioSystem\looseRadio.sqf";
  if([_tsDefend] call BIS_fnc_taskExists) then
  {
    [_tsDefend, "FAILED", true] call BIS_fnc_taskSetState;
  };
};
