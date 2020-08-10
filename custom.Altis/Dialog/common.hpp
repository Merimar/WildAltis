#define ST_LEFT           0x00
#define ST_MULTI          0x10
#define GUI_GRID_CENTER_WAbs        ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs        (GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W        (GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H        (GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X        (safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y        (safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

class Life_Checkbox
{
    access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
    idc = -1; // Control identification (without it, the control won't be displayed)
    type = 77; // Type
    style = ST_LEFT; // Style
    default = 0; // Control selected by default (only one within a display can be used)
    blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

    x = 0;
    y = 0;
    w = 1 * GUI_GRID_CENTER_W; // Width
    h = 1 * GUI_GRID_CENTER_H; // Height

    //Colors
    color[] = { 1, 1, 1, 0.7 }; // Texture color
    colorFocused[] = { 1, 1, 1, 1 }; // Focused texture color
    colorHover[] = { 1, 1, 1, 1 }; // Mouse over texture color
    colorPressed[] = { 1, 1, 1, 1 }; // Mouse pressed texture color
    colorDisabled[] = { 1, 1, 1, 0.2 }; // Disabled texture color

    //Background colors
    colorBackground[] = { 0, 0, 0, 0 }; // Fill color
    colorBackgroundFocused[] = { 0, 0, 0, 0 }; // Focused fill color
    colorBackgroundHover[] = { 0, 0, 0, 0 }; // Mouse hover fill color
    colorBackgroundPressed[] = { 0, 0, 0, 0 }; // Mouse pressed fill color
    colorBackgroundDisabled[] = { 0, 0, 0, 0 }; // Disabled fill color

    //Textures
    textureChecked = "Images\Dialog\Checkbox_Checked.jpg";        //Texture of checked CheckBox.
    textureUnchecked = "Images\Dialog\Checkbox_Unchecked.jpg";        //Texture of unchecked CheckBox.
    textureFocusedChecked = "Images\Dialog\Checkbox_Checked.jpg";    //Texture of checked focused CheckBox (Could be used for showing different texture when focused).
    textureFocusedUnchecked = "Images\Dialog\Checkbox_Unchecked.jpg";    //Texture of unchecked focused CheckBox.
    textureHoverChecked = "Images\Dialog\Checkbox_Checked.jpg";
    textureHoverUnchecked = "Images\Dialog\Checkbox_Unchecked.jpg";
    texturePressedChecked = "Images\Dialog\Checkbox_Checked.jpg";
    texturePressedUnchecked = "Images\Dialog\Checkbox_Unchecked.jpg";
    textureDisabledChecked = "Images\Dialog\Checkbox_Checked.jpg";
    textureDisabledUnchecked = "Images\Dialog\Checkbox_Unchecked.jpg";

    tooltip = ""; // Tooltip text
    tooltipColorShade[] = { 0, 0, 0, 1 }; // Tooltip background color
    tooltipColorText[] = { 1, 1, 1, 1 }; // Tooltip text color
    tooltipColorBox[] = { 1, 1, 1, 1 }; // Tooltip frame color

    //Sounds
    soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1 }; // Sound played after control is activated in format {file, volume, pitch}
    soundEnter[] = { "\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1 }; // Sound played when mouse cursor enters the control
    soundPush[] = { "\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1 }; // Sound played when the control is pushed down
    soundEscape[] = { "\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1 }; // Sound played when the control is released after pushing down

};

class Life_Merimarbox
{
    access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
    idc = -1; // Control identification (without it, the control won't be displayed)
    type = 77; // Type
    style = ST_LEFT; // Style
    default = 0; // Control selected by default (only one within a display can be used)
    blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

    x = 0;
    y = 0;
    w = 0; // Width
    h = 0; // Height

    //Colors
    color[] = { 1, 1, 1, 1 }; // Texture color
    colorFocused[] = { 1, 1, 1, 1 }; // Focused texture color
    colorHover[] = { 1, 1, 1, 1 }; // Mouse over texture color
    colorPressed[] = { 1, 1, 1, 1 }; // Mouse pressed texture color
    colorDisabled[] = { 1, 1, 1, 1 }; // Disabled texture color

    //Background colors
    colorBackground[] = { 0, 0, 0, 0 }; // Fill color
    colorBackgroundFocused[] = { 0, 0, 0, 0 }; // Focused fill color
    colorBackgroundHover[] = { 0, 0, 0, 0 }; // Mouse hover fill color
    colorBackgroundPressed[] = { 0, 0, 0, 0 }; // Mouse pressed fill color
    colorBackgroundDisabled[] = { 0, 0, 0, 0 }; // Disabled fill color
	colorBackgroundActive[] = { 0, 0, 0, 0 };   // background color for active state

	/*
    //Textures
    textureChecked = "Images\Dialog\Checkbox_Checked.paa";        //Texture of checked CheckBox.
    textureUnchecked = "Images\Dialog\Checkbox_Unchecked.paa";        //Texture of unchecked CheckBox.
    textureFocusedChecked = "Images\Dialog\Checkbox_Checked.paa";    //Texture of checked focused CheckBox (Could be used for showing different texture when focused).
    textureFocusedUnchecked = "Images\Dialog\Checkbox_Unchecked.paa";    //Texture of unchecked focused CheckBox.
    textureHoverChecked = "Images\Dialog\Checkbox_Checked.paa";
    textureHoverUnchecked = "Images\Dialog\Checkbox_Unchecked.paa";
    texturePressedChecked = "Images\Dialog\Checkbox_Checked.paa";
    texturePressedUnchecked = "Images\Dialog\Checkbox_Unchecked.paa";
    textureDisabledChecked = "Images\Dialog\Checkbox_Checked.paa";
    textureDisabledUnchecked = "Images\Dialog\Checkbox_Unchecked.paa";
	*/
	//Textures
	textureChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; 
	textureUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; 
	textureFocusedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; 
	textureFocusedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; 
	textureHoverChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; 
	textureHoverUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; 
	texturePressedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; 
	texturePressedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"; 
	textureDisabledChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"; 
	textureDisabledUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";

    tooltip = ""; // Tooltip text
    tooltipColorShade[] = { 0, 0, 0, 1 }; // Tooltip background color
    tooltipColorText[] = { 1, 1, 1, 1 }; // Tooltip text color
    tooltipColorBox[] = { 1, 1, 1, 1 }; // Tooltip frame color

    //Sounds
    soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1 }; // Sound played after control is activated in format {file, volume, pitch}
    soundEnter[] = { "\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1 }; // Sound played when mouse cursor enters the control
    soundPush[] = { "\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1 }; // Sound played when the control is pushed down
    soundEscape[] = { "\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1 }; // Sound played when the control is released after pushing down

};

class Life_RscScrollBar
{
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class Life_RscControlsGroup {
    type = 15;
    idc = -1;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    shadow = 0;
    style = 16;

    class VScrollBar : Life_RscScrollBar
    {
        width = 0.021;
        autoScrollEnabled = 1;
    };

    class HScrollBar : Life_RscScrollBar
    {
        height = 0.028;
    };

    class Controls {};
};

class Life_RscControlsGroupNoScrollbars : Life_RscControlsGroup {
    class VScrollbar : VScrollbar {
        width = 0;
    };

    class HScrollbar : HScrollbar {
        height = 0;
    };
};

class Life_RscHud
{
    idc = -1;
    type = 0;
    style = 0x00;
    colorBackground[] = { 1 , 1 , 1 , 0 };
    colorText[] = { 1 , 1 , 1 , 1 };
    font = "PuristaSemibold";
    sizeEx = 0.025;
    h = 0.25;
    text = "";
};

class Life_RscListNBox
{
    style = 16;
    type = 102;
    shadow = 0;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    color[] = {0.95,0.95,0.95,1};
    colorText[] = {1,1,1,1.0};
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = {0.95,0.95,0.95,1};
    colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
    colorSelectBackground[] = {0.8,0.8,0.8,1};
    colorSelectBackground2[] = {1,1,1,0.5};
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
        colorPictureDisabled[] = {1,1,1,1};
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    period = 1.2;
    maxHistoryDelay = 0.5;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    class ListScrollBar: Life_RscScrollBar{};
    class ScrollBar: Life_RscScrollBar{};
};


class Life_RscText {
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    type = 0;
    style = 0;
    shadow = 1;
    colorShadow[] = {0, 0, 0, 0.5};
    font = "PuristaMedium";
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    text = "";
    colorText[] = {1, 1, 1, 1.0};
    colorBackground[] = {0, 0, 0, 0};
    linespacing = 1;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};

class Life_RscLine: Life_RscText {
    idc = -1;
    style = 176;
    x = 0.17;
    y = 0.48;
    w = 0.66;
    h = 0;
    text = "";
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1.0};
};

class Life_RscTree {
    style = 2;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    expandedTexture = "A3\ui_f\data\gui\Rsccommon\Rsctree\expandedTexture_ca.paa";
    hiddenTexture = "A3\ui_f\data\gui\Rsccommon\Rsctree\hiddenTexture_ca.paa";
    rowHeight = 0.0439091;
    color[] = {1, 1, 1, 1};
    colorSelect[] = {0.7, 0.7, 0.7, 1};
    colorBackground[] = {0, 0, 0, 0};
    colorSelectBackground[] = {0, 0, 0, 0.5};
    colorBorder[] = {0, 0, 0, 0};
    borderSize = 0;
};

class Life_RscTitle: Life_RscText {
    style = 0;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorText[] = {0.95, 0.95, 0.95, 1};
};

class life_RscPicture {
    shadow = 0;
    type = 0;
    style = 48;
    sizeEx = 0.023;
    font = "PuristaMedium";
    colorBackground[] = {};
    colorText[] = {};
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};

class Life_RscTextMulti: Life_RscText
{
    linespacing = 1;
    style = 0 + 16 + 0x200;
};

class Life_RscPictureKeepAspect : Life_RscPicture
{
    style = 0x30 + 0x800;
};

class Life_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorText[] = {1, 1, 1, 1.0};
    shadow = 1;

    class Attributes {
        font = "PuristaMedium";
        color = "#ffffff";
        align = "left";
        shadow = 1;
    };
};

class Life_RscActiveText {
idc = -1;
    type = 11;
    style = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    sizeEx = 0.040;
    font = "PuristaLight";
    color[] = {1, 1, 1, 1};
    colorActive[] = {1, 0.2, 0.2, 1};
    soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
    soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
    action = "";
    text = "";
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};

class Life_RscButton
{
    style = 2;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorText[] = {1,1,1,1.0};
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7};
    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
    colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
    colorShadow[] = {0,0,0,1};
    colorBorder[] = {0,0,0,1};
    borderSize = 0.0;
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};

class Life_RscButtonTextOnly : Life_RscButton {
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    colorBackground[] = {1, 1, 1, 0};
    colorBackgroundActive[] = {1, 1, 1, 0};
    colorBackgroundDisabled[] = {1, 1, 1, 0};
    colorFocused[] = {1, 1, 1, 0};
    colorShadow[] = {1, 1, 1, 0};
    borderSize = 0.0;
};

class Life_RscShortcutButton {
    idc = -1;
    style = 0;
    default = 0;
    shadow = 1;
    w = 0.183825;
    h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
    color[] = {1,1,1,1.0};
    colorFocused[] = {1,1,1,1.0};
    color2[] = {0.95,0.95,0.95,1};
    colorDisabled[] = {1,1,1,0.25};
    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
    colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
    colorBackground2[] = {1,1,1,1};
    animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
    animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
    animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
    periodFocus = 1.2;
    periodOver = 0.8;
    class HitZone
    {
        left = 0.0;
        top = 0.0;
        right = 0.0;
        bottom = 0.0;
    };
    class ShortcutPos
    {
        left = 0;
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
        h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    };
    class TextPos
    {
        left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0.0;
    };
    period = 0.4;
    font = "PuristaMedium";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    text = "";
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    action = "";
    class Attributes
    {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "left";
        shadow = "true";
    };
    class AttributesImage
    {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "left";
    };
};

class Life_RscButtonMenu : Life_RscShortcutButton {
    idc = -1;
    type = 16;
    style = "0x02 + 0xC0";
    default = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    colorBackground[] = {0,0,0,0.8};
    colorBackgroundFocused[] = {1,1,1,1};
    colorBackground2[] = {0.75,0.75,0.75,1};
    color[] = {1,1,1,1};
    colorFocused[] = {0,0,0,1};
    color2[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    period = 1.2;
    periodFocus = 1.2;
    periodOver = 1.2;
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    class TextPos
    {
        left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0.0;
    };
    class Attributes
    {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "left";
        shadow = "false";
    };
    class ShortcutPos
    {
        left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
        top = 0.005;
        w = 0.0225;
        h = 0.03;
    };
    soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
    textureNoShortcut = "";
};

class Life_RscShortcutButtonMain : Life_RscShortcutButton {
    idc = -1;
    style = 0;
    default = 0;
    w = 0.313726;
    h = 0.104575;
    color[] = {1, 1, 1, 1.0};
    colorDisabled[] = {1, 1, 1, 0.25};

    class HitZone {
        left = 0.0;
        top = 0.0;
        right = 0.0;
        bottom = 0.0;
    };

    class ShortcutPos {
        left = 0.0145;
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
        w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (3/4)";
        h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    };

    class TextPos {
        left = "(        ((safezoneW / safezoneH) min 1.2) / 32) * 1.5";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)*2 - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
        right = 0.005;
        bottom = 0.0;
    };
    animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
    animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
    animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
    animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
    animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
    animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
    period = 0.5;
    font = "PuristaMedium";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    text = "";
    soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
    soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
    action = "";

    class Attributes {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "left";
        shadow = "false";
    };

    class AttributesImage {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "false";
    };
};

class Life_RscCheckbox {
    idc = -1;
    type = 7;
    style = 0;
    x = "LINE_X(XVAL)";
    y = LINE_Y;
    w = "LINE_W(WVAL)";
    h = 0.029412;
    colorText[] = {1, 0, 0, 1};
    color[] = {0, 0, 0, 0};
    colorBackground[] = {0, 0, 1, 1};
    colorTextSelect[] = {0, 0.8, 0, 1};
    colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
    colorSelect[] = {0, 0, 0, 1};
    colorTextDisable[] = {0.4, 0.4, 0.4, 1};
    colorDisable[] = {0.4, 0.4, 0.4, 1};
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    rows = 1;
    5ns = 1;
    strings[] = {UNCHECKED};
    checked_strings[] = {CHECKED};
};

class Life_RscProgress
{
    type = 8;
    style = 0;
    x = 0.344;
    y = 0.619;
    w = 0.313726;
    h = 0.0261438;
    texture = "";
    shadow = 2;
    colorFrame[] = {0, 0, 0, 1};
    colorBackground[] = {0,0,0,0.7};
    colorBar[] = {0.835, 0.462, 0.023, 1};
};

class Raska_Life_RscProgress
{
  type = 8;
  style = 0;
  x = 0.344;
  y = 0.619;
  w = 0.313726;
  h = 0.0261438;
  texture = "";
  shadow = 0;
  colorFrame[] = {0, 0, 0, 1};
  colorBackground[] = {0,0,0,1};
}

class Life_RscListBox
{
    style = 16;
    idc = -1;
    type = 5;
    w = 0.275;
    h = 0.04;
    font = "PuristaMedium";
    colorText[] = {1, 1, 1, 1};
    //colorBackground[] = {0.28,0.28,0.28,0.28};
	colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,1,0,1};
    colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    colorScrollbar[] = {0.2, 0.2, 0.2, 1};
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,1};
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    wholeHeight = 0.45;
    rowHeight = 0.04;
    color[] = {0.7, 0.7, 0.7, 1};
    colorActive[] = {0,0,0,1};
    colorDisabled[] = {0,0,0,0.3};
    sizeEx = 0.023;
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    maxHistoryDelay = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    class ListScrollBar: Life_RscScrollBar
    {
        color[] = {1,1,1,1};
        autoScrollEnabled = 1;
    };
};

class Life_RscEdit {
    type = 2;
    style = 0x00 + 0x40;
    font = "PuristaMedium";
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorBackground[] = {0, 0, 0, 1};
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    colorText[] = {0.95, 0.95, 0.95, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    autocomplete = false;
    colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
    canModify = 1;
};

class Life_RscSlider {
    h = 0.025;
    color[] = {1, 1, 1, 0.8};
    colorActive[] = {1, 1, 1, 1};
};

class life_RscXSliderH
{
    style = 1024;
    type = 43;
    shadow = 2;
    x = 0;
    y = 0;
    h = 0.029412;
    w = 0.400000;
    color[] = {
            1, 1, 1, 0.7
    };
    colorActive[] = {
            1, 1, 1, 1
    };
    colorDisabled[] = {
            1, 1, 1, 0.500000
    };
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class Life_RscFrame {
    type = 0;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
};

class Life_RscBackground: Life_RscText {
    type = 0;
    IDC = -1;
    style = 512;
    shadow = 0;
    x = 0.0;
    y = 0.0;
    w = 1.0;
    h = 1.0;
    text = "";
    ColorBackground[] = {0.48, 0.5, 0.35, 1};
    ColorText[] = {0.1, 0.1, 0.1, 1};
    font = "PuristaMedium";
    SizeEx = 1;
};

class Life_RscHTML {
    colorText[] = {1, 1, 1, 1.0};
    colorBold[] = {1, 1, 1, 1.0};
    colorLink[] = {1, 1, 1, 0.75};
    colorLinkActive[] = {1, 1, 1, 1.0};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    prevPage = "\A3\ui_f\data\gui\Rsccommon\Rschtml\arrow_left_ca.paa";
    nextPage = "\A3\ui_f\data\gui\Rsccommon\Rschtml\arrow_right_ca.paa";
    shadow = 2;

    class H1 {
        font = "PuristaMedium";
        fontBold = "PuristaSemibold";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
        align = "left";
    };

    class H2 {
        font = "PuristaMedium";
        fontBold = "PuristaSemibold";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        align = "right";
    };

    class H3 {
        font = "PuristaMedium";
        fontBold = "PuristaSemibold";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        align = "left";
    };

    class H4 {
        font = "PuristaMedium";
        fontBold = "PuristaSemibold";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        align = "left";
    };

    class H5 {
        font = "PuristaMedium";
        fontBold = "PuristaSemibold";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        align = "left";
    };

    class H6 {
        font = "PuristaMedium";
        fontBold = "PuristaSemibold";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        align = "left";
    };

    class P {
        font = "PuristaMedium";
        fontBold = "PuristaSemibold";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        align = "left";
    };
};

class Life_RscHitZones {
    x = 0;
    y = 0;
    w = 0.1;
    h = 0.1;
    xCount = 1;
    yCount = 1;
    xSpace = 0;
    ySpace = 0;
};

class Life_RscMapControl
{
    access = 0;
    type = 101;
    idc = 51;
    style = 48;
    colorBackground[] = {0.969,0.957,0.949,1};
    colorOutside[] = {0,0,0,1};
    colorText[] = {0,0,0,1};
    font = "TahomaB";
    sizeEx = 0.04;
    colorSea[] = {0.467,0.631,0.851,0.5};
    colorForest[] = {0.624,0.78,0.388,0.5};
    colorRocks[] = {0,0,0,0.3};
    colorCountlines[] = {0.572,0.354,0.188,0.25};
    colorMainCountlines[] = {0.572,0.354,0.188,0.5};
    colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
    colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
    colorForestBorder[] = {0,0,0,0};
    colorRocksBorder[] = {0,0,0,0};
    colorPowerLines[] = {0.1,0.1,0.1,1};
    colorRailWay[] = {0.8,0.2,0,1};
    colorNames[] = {0.1,0.1,0.1,0.9};
    colorInactive[] = {1,1,1,0.5};
    colorLevels[] = {0.286,0.177,0.094,0.5};
    colorTracks[] = {0.84,0.76,0.65,0.15};
    colorRoads[] = {0.7,0.7,0.7,1};
    colorMainRoads[] = {0.9,0.5,0.3,1};
    colorTracksFill[] = {0.84,0.76,0.65,1};
    colorRoadsFill[] = {1,1,1,1};
    colorMainRoadsFill[] = {1,0.6,0.4,1};
    colorGrid[] = {0.1,0.1,0.1,0.6};
    colorGridMap[] = {0.1,0.1,0.1,0.6};
    stickX[] = {0.2,{"Gamma",1,1.5}};
    stickY[] = {0.2,{"Gamma",1,1.5}};
	widthRailWay = 0;
    class Legend
    {
        colorBackground[] = {1,1,1,0.5};
        color[] = {0,0,0,1};
        x = "SafeZoneX + (((safezoneW / safezoneH) min 1.2) / 40)";
        y = "SafeZoneY + safezoneH - 4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
        h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        font = "PuristaMedium";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    };
    class ActiveMarker
    {
        color[] = {0.3,0.1,0.9,1};
        size = 50;
    };
    class Command
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Task
    {
        colorCreated[] = {1,1,1,1};
        colorCanceled[] = {0.7,0.7,0.7,1};
        colorDone[] = {0.7,1,0.3,1};
        colorFailed[] = {1,0.3,0.2,1};
        color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
        icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class CustomMark
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Tree
    {
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class SmallTree
    {
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bush
    {
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = "14/2";
        importance = "0.2 * 14 * 0.05 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Church
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Chapel
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Cross
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Rock
    {
        color[] = {0.1,0.1,0.1,0.8};
        icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bunker
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fortress
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fountain
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size = 11;
        importance = "1 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class ViewTower
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
    };
    class Lighthouse
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Quay
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Fuelstation
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Hospital
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class BusStop
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Transmitter
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Stack
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size = 20;
        importance = "2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class Ruin
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size = 16;
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
    };
    class Tourism
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.7;
        coefMax = 4;
    };
    class Watertower
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Waypoint
    {
        color[] = {0,0,0,1};
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
    };
    class WaypointCompleted
    {
        color[] = {0,0,0,1};
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
    };
    moveOnEdges = 0;//1;
    x = "SafeZoneXAbs";
    y = "SafeZoneY + 1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    w = "SafeZoneWAbs";
    h = "SafeZoneH - 1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    shadow = 0;
    ptsPerSquareSea = 5;
    ptsPerSquareTxt = 3;
    ptsPerSquareCLn = 10;
    ptsPerSquareExp = 10;
    ptsPerSquareCost = 10;
    ptsPerSquareFor = 9;
    ptsPerSquareForEdge = 9;
    ptsPerSquareRoad = 6;
    ptsPerSquareObj = 9;
    showCountourInterval = 0;
    scaleMin = 0.001;
    scaleMax = 1;
    scaleDefault = 0.16;
    maxSatelliteAlpha = 0.85;
    alphaFadeStartScale = 0.35;
    alphaFadeEndScale = 0.4;
    fontLabel = "PuristaMedium";
    sizeExLabel = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontGrid = "TahomaB";
    sizeExGrid = 0.02;
    fontUnits = "TahomaB";
    sizeExUnits = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontNames = "PuristaMedium";
    sizeExNames = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
    fontInfo = "PuristaMedium";
    sizeExInfo = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontLevel = "TahomaB";
    sizeExLevel = 0.02;
    text = "#(argb,8,8,3)color(1,1,1,1)";
    //text = "\a3\ui_f\data\map_background2_co.paa";
    class power
    {
        icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class powersolar
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class powerwave
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class powerwind
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class shipwreck
    {
        icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class LineMarker
    {
        lineDistanceMin = 3e-005;
        lineLengthMin = 5;
        lineWidthThick = 0.014;
        lineWidthThin = 0.008;
        textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
    };
};

class Life_RscCombo {
    style = 16;
    type = 4;
    x = 0;
    y = 0;
    w = 0.12;
    h = 0.035;
    shadow = 0;
    colorSelect[] = {0, 0, 0, 1};
    soundExpand[] = {"",0.1,1};
    colorText[] = {0.95, 0.95, 0.95, 1};
    soundCollapse[] = {"",0.1,1};
    maxHistoryDelay = 1;
    colorBackground[] = {0.4,0.4,0.4,0.4};
    colorSelectBackground[] = {1, 1, 1, 0.7};
    colow_Rscrollbar[] = {1, 0, 0, 1};
    soundSelect[] = {
            "", 0.000000, 1
    };
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    wholeHeight = 0.45;
    color[] = {1, 1, 1, 1};
    colorActive[] = {1, 0, 0, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

    class ComboScrollBar : Life_RscScrollBar {};
};

class Life_RscToolbox {
    colorText[] = {0.95, 0.95, 0.95, 1};
    color[] = {0.95, 0.95, 0.95, 1};
    colorTextSelect[] = {0.95, 0.95, 0.95, 1};
    colorSelect[] = {0.95, 0.95, 0.95, 1};
    colorTextDisable[] = {0.4, 0.4, 0.4, 1};
    colorDisable[] = {0.4, 0.4, 0.4, 1};
    colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
};

class Merimar_RscButtonMenu : Life_RscShortcutButton {
    idc = -1;
    type = 16;
    style = "0x02 + 0xC0";
    default = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    colorBackground[] = {0.1,0.1,0.16,1};
    colorBackgroundFocused[] = {0.2,0.2,0.32,1}; 
    colorBackground2[] = {0.2,0.2,0.32,1};
    color[] = {1,0.83,0.247,1};
    colorFocused[] = {1,0.83,0.247,1};
    color2[] = {1,0.83,0.247,1};
    colorText[] = {1,0.83,0.247,1};
    colorDisabled[] = {1,1,1,0.25};
    period = 1.2;
    periodFocus = 1.2;
    periodOver = 1.2;
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    class TextPos
    {
        left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0.0;
    };
    class Attributes
    {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "left";
        shadow = "false";
    };
    class ShortcutPos
    {
        left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
        top = 0.005;
        w = 0.0225;
        h = 0.03;
    };
    soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
    textureNoShortcut = "";
};

class Merimar_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorText[] = {1, 1, 1, 1.0};
    shadow = 1;

    class Attributes {
        font = "PuristaMedium";
        color = "#ffffff";
        align = "center";
        shadow = 1;
    };
};

class Merimar2_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {-1,-1,-1,0};
    shadow = 1;

    class Attributes {
        font = "RobotoCondensed";
        color = "#ffd43f";
        align = "left";
        shadow = 1;
    };
};

class Merimar3_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {-1,-1,-1,0};
    shadow = 1;

    class Attributes {
        font = "RobotoCondensed";
        color = "#1b1d2a";
        align = "center";
        shadow = 1;
    };
};

class Merimar4_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {-1,-1,-1,0};
    shadow = 1;

    class Attributes {
        font = "RobotoCondensed";
        color = "#D2D2D2";
        align = "left";
        shadow = 1;
    };
};

class Merimar5_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {0.102,0.114,0.161,1};
    shadow = 1;

    class Attributes {
        font = "RobotoCondensed";
        color = "#dc1430";
        align = "left";
        shadow = 1;
    };
};

class Merimar6_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {-1,-1,-1,0};
    shadow = 1;

    class Attributes {
        font = "RobotoCondensed";
        color = "#00CED1";
        align = "left";
        shadow = 1;
    };
};

class Merimar7_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {-1,-1,-1,0};
    shadow = 1;

    class Attributes {
        font = "RobotoCondensed";
        color = "#FF5500";
        align = "left";
        shadow = 1;
    };
};

class MerimarGrey_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {-1,-1,-1,0};
    shadow = 1;

    class Attributes {
        font = "RobotoCondensed";
        color = "#D1D1D1";
        align = "left";
        shadow = 1;
    };
};

class RscSider : Life_RscText {
	text = "";
	colorBackground[] = {0.835, 0.462, 0.023, 0.3};
};

class RscSiderVertical : RscSider {
	w = 0.002 * safezoneW;
};

class RscSiderHorizontal : RscSider {
	h = 0.002 * safezoneH;
};

class RscTopic : Life_RscText {
	text = "";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {0.1,0.1,0.16,1};
};

class RscBackground : Life_RscText {
	text = "";
	colorBackground[] = {0.102,0.114,0.161,0.8};
};

class RscDescription : Life_RscText {
	text = "";
	colorText[] = {1,0.83,0.247,1};
	font = "RobotoCondensed";
};

class RscTextRed : Life_RscStructuredText {
	text = "";
	colorBackground[] = {0.102,0.114,0.161,0};
	class Attributes {
        font = "PuristaBold";
        color = "#e0e7ea";
        align = "left";
        shadow = 1;
		underline = 1;
    };
};

class RscDescriptionStructured : Life_RscStructuredText {
	font = "RobotoCondensed";
	text = "";
	colorBackground[] = {0,1,1,0};
	class Attributes {
        font = "RobotoCondensed";
        color = "#FFD33F";
        align = "center";
        shadow = 1;
    };
};

class RscDescription2 : RscDescription {
	colorText[] = {0.7333,0.7333,0.77,1};
	colorBackground[] = {0.102,0.114,0.161,1};
	sizeEx = 0.05;
};

class RscDescription2Info : RscDescription {
	colorBackground[] = {0.102,0.114,0.161,1};
	sizeEx = 0.05;
};

class RscDescription2Structured : RscDescriptionStructured {
	colorBackground[] = {0.102,0.114,0.161,1};
	class Attributes {
        color = "#FFD33F";
    };
};

class RscHeader : Life_RscText {
	text = "";
	colorBackground[] = {0.102,0.114,0.161,1};
	colorText[] = {0.7333, 0.7333, 0.77, 1};
	font = "RobotoCondensed";
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
};

class RscBackgroundField : Life_RscText {
	text = "";
	colorBackground[] = {0.102,0.114,0.161,0.8};
};

class RscBackgroundDescription : Life_RscText {
	text = "";
	font = "RobotoCondensed";
	colorBackground[] = {0.204,0.228,0.322,1};
	colorText[] = {0.7333, 0.7333, 0.77, 1};
};

class RscPicture : life_RscPicture {
	text = "";
};

class BackgroundPicture : life_RscPicture {
	idc = -1;
	text = "Images\Dialog\background.jpg";
	x = 0.214633 * safeZoneW + safeZoneX;
	y = 0.0566709 * safeZoneH + safeZoneY;
	w = 0.566586 * safeZoneW;
	h = 0.803 * safeZoneH;
};

class RscCombo : Life_RscCombo {};

class Merimar_RscButtonMenuClose : Merimar_RscButtonMenu {
	text = "";
	color[] = {0.86,0.07,0.188,1};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackground2[] = {0,0,0,0};
	colorText[] = {0.86,0.07,0.188,1};
};

class Gang_Buttons : Merimar_RscButtonMenu {
colorBackground[] = {0.102,0.114,0.161,1};
};

class Merimar_RscListBox : Life_RscListBox {
	text = "";
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {0.1,0.1,0.16,0.8};
	colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
	sizeEx = 0.035;
};

class Picture_RscListBox : Merimar_RscListBox {
	text = "";
	sizeEx = ((0.16 * 0.55) * safeZoneH);
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {0.1,0.1,0.16,0.8};
	canDrag = 1;
};

class Grafik_RscListBox : Merimar_RscListBox {
	text = "";
	sizeEx = ((0.16 * 0.55) * safeZoneH);
	colorText[] = {1,0.83,0.247,1};
	colorBackground[] = {0.1,0.1,0.16,0.8};
};

class Merimar_RscEdit : Life_RscEdit {
	text = "";
	colorText[] = {1, 0.83, 0.247, 1};
    colorBackground[] = {0.204,0.228,0.322,1};
	canModify = 1;
	font = "RobotoCondensed";
    shadow = 2;
    sizeEx = 0.05;
};

class Merimar_RscCombo : RscCombo {
    colorText[] = {1,0.83,0.247,1};
    colorBackground[] = {0.204,0.228,0.322,1};
	colorActive[] = {0.102,0.114,0.161,1};
	colorSelect[] = {0.86,0.07,0.188,1};
	colorSelectBackground[] = {0.102,0.114,0.161,0.7};
    font = "RobotoCondensed";
    sizeEx = 0.05;
};

class RscPictureListBox : Merimar_RscListBox {
	canDrag = 1;
};

class Trans_List : Merimar_RscListBox {
	sizeEx = 0.035;
	font = "PuristaMedium";
	colorBackground[] = {0.28,0.28,0.28,0.28};
	colorText[] = {1,1,1,1};
	colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
};

class Transparent_Button : Life_RscButtonMenu {
	text = "";
	animTextureNormal = "";
    animTextureDisabled = "";
    animTextureOver = "";
    animTextureFocused = "";
    animTexturePressed = "";
    animTextureDefault = "";
    colorBackground[] = {0,0,0,0};
    colorBackgroundFocused[] = {0,0,0,0};
    colorBackground2[] = {0,0,0,0};
    color[] = {0,0,0,0};
    colorFocused[] = {0,0,0,0};
    color2[] = {0,0,0,0};
    colorText[] = {0,0,0,0};
    colorDisabled[] = {0,0,0,0};
    period = 1.2;
    periodFocus = 1.2;
    periodOver = 1.2;
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};

class Trans_Button : Life_RscButtonMenu {
	text = "";
	colorBackground[] = {-1,-1,-1,-1};
	colorBackgroundFocused[] = {0.835, 0.462, 0.023, 0.3};
	colorBackground2[] = {0.69, 0.313, 0.862, 0.3};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {0,0,0,0.4};
	class Attributes {
		align = "center";
	};
};

class Blue_Button : Life_RscButtonMenu {
	text = "";
	colorBackground[] = {0.313, 0.796, 0.862, 1};
	class Attributes {
		align = "center";
	};
};

class Trans_CloseButton : Life_RscButtonMenu {
	idc = -1;
	text = "";
    colorBackground[] = {0,0,0,0};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackground2[] = {0,0,0,0};
    color[] = {0,0,0,0};
    colorFocused[] = {0,0,0,0};
    color2[] = {0,0,0,0};
    colorText[] = {0,0,0,0};
    colorDisabled[] = {0,0,0,0};
	onButtonClick = "closeDialog 0;";
	x = 0.760866 * safeZoneW + safeZoneX;
	y = 0.125 * safeZoneH + safeZoneY;
	w = 0.0133688 * safeZoneW;
	h = 0.026 * safeZoneH;
};

class Trans_InvisibleButton : Life_RscButtonMenu {
	idc = -1;
	text = "";
	colorBackground[] = {0,0,0,0};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackground2[] = {0,0,0,0};
    color[] = {0,0,0,0};
    colorFocused[] = {0,0,0,0};
    color2[] = {0,0,0,0};
    colorText[] = {0,0,0,0};
    colorDisabled[] = {0,0,0,0};
};

class Trans_Text : Life_RscText {
	text = "";
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
};

class Trans_Edit : Life_RscEdit {
	text = "";
	colorText[] = {1,1,1,1};
    colorBackground[] = {0.204,0.228,0.322,0};
	canModify = 1;
	font = "PuristaMedium";
    shadow = 2;
    sizeEx = 0.04;
};

class Trans_MultiEdit : Trans_Edit {
	style = 16;
	lineSpacing = 1;
};

class Trans_Combo : RscCombo {
	colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
	colorActive[] = {1,1,1,1};
	colorSelect[] = {1,1,1,1};
	colorSelectBackground[] = {0,0,0,0};
    font = "PuristaMedium";
    sizeEx = 0.035;
};

class Trans_Checkbox : Life_Merimarbox {
	color[] = {0.835, 0.462, 0.023, 1};
    colorFocused[] = {0.835, 0.462, 0.023, 1};
	colorHover[] = {0.835, 0.462, 0.023, 1};
	colorPressed[] = {0.835, 0.462, 0.023, 1};
	colorDisabled[] = {0.835, 0.462, 0.023, 1};
	colorBackground[] = {0,0,0,0};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackgroundHover[] = {0,0,0,0};
	colorBackgroundPressed[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
};

class Trans_StructuredText : Life_RscStructuredText {
	text = "";
	colorBackground[] = {0.28,0.28,0.28,0.28};
	class Attributes {
        font = "PuristaMedium";
        color = "#FFFFFF";
        align = "left";
        shadow = 0;
    };
};

class Trans_Header : Life_RscText {
	idc = -1;
	text = "";
	sizeEx = 0.08;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	font = "PuristaMedium";
	x = 0.360781 * safeZoneW + safeZoneX;
	y = 0.082 * safeZoneH + safeZoneY;
	w = 0.4125 * safeZoneW;
	h = 0.044 * safeZoneH;
};

class Trans_TextHeader : Life_RscText {
	text = "";
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.835, 0.462, 0.023, 0.3};
	font = "PuristaMedium";
};

class Chatbox_Text : Life_RscStructuredText {
	colorBackground[] = {0.1, 0.1, 0.1, 1}; 
	class Attributes {
		font = "RobotoCondensed";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};

class RscProgress : Life_RscProgress {
	colorFrame[] = {0, 0, 0, 0};
	colorBar[] = {0.835, 0.462, 0.023, 1};
	colorBackground[] = {0,0,0,0};
}