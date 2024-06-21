ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('anx-jobstar:getOnlineJobCount', function(source, cb, jobName)
    local xPlayers = ESX.GetPlayers()
    local jobCount = 0

    if Config.Debug then
        print("^2[Job Star] Server checking count for job:", jobName)
    end

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == jobName then
            jobCount = jobCount + 1
            if Config.Debug then
                print("^2[Job Star] Found player with job:", jobName)
            end
        end
    end

    if Config.Debug then
        print("^2[Job Star] Sending count to client:", jobName, jobCount)
    end
    cb(jobCount)
end)
