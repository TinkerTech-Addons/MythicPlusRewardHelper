-- MPRH-Settings.lua

-- Create localy used variables
local addonName, ns = ...
ns.addonTitle = C_AddOns.GetAddOnMetadata("MythicPlusRewardHelper", "Title")

-- Create and configure settings GUI
local frame = CreateFrame("Frame", "MPRH-Settings", UIParent, "BasicFrameTemplate")
frame:Hide()

frame:SetSize(375, 400)
frame:SetPoint("CENTER")
frame:SetMovable(true)
frame:EnableMouse(true)

frame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)

frame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)

-- Create settings GUI title
local title = frame:CreateFontString("MPRH-SettingsTitle", "OVERLAY", "GameFontHighlightHuge2")
title:SetPoint("TOP", frame, "TOP", 0, -3.5)
title:SetText(ns.addonTitle .. " Settings")

-- Create settings GUI section header
local displayHeader = frame:CreateFontString("MPRH-DisplayHeader", "OVERLAY", "GameFontHighlightHuge2")
displayHeader:SetPoint("TOPLEFT", 15, -40)
displayHeader:SetText("Display Options")

-- Create display rewards on keystone checkbox option
local keystoneDisplayCheckbox = CreateFrame("CheckButton", "MPRH-KeystoneDisplay", frame, "UICheckButtonTemplate")
local keystoneDisplayCheckboxText = keystoneDisplayCheckbox:CreateFontString("MPRH-KeystoneDisplayText", "HIGHLIGHT", "GameFontHighlightMed2")
keystoneDisplayCheckboxText:SetText("Show Reward Item Level on Keystone Item Tooltip")
keystoneDisplayCheckboxText:SetPoint("LEFT", 30, 0)
keystoneDisplayCheckbox:SetSize(30, 30)
keystoneDisplayCheckbox:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -65)
keystoneDisplayCheckbox:SetFontString(keystoneDisplayCheckboxText)
keystoneDisplayCheckbox:SetScript("OnClick", function(self)
    ns.ToggleKeystoneDisplay(self:GetChecked())
    ns.SendAddonLogMessage("Display Settings Changed - Keystone")
end)
function ns.ToggleKeystoneDisplay(checked)
    if checked then
        MPRH_SETTINGS["KeystoneDisplayEnabled"] = true
    else
        MPRH_SETTINGS["KeystoneDisplayEnabled"] = false
    end
end

-- Functions to show/hide the settings frame
function ns.ShowSettingsFrame()
    frame:Show()
end

function ns.HideSettingsFrame()
    frame:Hide()
end

-- Function to initialize Mythic Plus Reward Helper addon
function ns.OnInitialize()
    if not MPRH_SETTINGS then
        MPRH_SETTINGS = {}
    end

    local keystoneDisplayEnabled = MPRH_SETTINGS["KeystoneDisplayEnabled"]

    if keystoneDisplayEnabled then
        keystoneDisplayCheckbox:SetChecked(true)
    else
        keystoneDisplayCheckbox:SetChecked(false)
    end

    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ns.OnKeystoneTooltip)
    hooksecurefunc("LFGListUtil_SetSearchEntryTooltip", ns.UpdatePremadeGroupsTooltip)
end

-- Register events
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("CHAT_MSG_ADDON_LOGGED")

-- Handle events
frame:SetScript("OnEvent", function(_, event, arg1, arg2)
    if event == "ADDON_LOADED" and arg1 == addonName then
        ns.successfulRequest = C_ChatInfo.RegisterAddonMessagePrefix("MPRH-")
        ns.OnInitialize()
    end

    if event == "PLAYER_LOGIN" then
        ns.BuildMythicPlusRewardTable()
    end

    -- if event == "CHAT_MSG_ADDON_LOGGED" and arg1 == "MPRH-" then
        
    -- end
end)