-- MPRH-KeystoneTooltip.lua

-- Create locally used variables
local addonName, ns = ...

-- Function to add reward item levels on Mythic+ keystone item tooltip
function ns.OnKeystoneTooltip(tooltip, data)
    if string.match(data.lines[1].leftText, "Keystone:") then
        if tooltip == GameTooltip then
            local keystoneLevel = tonumber(string.sub(data.lines[2].leftText, 14, 16)) or 0
            ns.buildTooltip(keystoneLevel, tooltip)
        end
    end
end
