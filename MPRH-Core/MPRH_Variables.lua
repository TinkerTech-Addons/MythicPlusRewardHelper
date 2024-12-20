-- MPRH_Variables.lua

local addonName, ns = ...

ns.SEASON_MAX_KEYSTONE_LEVEL = 10

ns.END_OF_DUNGEON_ITEM_LEVEL = {
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

ns.GREAT_VAULT_ITEM_LEVEL = {
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

ns.UPGRADE_CREST_AWARD = {
    "Carved Harbinger Crest",
    "Runed Harbinger Crest",
    "Gilded Harbinger Crest",
}

ns.UPGRADE_TRACK_COLOR = {
    champion = ITEM_QUALITY_COLORS[3], -- Rare (Champion)
    hero = ITEM_QUALITY_COLORS[4],     -- Epic (Hero)
    mythic = ITEM_QUALITY_COLORS[5],   -- Legendary (Mythic)
}

ns.MPRH_DATA = {
    { ns.END_OF_DUNGEON_ITEM_LEVEL[1], ns.UPGRADE_TRACK_COLOR.champion, ns.UPGRADE_CREST_AWARD[1], ns.GREAT_VAULT_ITEM_LEVEL[1], ns.UPGRADE_TRACK_COLOR.champion }, -- +2
    { ns.END_OF_DUNGEON_ITEM_LEVEL[2], ns.UPGRADE_TRACK_COLOR.champion, ns.UPGRADE_CREST_AWARD[1], ns.GREAT_VAULT_ITEM_LEVEL[2], ns.UPGRADE_TRACK_COLOR.hero },     -- +3
    { ns.END_OF_DUNGEON_ITEM_LEVEL[3], ns.UPGRADE_TRACK_COLOR.champion, ns.UPGRADE_CREST_AWARD[2], ns.GREAT_VAULT_ITEM_LEVEL[3], ns.UPGRADE_TRACK_COLOR.hero },     -- +4
    { ns.END_OF_DUNGEON_ITEM_LEVEL[4], ns.UPGRADE_TRACK_COLOR.champion, ns.UPGRADE_CREST_AWARD[2], ns.GREAT_VAULT_ITEM_LEVEL[4], ns.UPGRADE_TRACK_COLOR.hero },     -- +5
    { ns.END_OF_DUNGEON_ITEM_LEVEL[5], ns.UPGRADE_TRACK_COLOR.champion, ns.UPGRADE_CREST_AWARD[2], ns.GREAT_VAULT_ITEM_LEVEL[5], ns.UPGRADE_TRACK_COLOR.hero },     -- +6
    { ns.END_OF_DUNGEON_ITEM_LEVEL[6], ns.UPGRADE_TRACK_COLOR.hero,     ns.UPGRADE_CREST_AWARD[2], ns.GREAT_VAULT_ITEM_LEVEL[6], ns.UPGRADE_TRACK_COLOR.hero },     -- +7
    { ns.END_OF_DUNGEON_ITEM_LEVEL[7], ns.UPGRADE_TRACK_COLOR.hero,     ns.UPGRADE_CREST_AWARD[2], ns.GREAT_VAULT_ITEM_LEVEL[7], ns.UPGRADE_TRACK_COLOR.hero },     -- +8
    { ns.END_OF_DUNGEON_ITEM_LEVEL[8], ns.UPGRADE_TRACK_COLOR.hero,     ns.UPGRADE_CREST_AWARD[3], ns.GREAT_VAULT_ITEM_LEVEL[8], ns.UPGRADE_TRACK_COLOR.hero },     -- +9
    { ns.END_OF_DUNGEON_ITEM_LEVEL[9], ns.UPGRADE_TRACK_COLOR.hero,     ns.UPGRADE_CREST_AWARD[3], ns.GREAT_VAULT_ITEM_LEVEL[9], ns.UPGRADE_TRACK_COLOR.mythic },   -- +10
}
