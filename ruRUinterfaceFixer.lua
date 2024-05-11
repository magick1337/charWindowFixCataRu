if GetLocale() == "ruRU" then
   local currBuildString = select(2, GetBuildInfo())
   local currBuildNumber = tonumber(currBuildString)
   if currBuildNumber > 54647 then
      if not BULNFormatFix then
         BULNFormatFix = BreakUpLargeNumbers;
         BreakUpLargeNumbers = function(x)
            if x and type(x) == "string" then
               if string.find(x, ",", 1, true) then
                  local fix = string.gsub(x, ",", ".")
                  x = tonumber(fix)
               else
                  x = tonumber(x)
               end;
            end;

         if UnitClassBase("player") == "ROGUE" or UnitClassBase("player") == "DRUID" and GetShapeshiftForm() == 3 then
            return BULNFormatFix(x);
         else
            return x;
         end;
         
      end;
   end;
      print("Исправленное окно персонажа загружено.|n", "charWindowFixCataRu");
   end;
   
   if not SpecializationSpecName and not PetJournalHealPetButtonSpellName then
      print("Применено временное исправление окна коллекции, а так же окна талантов другого игрока.|n", "charWindowFixCataRu")
      CreateFrame("Frame"):CreateFontString("PetJournalHealPetButtonSpellName");
      CreateFrame("Frame"):CreateFontString("SpecializationSpecName");
   end;
end;
