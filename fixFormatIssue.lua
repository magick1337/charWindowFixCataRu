if not BULNFormatFix then 
   BULNFormatFix = BreakUpLargeNumbers;
   BreakUpLargeNumbers = function(x) 
      if x and type(x) == "string" then
         if string.find(x, ",", 1, true) then
            fix = string.gsub(x, ",", ".")
            x = tonumber(fix)
         else
            x = tonumber(x)
         end;
      end; 
      return x;
   end; 
end;