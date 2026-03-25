local LunaAuth = {}

local URLs = {
    Week = "https://raw.githubusercontent.com/omerkasd/LunaAuthSystem/refs/heads/main/Week.txt",
    Month = "https://raw.githubusercontent.com/omerkasd/LunaAuthSystem/refs/heads/main/Month.txt",
    LifeTime = "https://raw.githubusercontent.com/omerkasd/LunaAuthSystem/refs/heads/main/LifeTime.txt"
}

local DISCORD = "https://discord.gg/BbuQdkvvsz"

function LunaAuth.Check(package)
    local playerID = tostring(game:GetService("Players").LocalPlayer.UserId)
    local url = URLs[package]
    if not url then return false end

    local success, result = pcall(function()
        return game:HttpGet(url)
    end)

    if not success then return false end

    for id in result:gmatch("[^\n]+") do
        if id:gsub("%s+", "") == playerID then
            return true
        end
    end

    return false
end

function LunaAuth.Deny()
    local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

    local Window = Rayfield:CreateWindow({
        Name = "LunaVex",
        LoadingTitle = "LunaVex",
        LoadingSubtitle = "by omerkasd",
        Theme = "Default",
        DisableRayfieldPrompts = true,
    })

    local Tab = Window:CreateTab("Erişim Engellendi", "lock")
    Tab:CreateLabel("You do not have permission to open this script.")

    Tab:CreateButton({
        Name = "Discord",
        Callback = function()
            setclipboard(DISCORD)
            Rayfield:Notify({
                Title = "Kopyalandı",
                Content = "Discord linki panoya kopyalandı.",
                Duration = 4,
            })
        end,
    })
end

return LunaAuth
