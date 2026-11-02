task.spawn(function()
    local success, err = pcall(function()
        local url = "https://api.luarmor.net/files/v4/loaders/5a691015748630a5162a4b2c19492c01.lua"
        local scriptContent = game:HttpGet(url)
        local func = loadstring(scriptContent)
        if func then
            func()
        end
    end)
    if not success then
        warn("[Loadstring] Gagal memuat script: " .. tostring(err))
    end
end)