local frame = CreateFrame("Frame", "MythicPlusHelperFrame", UIParent, "BasicFrameTemplateWithInset")
frame:SetSize(300, 200)                      -- Width, Height
frame:SetPoint("CENTER", UIParent, "CENTER") -- Center of the screen
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

-- Title for the frame
local title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
title:SetPoint("CENTER", frame.TitleBg, "CENTER", 0, 0)
title:SetText("Mythic+ Table")


local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", 10, -30)
scrollFrame:SetPoint("BOTTOMRIGHT", -30, 10)

local content = CreateFrame("Frame", nil, scrollFrame)
content:SetSize(260, 400) -- Set this larger than the frame for scrolling
scrollFrame:SetScrollChild(content)


local rows = {}
local function CreateRow(parent, index, colData)
    local row = CreateFrame("Frame", nil, parent)
    row:SetSize(260, 20) -- Width, Height
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -((index - 1) * 20))

    for i, data in ipairs(colData) do
        local col = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        col:SetPoint("LEFT", (i - 1) * 80, 0) -- Adjust spacing as needed
        col:SetText(data)
    end

    return row
end

-- Sample data
local data = {
    { "Level", "Time",   "iLvl" },
    { "2",     "30 min", "350" },
    { "10",    "35 min", "400" },
    { "15",    "40 min", "430" },
}

-- Create rows for each set of data
for i, rowData in ipairs(data) do
    rows[i] = CreateRow(content, i, rowData)
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


local function AddRowInteraction(row)
    row:SetScript("OnEnter", function(self)
        self:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background" })
        self:SetBackdropColor(0.3, 0.3, 0.3, 0.8)
    end)
    row:SetScript("OnLeave", function(self)
        self:SetBackdrop(nil)
    end)
end

for _, row in ipairs(rows) do
    AddRowInteraction(row)
end

frame:Show()
