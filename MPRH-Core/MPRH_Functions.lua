-- MPRH_Functions.lua
local addonName, ns = ...

function ns.buildTooltip(keystone_level, tooltip)
    if keystone_level > ns.SEASON_MAX_KEYSTONE_LEVEL then
        keystone_level = ns.SEASON_MAX_KEYSTONE_LEVEL
    end

    local keystone_data = ns.MPRH_DATA[keystone_level - 1]

    -- Extract RGB values and convert them to a hex string
    -- End of Dungeon
    local EoD_Color = string.format("|cff%02x%02x%02x", keystone_data[2].r * 255, keystone_data[2].g * 255,
        keystone_data[2].b * 255)

    -- Great Vault
    local GV_Color = string.format("|cff%02x%02x%02x", keystone_data[6].r * 255, keystone_data[6].g * 255,
        keystone_data[6].b * 255)

    tooltip:AddLine("|cDBB670FFMythic Plus Reward Helper|r")
    tooltip:AddLine("End of Dungeon: " ..
        EoD_Color .. keystone_data[1] .. " " .. keystone_data[3] .. "x" .. keystone_data[4] .. "|r")
    tooltip:AddLine("Great Vault: " .. GV_Color .. keystone_data[5] .. "|r")
end

function ns.buildSlashInfo(keystone_level)
    if keystone_level > ns.SEASON_MAX_KEYSTONE_LEVEL then
        keystone_level = ns.SEASON_MAX_KEYSTONE_LEVEL
    elseif keystone_level < 2 then
        print("|cDBB670FFMythic Plus Reward Helper|r")
        print("|cFFFF0000Invalid M+ Keystone Level:|r " .. keystone_level)
        return
    end

    local keystone_data = ns.MPRH_DATA[keystone_level - 1]

    -- Extract RGB values and convert them to a hex string
    -- End of Dungeon
    local EoD_Color = string.format("|cff%02x%02x%02x", keystone_data[2].r * 255, keystone_data[2].g * 255,
        keystone_data[2].b * 255)

    -- Great Vault
    local GV_Color = string.format("|cff%02x%02x%02x", keystone_data[6].r * 255, keystone_data[6].g * 255,
        keystone_data[6].b * 255)

    print("|cDBB670FFMythic Plus Reward Helper|r")
    print("|cFF14cd33Keystone Level:|r " .. keystone_level)
    print("|cFF14cd33End of Dungeon:|r " ..
        EoD_Color .. keystone_data[1] .. " " .. keystone_data[3] .. "x" .. keystone_data[4] .. "|r")
    print("|cFF14cd33Great Vault:|r " .. GV_Color .. keystone_data[5] .. "|r")
end
