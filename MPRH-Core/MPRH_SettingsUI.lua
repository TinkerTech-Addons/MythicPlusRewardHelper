-- MPRH_SettingsUI.lua
-- Handles the creation and functionality of the settings UI.

--#region Create locally and globally used variables.
local addonName, ns = ...
--#endregion

--#region Create and configure the settings frame.
local settingsFrame = CreateFrame("Frame", "MPRHSettings", UIParent, "BasicFrameTemplate")
settingsFrame:SetSize(450, 250)
settingsFrame:SetPoint("CENTER", 0, 150)
settingsFrame:SetMovable(true)
settingsFrame:EnableMouse(true)
settingsFrame:SetFrameStrata("DIALOG")
settingsFrame:Hide()

-- Create and configure the settings frame title text.
local title = settingsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightMed2")
title:SetPoint("TOPLEFT", settingsFrame, 20, -5)
title:SetText("|cDBB670FFMythic Plus Reward Helper|r")

-- Create and configure the settings frame version text.
local version = settingsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightMed2")
version:SetPoint("TOPRIGHT", settingsFrame, -35, -5)
version:SetText(ns.addonVersion)
--#endregion

--#region Create settingsFrame scripts.
-- Allows the settingsFrame to be moved around
settingsFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)

-- Stops the settingsFrame from moving around
settingsFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)
--#endregion

--#region Create a namespace function to show the settingFrame.
function ns.ShowSettingsFrame()
    settingsFrame:Show()
end
--#endregion
