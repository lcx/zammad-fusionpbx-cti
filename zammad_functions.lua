log = function(name, logvalue)
  local level = "debug"
  (freeswitch.consoleLog)(level, "------->" .. name .. ".....: " .. tostring(logvalue) .. "<-------------\n")
end


