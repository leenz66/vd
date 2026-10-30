task.spawn(function()
    local ALLOWED_PLACE_ID = 93978595733734 
    local url = "https://api.luarmor.net/files/v4/loaders/82419a6df8b5b0d7c91a6affe9f3fb04.lua"

    if game.PlaceId ~= ALLOWED_PLACE_ID then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Akses Ditolak",
                Text = "Only Violence Discrtic!",
                Duration = 5
            })
        end)
        warn("[Leenz Hub] Akses Ditolak: Kamu bukan di Violence Discrtic!")
        return 
    end

    task.wait(0.1) 
    
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if success and response then
        local func, loadErr = loadstring(response)
        
        if func then
            local execSuccess, execErr = pcall(func)
            if not execSuccess then
                warn("[VD Script] Error: " .. tostring(execErr))
            end
        else
            warn("[VD Script] Gagal compile: " .. tostring(loadErr))
        end
    else
        warn("[VD Script] Gagal download script. Cek koneksi lu!")
    end
end)
