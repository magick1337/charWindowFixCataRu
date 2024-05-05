if GetLocale() == "ruRU" then
   local ADDON_NAME = ...;
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
         return x;
      end; 
   end;
   print("Исправленное окно персонажа загружено.|n", ADDON_NAME);
   
   if not SpecializationSpecName and not PetJournalHealPetButtonSpellName then
      print("Применено временное исправление окна коллекции, а так же окна талантов другого игрока.|n", ADDON_NAME)
      CreateFrame("Frame"):CreateFontString("PetJournalHealPetButtonSpellName");
      CreateFrame("Frame"):CreateFontString("SpecializationSpecName");
   end;

end;