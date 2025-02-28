-- MPRH-DungeonFinder.lua

-- Create localy used variables
local addonName, ns = ...

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
