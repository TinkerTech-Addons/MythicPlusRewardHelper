-- MPRH-SettingsUI.lua

--#region Create locally and globaly used variables
local addonName, ns = ...

if not MPRH_Settings then
    MPRH_Settings = {}
end
--#endregion

--#region Create base settings frame
local settingsFrame = CreateFrame("Frame", "MPRH Settings", UIParent, "BasicFrameTemplate")
settingsFrame:Hide()
settingsFrame:SetPoint("CENTER", 0, 150)
settingsFrame:SetMovable(true)
settingsFrame:EnableMouse(true)
settingsFrame:SetFrameStrata("DIALOG")
settingsFrame:SetSize(375, 400)
--#endregion

--#region Settings frame scripts that allow it to be movable
settingsFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)

settingsFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMoving()
    end
end)
--#endregion

--#region Create and display the settings frame title
local title = settingsFrame:CreateFontString("settingsFrameTitle", "OVERLAY", "GameFontHighlightMed2")
title:SetPoint("TOP", settingsFrame, 0, -4)
title:SetText("Mythic Plus Reward Helper Settings")
--#endregion

--#region Create and display the settings frame short description
local description = settingsFrame:CreateFontString("settingsFrameDescription", "OVERLAY", "GameFontHighlightMed2")
description:SetPoint("TOP", 15, -40)
description:SetSize(325, 0)
description:SetWordWrap(true)
description:SetText("Toggle on/off MythicPlusRewardHelper settings")
description:SetJustifyH("LEFT")
--#endregion

--#region Local function to load saved settings
local function loadCheckboxSetting(checkbox, settingName)
    if MPRH_Settings[settingName] == nil then
        MPRH_Settings[settingName] = false
    end
    checkbox:SetChecked(MPRH_Settings[settingName])
end
--#endregion

--#region Local function to handle checkbox clicks
local function onCheckboxClick(self, settingName)
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
    local generalSettings = createSettingHeader("Keystone Tooltip Settings", "TOPLEFT", 17, -84)
    local rewardItemLevel = createSettingCheckbox("Reward Item Level", settingsFrame, "TOPLEFT", 35, -114)
end

--#endregion

--#region Namespace show settings frame function
function ns.ShowSettingsFrame()
    settingsFrame:Show()
end

--#endregion
