ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('k1n_scoreheist:countPolice', function(source, cb)
    local xPlayers = ESX.GetPlayers()
    local policeCount = 0

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            policeCount = policeCount + 1
        end
    end

    cb(policeCount)
end)