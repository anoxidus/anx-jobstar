ESX = exports["es_extended"]:getSharedObject()
local activeStars = 0

function DisplayJobStars(starLevel)
    SendNUIMessage({
        type = 'updateStars',
        stars = starLevel
    })
end

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    while true do
        Citizen.Wait(7500)

        local totalOfficers = 0

        for _, jobName in ipairs(Config.Jobs) do
            ESX.TriggerServerCallback('anx-jobstar:getOnlineJobCount', function(count) 
                totalOfficers = totalOfficers + count

                local stars = 0
                for level, requiredCount in ipairs(Config.StarLevels) do
                    if totalOfficers >= requiredCount then
                        stars = level
                    else
                        break
                    end
                end
                DisplayJobStars(stars)
            end, jobName) 
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        if SendNUIMessage({ 
            type = 'setConfig',
            position = Config.Position,
            starSize = Config.StarSize
        }) then
            break
        end
    end
end)

