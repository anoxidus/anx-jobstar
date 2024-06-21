local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/anoxidus/anx-jobstar/main/version.txt', function(err, newestVersion, headers) -- yes its with an TXT file, why do you even care? it works so stfu
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
        local resourcename = "ANX-JOBSTAR"
        local howto = "please download the latest file via https://github.com/anoxidus/anx-jobstar/releases"
        
        if not newestVersion then
          print("^1Error: Unable to check for latest version.")
          return
        end
      
        if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then
          print("^6✅  You are running the latest version of " .. resourcename .. ".^7")
        else
          print("")
          print("^4ANX JOBSTAR  ")
          print("")
          print("^3Version Check:^7")
          print("^2Current^7: " .. currentVersion .. " ❌")
          print("^2Latest^7: " .. newestVersion .. "" )
          print("^1Update available: " .. howto .. "^7")
          print("")
        end
    end)
end

CheckVersion()
