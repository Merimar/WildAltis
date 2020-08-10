for "_int" from 6 to 15 step 1 do {_int enableChannel [true, false];};

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;

switch (playerSide) do {
case civilian : {SIDECHAT_CIV radioChannelAdd [player];};
case east : {SIDECHAT_CIV radioChannelAdd [player];};
case west : {SIDECHAT_COP radioChannelAdd [player];};
case independent : {SIDECHAT_MED radioChannelAdd [player];};
};