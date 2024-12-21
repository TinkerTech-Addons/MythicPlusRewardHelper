local addonName, ns = ...

function MPRH_OnAddonCompartmentClick()
    return
end

function MPRH_OnAddonCompartmentEnter()
    GameTooltip:SetOwner(AddonCompartmentFrame, "ANCHOR_BOTTOMLEFT")
    GameTooltip:AddDoubleLine("|cDBB670FFMythic Plus Reward Helper|r", "Version: " .. ns.addonVersion, 1, 0.8, 0, 1, 0.8,
        0)
    GameTooltip:AddLine(" ")
    GameTooltip:Show()
end

function MPRH_OnAddonCompartmentLeave()
    GameTooltip:Hide()
end
