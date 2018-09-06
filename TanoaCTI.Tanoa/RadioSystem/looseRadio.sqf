_radioLost = _this select 0;

RadioCoverage select _radioLost set [1, false];
execVM "RadioSystem\changeRadio.sqf";
