-- MPRH-KeystoneTooltip.lua

-- Create localy used cariables
local addonName, ns = ...

-- Function to add reward item levels on Mythic+ keystone item tooltip
function ns.OnKeystoneTooltip(tooltip, data)
    local keystoneDisplayEnabled = MPRH_SETTINGS["KeystoneDisplayEnabled"]
    
    if string.match(data.lines[1].leftText, "Keystone:") and keystoneDisplayEnabled then
        if tooltip == GameTooltip then
            local keystoneLevel = tonumber(string.sub(data.lines[2].leftText, 14, 16)) or 0
            local weeklyRewardLevel, endOfRunRewardLevel = C_MythicPlus.GetRewardLevelForDifficultyLevel(keystoneLevel)

            tooltip:AddLine(" ")
            tooltip:AddDoubleLine("End of Dungeon Reward ilvl", endOfRunRewardLevel, 1, 0.85, 0, 1, 1, 1)
            tooltip:AddDoubleLine("Great Vault Reward ilvl", weeklyRewardLevel, 1, 0.85, 0, 1, 1, 1)
        end
    end
end
