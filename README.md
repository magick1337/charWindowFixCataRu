# charWindowFixCataRu
fix an format issue on ruRu locale wow cata classic 4.4.0

```
   --https://warcraft.wiki.gg/wiki/API_BreakUpLargeNumbers
   --https://warcraft.wiki.gg/wiki/API_format

   -- WHATS WRONG: 

      -- .../Blizzard_CharacterFrame/Cata/PaperDollFrame.lua
   
      function PaperDollFrame_SetAttackSpeed(statFrame, unit)
      local speed, offhandSpeed = UnitAttackSpeed(unit);

      -- !!!!! local displaySpeed = format("%.2F", speed); <---- RETURN A STRING WITH "," IN ruRU locale. example: ruRU = 3,09, enGB = 3.09
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
]]

