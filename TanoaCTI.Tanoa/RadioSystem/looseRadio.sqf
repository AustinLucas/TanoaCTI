_radioLost = _this select 0;

{
    if ((_x select 2) == _radioLost) then
    {
      _x set [1, false];
      execVM "RadioSystem\changeRadio.sqf";
    };
} forEach RadioCoverage;
