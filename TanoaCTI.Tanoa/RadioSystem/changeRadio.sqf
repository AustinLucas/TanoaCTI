//add public variable change
{
    if (_x select 1) then
    {
      systemChat "Changing Radio Color";
      (_x select 2) setMarkerColor "ColorGreen";
      (_x select 0) setMarkerAlpha 25;

    };
    if (_Disable == "Disable") then {
      (_x select 0) setMarkerAlpha 0;
    };
    if (_Disable == "Enable" && (_x select 1)) then {
      (_x select 0) setMarkerAlpha 25;
    };
} forEach RadioCoverage;
