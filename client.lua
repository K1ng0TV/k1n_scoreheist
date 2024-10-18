
local policeCount = 0


ESX = exports["es_extended"]:getSharedObject()

function CountPolice(callback)
    ESX.TriggerServerCallback('k1n_scoreheist:countPolice', function(policeCount)
        if policeCount ~= nil then
            callback(policeCount) 
        else
            callback(0) 
        end
    end)
end


function OpenHeistMenu()
    CountPolice(function(policeCount)
        local options = {}

        for heist, data in pairs(Config.Heists) do
            if policeCount >= data.requiredPolice then
                table.insert(options, {
                    title = data.label,
                    icon = "check-circle",
                    description = "Potrzebna liczba policjantów: " .. data.requiredPolice,
                })
            else
                table.insert(options, {
                    title = data.label .. " - Niewystarczająca liczba policjantów",
                    icon = "times-circle",
                    description = "Potrzebna liczba policjantów: " .. data.requiredPolice .. ". Aktualna liczba policjantów: " .. policeCount,
                    disabled = true
                })
            end
        end

        lib.registerContext({
            id = 'heist_menu',
            title = 'Dostępność napadów',
            options = options
        })
        lib.showContext('heist_menu')
    end)
end


function RegisterHeistMenuKey()
    lib.addKeybind({
        name = 'open_heist_menu', 
        description = 'Otwórz menu napadów',
        defaultKey = 'Z',
        onPressed = function()
            OpenHeistMenu()
        end
    })
end

RegisterHeistMenuKey()
