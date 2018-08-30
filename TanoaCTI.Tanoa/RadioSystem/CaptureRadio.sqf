_capturedRadio = _this select 0;
systemChat _capturedRadio;
{
    if ((_x select 2) == _capturedRadio) then
    {
      _x set [1, true];
      execVM "RadioSystem\changeRadio.sqf";
    };
} forEach RadioCoverage;
