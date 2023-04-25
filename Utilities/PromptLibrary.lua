local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local ErrorPrompt = getrenv().require(CoreGui.RobloxGui.Modules.ErrorPrompt)
local function NewScreen(ScreenName)
    local Screen = Instance.new("ScreenGui")
    Screen.Name = ScreenName
    Screen.ResetOnSpawn = false
    Screen.IgnoreGuiInset = true
    sethiddenproperty(Screen,
    "OnTopOfCoreBlur",true)
    --syn.protect_gui(Screen)
    Screen.Parent = CoreGui
    return Screen
end

return function(Title,Message,Buttons,RichText)
    local Screen = NewScreen("Prompt")
    local Prompt = ErrorPrompt.new("Default",{
        MessageTextScaled = false,
        PlayAnimation = false,
        HideErrorCode = true
    })
    if RichText then
        Prompt._frame.MessageArea.ErrorFrame.ErrorMessage.RichText = true
    end

    for Index,Button in pairs(Buttons) do
        local Old = Button.Callback
        Button.Callback = function(...)
            RunService:SetRobloxGuiFocused(false)
            Prompt:_close()
            Screen:Destroy()
            return Old(...)
        end
    end

    Prompt:setErrorTitle(Title)
    Prompt:updateButtons(Buttons)
    Prompt:setParent(Screen)
    RunService:SetRobloxGuiFocused(true)
    Prompt:_open(Message)
    return Prompt,Screen
end

--[[
-- Example
local PromptLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Role34/RobloxRage/main/Utilities/PromptLibrary.lua"))()
PromptLib("Hello!","Would You Like To Be My Friend?",{
    {Text = "Yes",LayoutOrder = 0,Primary = true,Callback = function()
        print(":D")
    end},
    {Text = "No",LayoutOrder = 1,Primary = false,Callback = function()
        print(":(")
    end}
})

or 

if game.PlaceVersion > "print(game.PlaceVersion)" then
    local PromptLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Role34/RobloxRage/main/Utilities/PromptLibrary.lua"))()
    PromptLib("Hello!","Would You Like To Be My Friend?",{
        {Text = "Yes",LayoutOrder = 0,Primary = true,Callback = function()
            print(":D")
        end},
        {Text = "No",LayoutOrder = 1,Primary = false,Callback = function()
            print(":(")
        end}
    }) repeat task.wait(1) until Loaded
end

new

local Loaded,PromptLib = false,loadstring(game:HttpGet("https://raw.githubusercontent.com/Role34/RobloxRage/main/Utilities/PromptLibrary.lua"))()
if identifyexecutor() ~= "Synapse X" then
    PromptLib("Unsupported executor","Synapse X only for safety measures\nYou are at risk of getting autoban\nAre you sure you want to load Parvus?",{
        {Text = "Yes",LayoutOrder = 0,Primary = false,Callback = function() Loaded = true end},
    }) repeat task.wait(1) until Loaded
end

]]