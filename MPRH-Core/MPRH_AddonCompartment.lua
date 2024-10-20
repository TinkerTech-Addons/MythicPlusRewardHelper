local ns = ...

function MPRH_OnAddonCompartmentClick()
    if IsShiftKeyDown() then
        ns.ToggleMythicPlusRewardHelperOnOff()
    else
        ns.ShowSettingsFrame()
    end
end

function MPRH_OnAddonCompartmentEnter()
    GameTooltip:SetOwner(AddonCompartmentFrame, "ANCHOR_BOTTOMLEFT")
    GameTooltip:AddDoubleLine(ns.addonName, "Version: " .. ns.addonVersion, 1, 0.8, 0, 1, 0.8, 0)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("Left-Click to toggle settings")
    GameTooltip:AddLine("Shift Left-Click to toggle On/Off")
    GameTooltip:Show()
end

function MPRH_OnAddonCompartmentLeave()
    GameTooltip:Hide()
end
