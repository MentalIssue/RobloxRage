repeat task.wait() until game.IsLoaded
repeat task.wait() until game.GameId ~= 0

if RobloxRage and RobloxRage.Loaded then
    RobloxRage.Utilities.UI:Notification({
        Title = "I Miss The Rage",
        Description = "Script already running!",
        Duration = 5
    }) return
end

--[[if RobloxRage and (RobloxRage.Game and not RobloxRage.Loaded) then
    RobloxRage.Utilities.UI:Notification({
        Title = "I Miss The Rage",
        Description = "Something went wrong!",
        Duration = 5
    }) return
end]]

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
    Title = "I Miss The Rage",
    Description = RobloxRage.Game.Name .. " loaded!",
    Duration = NotificationTime
}) RobloxRage.Loaded = true
