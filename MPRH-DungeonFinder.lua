-- MPRH-DungeonFinder.lua

-- Create localy used variables
local addonName, ns = ...
local seasonID = C_MythicPlus.GetCurrentSeason()
local MYTHIC_PLUS_DUNGEONS = {
    [1] = "Black Rock Hold",
    [2] = "The Everbloom",
    [3] = "Darkheart Thicket",
    [4] = "Waycrest Manor",
    [5] = "Atal'Dazar",
    [6] = "Throne of the Tides",
    [7] = "Dawn of the Infinite: Galakrond's Fall",
    [8] = "Dawn of the Infinite: Murozond's Rise"
}
local MYTHIC_PLUS_SEASON_MAP = {
    [1] = "Battle for Azeroth Season 1",
    [2] = "Battle for Azeroth Season 2",
    [3] = "Battle for Azeroth Season 3",
    [4] = "Battle for Azeroth Season 4",
    [5] = "Shadowlands Season 1",
    [6] = "Shadowlands Season 2",
    [7] = "Shadowlands Season 3",
    [8] = "Shadowlands Season 4",
    [9] = "Dragonflight Season 1",
    [10] = "Dragonflight Season 2",
    [11] = "Dragonflight Season 3"
}

-- Create and configure Mythic Plus Reward table frame
local frame = CreateFrame("GameTooltip", "MPRH-LFGDungeonRewardFrame", UIParent, "GameTooltipTemplate")
frame:Hide()

-- Functions to show/hide the table frame
function ns.ShowLFGDungeonRewardFrame()
    frame:Show()
end

function ns.HideLFGDungeonRewardFrame()
    frame:Hide()
end

-- Function to dynamically create the Mythic Plus Reward Table.
function ns.BuildMythicPlusRewardTable()
    table.insert(MYTHIC_PLUS_REWARDS_TABLE, { "Keystone Level", "End of Dungeon Item Level", "Great Vault Item Level" })
    for i = 2, 20 do
        local weeklyRewardLevel, endOfRunRewardLevel = C_MythicPlus.GetRewardLevelForDifficultyLevel(i)
        table.insert(MYTHIC_PLUS_REWARDS_TABLE, { i, endOfRunRewardLevel, weeklyRewardLevel })
    end
end

-- Function to check if a value is in a table
function IsInTable(value, tbl)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

function ns.UpdatePremadeGroupsTooltip(tooltip, data)
    print(type(tooltip))
    local searchResultData = C_LFGList.GetSearchResultInfo(data)
    local leaderDungeonScoreInfo = searchResultData["leaderDungeonScoreInfo"]
    if leaderDungeonScoreInfo ~= nil and leaderDungeonScoreInfo["mapName"] ~= "" and IsInTable(leaderDungeonScoreInfo["mapName"], MYTHIC_PLUS_DUNGEONS) then
        print("testing")
    end
end
