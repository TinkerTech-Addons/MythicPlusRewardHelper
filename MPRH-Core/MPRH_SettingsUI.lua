-- MPRH-SettingsUI.lua
-- Handles the creation and functionality of the settings UI.

--#region Create locally and globally used variables
local addonName, ns = ...

if not MPRH_Settings then
    MPRH_Settings = {}
end
--#endregion

--#region Create and configure the settings frame
local settingsFrame = CreateFrame("Frame", "MPRHSettings", UIParent, "BasicFrameTemplate")
settingsFrame:SetSize(275, 300)
settingsFrame:SetPoint("CENTER", 0, 150)
settingsFrame:SetMovable(true)
settingsFrame:EnableMouse(true)
settingsFrame:SetFrameStrata("DIALOG")
settingsFrame:Hide()
--#endregion

-- Create and configure the settings frame title text
local title = settingsFrame:CreateFontString("settingsFrameTitle", "OVERLAY", "GameFontHighlightMed2")
title:SetPoint("TOPLEFT", settingsFrame, 20, -5)
title:SetText("|cEBA0FCFFMythic Plus Reward Helper|r Settings")

-- Create and configure the settings frame version text
local version = settingsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightMed2")
version:SetPoint("TOPRIGHT", settingsFrame, -35, -5)
version:SetText(ns.addonVersion)

--#region Local function to load saved settings
local function loadCheckboxSetting(checkbox, settingName)
    if MPRH_Settings[settingName] == nil then
        MPRH_Settings[settingName] = false
    end
    checkbox:SetChecked(MPRH_Settings[settingName])
end
--#endregion

--#region Local function to handle checkbox clicks
local function onCheckboxClick(self, checkboxSettingName)
    local settingName = checkboxSettingName
    MPRH_Settings[settingName] = self:GetChecked()
    ns.loadSettings()
end
--#endregion

--#region Local function to create setting's headers
local function createSettingHeader(name, anchorPoint, x, y)
    local settingHeader = settingsFrame:CreateFontString("settingHeaderLabel", "OVERLAY", "GameFontHighlightLarge2")
    settingHeader:SetText(name)
    settingHeader:SetPoint(anchorPoint, x + 32, y - 5)
end
--#endregion

--#region Local function to create setting's checkboxes
local function createSettingCheckbox(name, parent, anchorPoint, x, y, checkboxSettingName)
    local checkbox = CreateFrame("CheckButton", name, parent, "UICheckButtonTemplate")
    checkbox:SetPoint(anchorPoint, x, y)

    local checkboxLabel = checkbox:CreateFontString("checkboxLabel", "HIGHLIGHT", "GameFontHighlightMed2")
    checkboxLabel:SetText(name)
    checkboxLabel:SetPoint("LEFT", 35, 0)

    checkbox:SetFontString(checkboxLabel)

    loadCheckboxSetting(checkbox, checkboxSettingName)

    checkbox:SetScript("OnClick", function(self)
        onCheckboxClick(self, checkboxSettingName)
    end)

    return checkbox
end
--#endregion

--#region Namespace on initialize addon function
function ns.OnInitialize()
    local generalSettings = createSettingHeader("Keystone Tooltip Settings", "TOPLEFT", -15, -84)
    local rewardItemLevel = createSettingCheckbox("Reward Item Level", settingsFrame, "TOPLEFT", 35, -114)
    local upgradeTrack = createSettingCheckbox("Item Upgrade Track", rewardItemLevel, "LEFT", 0, -30)
    local upgradeCrestAwarded = createSettingCheckbox("Crest Type Awarded", upgradeTrack, "LEFT", 0, -30)
end

--#endregion

--#region Namespace show settings frame function
function ns.ShowSettingsFrame()
    settingsFrame:Show()
end

--#endregion
