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
