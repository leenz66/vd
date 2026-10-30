task.spawn(function()
    local placeId = 93978595733734
    local url = "https://api.luarmor.net/files/v4/loaders/82419a6df8b5b0d7c91a6affe9f3fb04.lua"

    if game.PlaceId ~= placeId then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Akses Ditolak",
                Text = "Only Violence Discrtic!",
                Duration = 5
            })
        end)
        return warn("Akses Ditolak: Kamu bukan di Violence Discrtic!")
    end

    task.wait(0.1)

    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if not success or not response then
        return warn("Gagal Execute Script. Cek koneksi lu!")
    end

    local func, loadError = loadstring(response)

    if not func then
        return warn("Gagal compile: " .. tostring(loadError))
    end

    local execSuccess, execError = pcall(func)

    if not execSuccess then
        warn("Script error: " .. tostring(execError))
    end
end)
