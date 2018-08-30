_capturedRadio = _this select 0;
{
    if ((str(_x select 2)) == _capturedRadio) then
    {
      _x set [1, true];
      execVM "changeRadio.sqf";
    };
} forEach RadioCoverage;
