## ISSUES WITH ruRU CATA CLIENT!
1. **.../Blizzard_CharacterFrame/Cata/PaperDollFrame.lua (char stats info)**
```
   --https://warcraft.wiki.gg/wiki/API_BreakUpLargeNumbers
   --https://warcraft.wiki.gg/wiki/API_format
   
      function PaperDollFrame_SetAttackSpeed(statFrame, unit)
      local speed, offhandSpeed = UnitAttackSpeed(unit);

      local displaySpeed = format("%.2F", speed); <---- RETURN A STRING WITH "," IN ruRU locale. example: ruRU = 3,09, enGB = 3.09
      if ( offhandSpeed ) then
         offhandSpeed = format("%.2F", offhandSpeed);
      end
      if ( offhandSpeed ) then
         displaySpeed =  BreakUpLargeNumbers(displaySpeed).." / ".. offhandSpeed;
      else
         displaySpeed =  BreakUpLargeNumbers(displaySpeed);
      end
      PaperDollFrame_SetLabelAndText(statFrame, WEAPON_SPEED, displaySpeed, false, speed);

      statFrame.tooltip = HIGHLIGHT_FONT_COLOR_CODE..format(PAPERDOLLFRAME_TOOLTIP_FORMAT, ATTACK_SPEED).." "..displaySpeed..FONT_COLOR_CODE_CLOSE;
      
      statFrame:Show();
      end
```
*STACK TRACE INFO:*
```
226x ...dOns/Blizzard_CharacterFrame/Cata/PaperDollFrame.lua:1203: Usage: BreakUpLargeNumbers(number[, natural])

[string  "=[C]"]: in  function `BreakUpLargeNumbers'

[string  "@Blizzard_CharacterFrame/Cata/PaperDollFrame.lua"]:1203: in  function `PaperDollFrame_SetAttackSpeed'

[string  "@Blizzard_CharacterFrame/Cata/PaperDollFrame.lua"]:171: in  function `updateFunc'

[string  "@Blizzard_CharacterFrame/Cata/PaperDollFrame.lua"]:2780: in  function `PaperDollFrame_UpdateStatCategory'

[string  "@Blizzard_CharacterFrame/Cata/PaperDollFrame.lua"]:2830: in  function `PaperDollFrame_UpdateStats'

[string  "@Blizzard_CharacterFrame/Cata/PaperDollFrame.lua"]:2963: in  function `PaperDoll_InitStatCategories'

[string  "@Blizzard_CharacterFrame/Cata/PaperDollFrame.lua"]:2233: in  function <...dOns/Blizzard_CharacterFrame/Cata/PaperDollFrame.lua:2228>

[string  "=[C]"]: ?

[string  "=[C]"]: ?

[string  "=[C]"]: in  function `Show'

[string  "@Blizzard_UIParentPanelManager/Classic/UIParentPanelManager_Shared.lua"]:606: in  function `SetUIPanel'

[string  "@Blizzard_UIParentPanelManager/Classic/UIParentPanelManager_Shared.lua"]:451: in  function `ShowUIPanel'

[string  "@Blizzard_UIParentPanelManager/Classic/UIParentPanelManager_Shared.lua"]:319: in  function <...PanelManager/Classic/UIParentPanelManager_Shared.lua:315>

[string  "=[C]"]: in  function `SetAttribute'

[string  "@Blizzard_UIParentPanelManager/Classic/UIParentPanelManager_Shared.lua"]:1095: in  function `ShowUIPanel'

[string  "@Blizzard_CharacterFrame/Cata/CharacterFrame.lua"]:45: in  function `ToggleCharacter'

[string  "TOGGLECHARACTER0"]:1: in  function <[string  "TOGGLECHARACTER0"]:1>

  

Locals:

(*temporary) =  "2,88"
```
2. **...Blizzard_InspectUI/Classic/Localization.lua (inspect talent)**
```
local function LocalizeInspectTabs_zh()
	for i=1, (InspectFrame.numTabs or 0) do
		local tabName = "InspectFrameTab"..i;
		_G[tabName.."Text"]:SetPoint("CENTER", tabName, "CENTER", 0, 5);
	end
end

local l10nTable = {
	deDE = {},
	enGB = {},
	enUS = {},
	esES = {},
	esMX = {},
	frFR = {},
	itIT = {},
	koKR = {},
	ptBR = {},
	ptPT = {},
	ruRU = {
		localize = function()
			--Adjust spec font so it doesn't overflow the window
			SpecializationSpecName:SetFontObject(GameFontNormalHuge); <---- ON CATA CLASSIC SpecializationSpecName FRAME ALWAYS IS nil (even in enGB locale). On retail its a frame. 
		end,
	},
	zhCN = {
		localize = function()
			LocalizeInspectTabs_zh();
			InspectTalentFrameSpentPoints:SetPoint("BOTTOMLEFT", 30, 85); -- +0, -1 
		end,
	},
	zhTW = {
		localize = function()
			LocalizeInspectTabs_zh();
			InspectTalentFrameSpentPoints:SetPoint("BOTTOMLEFT", 30, 83); -- +0, -3
		end,
	},
};

SetupLocalization(l10nTable);

```
*STACK TRACE INFO:*
```
9x ...eBlizzard_InspectUI/Classic/Localization.lua:22: attempt to index global 'SpecializationSpecName' (a nil value)
[string "@Blizzard_InspectUI/Classic/Localization.lua"]:22: in function `localizeFn'
[string "@Blizzard_SharedXML/Shared/LocalizationMachinery.lua"]:7: in function <.../Blizzard_SharedXML/Shared/LocalizationMachinery.lua:1>
[string "@Blizzard_SharedXML/Shared/LocalizationMachinery.lua"]:30: in function `SetupLocalization'
[string "@Blizzard_InspectUI/Classic/Localization.lua"]:39: in main chunk
[string "=[C]"]: ?
[string "=[C]"]: in function `LoadAddOn'
[string "@Blizzard_UIParent/Cata/UIParent.lua"]:247: in function `UIParentLoadAddOn'
[string "@Blizzard_UIParent/Cata/UIParent.lua"]:294: in function `InspectFrame_LoadUI'
[string "@Blizzard_UIParent/Cata/UIParent.lua"]:664: in function `InspectUnit'
[string "@Blizzard_UnitPopupShared/UnitPopupSharedButtonMixins.lua"]:200: in function `OnClick'
[string "@Blizzard_UnitPopupShared/UnitPopupShared.lua"]:151: in function `func'
[string "@Blizzard_SharedXML/Classic/UIDropDownMenu.lua"]:968: in function `UIDropDownMenuButton_OnClick'
[string "*UIDropDownMenuTemplates.xml:148_OnClick"]:1: in function <[string "*UIDropDownMenuTemplates.xml:148_OnClick"]:1>

Locals:
(*temporary) = nil
(*temporary) = nil
(*temporary) = nil
(*temporary) = "attempt to index global 'SpecializationSpecName' (a nil value)"

```
3. **...Blizzard_Collections/Classic/Localization.lua (collection frame)**
```
local l10nTable = {
	deDE = {},
	enGB = {},
	enUS = {},
	esES = {},
	esMX = {},
	frFR = {},
	itIT = {},
	koKR = {},
	ptBR = {},
	ptPT = {},
	ruRU = {
		localize = function()
			--Adjust text widths for long Russian words
			PetJournalHealPetButtonSpellName:SetWidth(90); <--- ON CATA CLASSIC PetJournalHealPetButtonSpellName always is nil (even in enGB locale). On retail its a frame. 
		end,
	},
	zhCN = {},
	zhTW = {},
};

SetupLocalization(l10nTable);
```
*STACK TRACE INFO:*
```
11x Blizzard_Collections/Classic/Localization.lua:15: attempt to index global 'PetJournalHealPetButtonSpellName' (a nil value)
[string "@Blizzard_Collections/Classic/Localization.lua"]:15: in function `localizeFn'
[string "@Blizzard_SharedXML/Shared/LocalizationMachinery.lua"]:7: in function <.../Blizzard_SharedXML/Shared/LocalizationMachinery.lua:1>
[string "@Blizzard_SharedXML/Shared/LocalizationMachinery.lua"]:30: in function `SetupLocalization'
[string "@Blizzard_Collections/Classic/Localization.lua"]:22: in main chunk
[string "=[C]"]: ?
[string "=[C]"]: in function `LoadAddOn'
[string "@Blizzard_UIParent/Cata/UIParent.lua"]:247: in function `UIParentLoadAddOn'
[string "@Blizzard_UIParent/Cata/UIParent.lua"]:395: in function `CollectionsJournal_LoadUI'
[string "@Blizzard_UIParent/Cata/UIParent.lua"]:606: in function `SetCollectionsJournalShown'
[string "@Blizzard_UIParent/Cata/UIParent.lua"]:600: in function `ToggleCollectionsJournal'
[string "@Blizzard_ActionBar/Cata/MainMenuBarMicroButtons.lua"]:503: in function <.../Blizzard_ActionBar/Cata/MainMenuBarMicroButtons.lua:501>

Locals:
(*temporary) = nil
(*temporary) = nil
(*temporary) = nil
(*temporary) = "attempt to index global 'PetJournalHealPetButtonSpellName' (a nil value)"
```
