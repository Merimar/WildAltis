_query = "SELECT id, side FROM life_sides";
SIDE_QUERY = [_query, 2, true] call HC_fnc_asyncCall;

_query = "SELECT id, license FROM life_licenses";
LICENSE_QUERY = [_query, 2, true] call HC_fnc_asyncCall;

_query = "SELECT id, skill FROM life_skills";
SKILL_QUERY = [_query, 2, true] call HC_fnc_asyncCall;