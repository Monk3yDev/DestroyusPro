_DestroyusProManagerUI = {}
_DestroyusProManagerUI.displayItemLink = nil

-- Create/Delete macro depending on checked status form CheckBox
function _DestroyusProManagerUI.CreateMacro(checked, macroName, icon, buttonName)
    if checked then
        _DestroyusProMacro.ManageMacro(_DestroyusProMacro.CREATE, macroName, icon, buttonName)
    else
        _DestroyusProMacro.ManageMacro(_DestroyusProMacro.DELETE, macroName)
    end
end

-- Change disenchanting quality depending on checked status form CheckBox
function _DestroyusProManagerUI.ChangeQualityDisenchanting(checked, key, quality)
    if checked then
        _DestroyusProManager.ChangeQualityDisenchanting(key, quality)
    else
        _DestroyusProManager.ChangeQualityDisenchanting(key, nil)
    end
end

-- Change printout state depending on checked status form CheckBox
function _DestroyusProManagerUI.ChangeStatePrintout(checked)
    if checked then
        _DestroyusProManager.ChangeStateForPrintout(false) -- This place disable printouts
    else
        _DestroyusProManager.ChangeStateForPrintout(true) -- This place enabled printouts
    end
end

-- Register events for CheckBoxes when frame is loaded.
function _DestroyusProManagerUI.RegisterEvents(checkbox)
    checkbox:RegisterEvent("UPDATE_MACROS")
    checkbox:RegisterEvent("PLAYER_REGEN_DISABLED")
    checkbox:RegisterEvent("PLAYER_REGEN_ENABLED")
end

-- Inject macro name to the check button object. Will be used
-- during detection macro event
function _DestroyusProManagerUI.InjectMacroName(checkbox, macroName)
    checkbox._DestroyusProMacroName = macroName
end

-- Handle events for CheckBox
function _DestroyusProManagerUI.OnEventCallback(checkbox, event)
    if event == "UPDATE_MACROS" then
        -- Detection is based on injected variable
        local macroName = checkbox._DestroyusProMacroName
        checkbox:SetChecked(_DestroyusProMacro.IsMacroCreated(macroName))
    end
    -- Disable buttons during combat
    if event == "PLAYER_REGEN_DISABLED" then
        checkbox:Disable()
        return nil
    end
    if event == "PLAYER_REGEN_ENABLED" then
        checkbox:Enable()
        return nil
    end
end

-- Handle on click callback. Common function for on click, drag event and close form
function _DestroyusProManagerUI.OnClickCallbackItemManager(self, button)
    local itemLocation = C_Cursor.GetCursorItem()
    if button == "LeftButton" and itemLocation then
        if C_Item.DoesItemExist(itemLocation) then
            local itemLink = C_Item.GetItemLink(itemLocation)
            local itemIcon = select(10, GetItemInfo(itemLink))
            SetItemButtonTexture(self, itemIcon)
            _DestroyusProManagerUI.displayItemLink = itemLink
        end
    elseif button == "RightButton" then
        _DestroyusProManagerUI.displayItemLink = nil
        SetItemButtonTexture(self, nil)
    end
    GameTooltip:Hide()
    ClearCursor()
end

-- Display GameTooltip when item has been already selected
function _DestroyusProManagerUI.OnEnterCallbackItemManager(self)
    if _DestroyusProManagerUI.displayItemLink then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink(_DestroyusProManagerUI.displayItemLink)
        GameTooltip:Show()
    end
end

-- Manage adding and removing item during on click callback
function _DestroyusProManagerUI.ManageActiveList(commandType)
    if _DestroyusProManagerUI.displayItemLink then
        _DestroyusProItems.ManageActiveList(_DestroyusProManagerUI.displayItemLink, commandType)
    else
        _DestroyusProUtils.Print("Item slot is empty. Please select one from inventory")
    end
end
