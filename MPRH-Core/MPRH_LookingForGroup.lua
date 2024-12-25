-- MPRH_LookingForGroup.lua
-- Handles the creation and functionality of the Dungeon LFG MPRH table UI.

--#region Create locally and globally used variables.
local addonName, ns = ...
--#endregion

--#region Create and configure the LFG UI frame.
local mprhLfgFrame = CreateFrame("Frame", "MPRHLookingForGroupFrame", UIParent, "BasicFrameTemplate")
mprhLfgFrame:SetSize(150, 75)
mprhLfgFrame:SetPoint("RIGHT", 0, 0)
mprhLfgFrame:SetMovable(false)
mprhLfgFrame:EnableMouse(false)
mprhLfgFrame:SetFrameStrata("DIALOG")
mprhLfgFrame:Hide()

-- Create and configure the MPRH LFG frame title text.
local title = mprhLfgFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightMed2")
title:SetPoint("TOP", mprhLfgFrame, 0, -5)
title:SetText(ns.EXPANSION .. " " .. ns.SEASON .. " " .. addonName)


-----------------------------------------------------------------------------------------------------------------------
local frame = CreateFrame("Frame", "MythicPlusHelperFrame", UIParent, "BasicFrameTemplateWithInset")
frame:SetSize(650, 240)   -- Width, Height
frame:SetPoint("RIGHT", 0, 150) -- Center of the screen
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:SetFrameStrata("DIALOG")

-- Title for the frame
local title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
title:SetPoint("CENTER", frame.TitleBg, "CENTER", 0, 0)
title:SetText("The War Within Season 1 Mythic Plus Reward Helper")

local content = CreateFrame("Frame", nil, frame)
content:SetSize(frame:GetWidth(), frame:GetHeight())
content:SetPoint("CENTER", frame, "CENTER", 10, -30)

local rows = {}
local function CreateRow(parent, index, colData, isHeader)
   local row = CreateFrame("Frame", nil, parent)
   row:SetSize(frame:GetWidth() - 20, 20) -- Width, Height
   row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -((index - 1) * 20))
   
   for i, data in ipairs(colData) do
      local col = row:CreateFontString(nil, "OVERLAY", isHeader and "GameFontNormalLarge" or "GameFontNormal")
      
      col:SetPoint("LEFT", (i - 1) * 105, 0) -- Adjust spacing as needed
      col:SetText(data)
   end
   
   return row
end

-- Sample data
local data = {
   { "Level", "EoD iLvl", "Gear Track", "Crests", "Vault iLvl", "Gear Track" },
   { "+2", "597", "Champion", "Carved", "606", "Champion"},
   { "+3", "597", "Champion", "Carved", "610", "Hero"},
   { "+4", "600", "Champion", "Runed", "610", "Hero"},
   { "+5", "603", "Champion", "Runed", "613", "Hero"},
   { "+6", "606", "Champion", "Runed", "613", "Hero"},
   { "+7", "610", "Hero", "Runed", "616", "Hero"},
   { "+8", "610", "Hero", "Gilded", "619", "Hero"},
   { "+9", "613", "Hero", "Gilded", "619", "Hero"},
   { "+10", "613", "Hero", "Gilded", "623", "Mythic"},
}

-- Create rows for each set of data
for i, rowData in ipairs(data) do
   if i == 1 then
      rows[i] = CreateRow(content, i, rowData, true)
   else
      rows[i] = CreateRow(content, i, rowData, false)
   end
end



local function StyleRow(row, index)
   local bg = row:CreateTexture(nil, "BACKGROUND")
   bg:SetAllPoints(row)
   if index % 2 == 0 then
      bg:SetColorTexture(0.1, 0.1, 0.1, 0.5) -- Darker background for even rows
   else
      bg:SetColorTexture(0.2, 0.2, 0.2, 0.5) -- Slightly lighter background for odd rows
   end
end

-- Apply styling to all rows
for i, row in ipairs(rows) do
   StyleRow(row, i)
end

frame:Show()