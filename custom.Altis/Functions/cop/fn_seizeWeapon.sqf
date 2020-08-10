_clear = nearestObjects [player,["weaponholder"],3];
titleText[format["%1 Sachen auf dem Boden wurden von den Ameisen gefressen.", count _clear],"PLAIN"];

[player] remoteExec ["HC_fnc_clearGround", HC_LIFE];