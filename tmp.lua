local UPGRADE_TRACK_COLOR = {
    champion = ITEM_QUALITY_COLORS[3], -- Rare (Champion)
    hero = ITEM_QUALITY_COLORS[4],     -- Epic (Hero)
    mythic = ITEM_QUALITY_COLORS[5],   -- Legendary (Mythic)
}

local UPGRADE_CREST_AWARD = {
    "Carved Harbinger Crest",
    "Runed Harbinger Crest",
    "Gilded Harbinger Crest",
}

local END_OF_DUNGEON_ITEM_LEVEL = {
    597,
    597,
    600,
    603,
    606,
    610,
    610,
    613,
    613,
}

local GREAT_VAULT_ITEM_LEVEL = {
    606,
    610,
    610,
    613,
    613,
    616,
    619,
    619,
    623,
}

local TABLE_DATA = {
    { END_OF_DUNGEON_ITEM_LEVEL[1], UPGRADE_TRACK_COLOR.champion, UPGRADE_CREST_AWARD[1], GREAT_VAULT_ITEM_LEVEL[1], UPGRADE_TRACK_COLOR.champion }, -- +2
    { END_OF_DUNGEON_ITEM_LEVEL[2], UPGRADE_TRACK_COLOR.champion, UPGRADE_CREST_AWARD[1], GREAT_VAULT_ITEM_LEVEL[2], UPGRADE_TRACK_COLOR.hero },     -- +3
    { END_OF_DUNGEON_ITEM_LEVEL[3], UPGRADE_TRACK_COLOR.champion, UPGRADE_CREST_AWARD[2], GREAT_VAULT_ITEM_LEVEL[3], UPGRADE_TRACK_COLOR.hero },     -- +4
    { END_OF_DUNGEON_ITEM_LEVEL[4], UPGRADE_TRACK_COLOR.champion, UPGRADE_CREST_AWARD[2], GREAT_VAULT_ITEM_LEVEL[4], UPGRADE_TRACK_COLOR.hero },     -- +5
    { END_OF_DUNGEON_ITEM_LEVEL[5], UPGRADE_TRACK_COLOR.champion, UPGRADE_CREST_AWARD[2], GREAT_VAULT_ITEM_LEVEL[5], UPGRADE_TRACK_COLOR.hero },     -- +6
    { END_OF_DUNGEON_ITEM_LEVEL[6], UPGRADE_TRACK_COLOR.hero,     UPGRADE_CREST_AWARD[2], GREAT_VAULT_ITEM_LEVEL[6], UPGRADE_TRACK_COLOR.hero },     -- +7
    { END_OF_DUNGEON_ITEM_LEVEL[7], UPGRADE_TRACK_COLOR.hero,     UPGRADE_CREST_AWARD[2], GREAT_VAULT_ITEM_LEVEL[7], UPGRADE_TRACK_COLOR.hero },     -- +8
    { END_OF_DUNGEON_ITEM_LEVEL[8], UPGRADE_TRACK_COLOR.hero,     UPGRADE_CREST_AWARD[3], GREAT_VAULT_ITEM_LEVEL[8], UPGRADE_TRACK_COLOR.hero },     -- +9
    { END_OF_DUNGEON_ITEM_LEVEL[9], UPGRADE_TRACK_COLOR.hero,     UPGRADE_CREST_AWARD[3], GREAT_VAULT_ITEM_LEVEL[9], UPGRADE_TRACK_COLOR.mythic },   -- +10
}


local function buildTooltip(keystone_level, tooltip)
    if keystone_level > 10 then
        keystone_level = 10
    end

    local keystone_data = TABLE_DATA[keystone_level - 1]

    -- Extract RGB values and convert them to a hex string
    local EoD_Color = string.format("|cff%02x%02x%02x", keystone_data[2].r * 255, keystone_data[2].g * 255,
        keystone_data[2].b * 255)

    local GV_Color = string.format("|cff%02x%02x%02x", keystone_data[5].r * 255, keystone_data[5].g * 255,
        keystone_data[5].b * 255)

    tooltip:AddLine(" ")
    tooltip:AddLine("Mythic Plus Reward Helper")
    tooltip:AddLine(EoD_Color .. keystone_data[1] .. " " .. keystone_data[3] .. "|r")
    tooltip:AddLine(GV_Color .. keystone_data[4] .. "|r")
end

buildTooltip(15)
