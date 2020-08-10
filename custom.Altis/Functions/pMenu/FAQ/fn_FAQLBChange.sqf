disableSerialization;
private _display = findDisplay 3950;
private _questionList = _display displayCtrl 3951;
private _answerField = _display displayCtrl 3952;
private _answer = _questionList lbData (lbCurSel _questionList);
_answerField ctrlSetText _answer;