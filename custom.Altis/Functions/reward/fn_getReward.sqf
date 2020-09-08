private _geheimZahl = param [0, 0, [0]];
private _rewardType = param [1, "", [""]];
private _rewardValue = param [2, [], [[]]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

private _reward = _rewardValue select 0;
private _amount = _rewardValue param [1, 1];

switch (_rewardType) do {
case "MESSAGE" : {[_reward, "Reward"] spawn life_fnc_message;};
case "MONEY" : {BANK = BANK + _reward;};
case "SKILL" : {[_reward, _amount] call life_fnc_addSkill;};
case "VIRT" : {[true, _reward, _amount] call HC_fnc_handleInv;};
case "VIRT_ABO" : {[true, _reward, _amount] call HC_fnc_handleInv;};
case "ITEM" : {[_reward, true] spawn life_fnc_handleItem;};
};

["Du hast deine Belohnung bekommen!", "Reward"] spawn life_fnc_message;