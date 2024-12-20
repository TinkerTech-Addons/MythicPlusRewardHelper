-- MPRH_Functions.lua
local addonName, ns = ...

function ns.buildTooltip(keystone_level, tooltip)
    if keystone_level > 10 then
        keystone_level = 10
    end

    local keystone_data = ns.MPRH_DATA[keystone_level - 1]

    -- Extract RGB values and convert them to a hex string
    -- End of Dungeon
    local EoD_Color = string.format("|cff%02x%02x%02x", keystone_data[2].r * 255, keystone_data[2].g * 255,
        keystone_data[2].b * 255)

    -- Great Vault
    local GV_Color = string.format("|cff%02x%02x%02x", keystone_data[5].r * 255, keystone_data[5].g * 255,
        keystone_data[5].b * 255)

    tooltip:AddLine(" ")
    tooltip:AddLine("Mythic Plus Reward Helper")
    tooltip:AddLine(EoD_Color .. keystone_data[1] .. " " .. keystone_data[3] .. "|r")
    tooltip:AddLine(GV_Color .. keystone_data[4] .. "|r")
end
