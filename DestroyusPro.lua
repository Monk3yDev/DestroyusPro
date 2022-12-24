_DestroyusProMain = {}
_DestroyusProMain.isCombatModeOn = false
_DestroyusProMain.lootItems = false
_DestroyusProMain.basicWorkStarted = false
_DestroyusProMain.disableMacroCreation = false

_DestroyusProFrameContainer = {}
_DestroyusProManager = {}

-- Create pre click callback function for basic work
function _DestroyusProManager.CreateMacroPreClickCallback(spellID, professionID)
    return function (self, event)
        if _DestroyusProMain.isCombatModeOn == false and _DestroyusProMain.disableMacroCreation == false then
            _DestroyusProMain.lootItems = false
            _DestroyusProMain.basicWorkStarted = false
            local result = _DestroyusProMain.FindItemToWork(professionID)
            if result then
                self:SetAttribute("macrotext", _DestroyusProMain.CreateMacroUsage(spellID, result))
                _DestroyusProMain.basicWorkStarted = true
            end
            _DestroyusProMain.PrintResults(spellID, result)
        end
    end
end

-- Create post click callback function
function _DestroyusProManager.CreateMacroPostClickCallback()
    return function (self, event)
        if _DestroyusProMain.isCombatModeOn == false then
            self:SetAttribute("macrotext", "")
        end
    end
end

-- Function callback during entering combat
function _DestroyusProManager.CombatModeCallback(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        _DestroyusProMain.isCombatModeOn = true
        _DestroyusProMacro.isCombatModeOn = true
        return nil
    end
    if event == "PLAYER_REGEN_ENABLED" then
        _DestroyusProMain.isCombatModeOn = false
        _DestroyusProMacro.isCombatModeOn = false
        return nil
    end
end

-- Create custom frame for event handling
function _DestroyusProManager.CreateCustomFrame(name, callback, events)
    local frame = CreateFrame("Frame", "_DestroyusPro"..name.."Frame")
    for i = 1, #events do
        frame:RegisterEvent(events[i])
    end
    frame:SetScript("OnEvent", callback)
    table.insert(_DestroyusProFrameContainer, frame)
end

-- Create macro frame for event and script handling
function _DestroyusProManager.CreateMacroFrame(buttonName, spellID, professionID)
    local buttonFrame = CreateFrame("Button", buttonName, UIParent, "SecureActionButtonTemplate")
    buttonFrame:SetAttribute("type", "macro")
    buttonFrame:SetAttribute("macrotext", "")
    buttonFrame:SetScript("PreClick", _DestroyusProManager.CreateMacroPreClickCallback(spellID, professionID))
    buttonFrame:SetScript("PostClick", _DestroyusProManager.CreateMacroPostClickCallback())
    buttonFrame:SetScript("OnEvent", _DestroyusProManager.CombatModeCallback)
    buttonFrame:RegisterForClicks("AnyUp", "AnyDown")
    buttonFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
    buttonFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
    -- Store frames in the list.
    table.insert(_DestroyusProFrameContainer, buttonFrame)
end

-- Helper function used during creation welcome message
function _DestroyusProManager.PrettyLoadQuality()
    local msg = "Quality of items:"
    local allDisabled = true
    if _G["DestroyusProItemQualityValue"]["uncommon"] == Enum.ItemQuality.Uncommon then
       msg = msg.." *".._DestroyusProItems.ItemQualityToString(_G["DestroyusProItemQualityValue"]["uncommon"])
       allDisabled = false
    end
    if _G["DestroyusProItemQualityValue"]["rare"] == Enum.ItemQuality.Rare then
       msg = msg.." *".._DestroyusProItems.ItemQualityToString(_G["DestroyusProItemQualityValue"]["rare"])
       allDisabled = false
    end
    if _G["DestroyusProItemQualityValue"]["epic"] == Enum.ItemQuality.Epic then
       msg = msg.." *".._DestroyusProItems.ItemQualityToString(_G["DestroyusProItemQualityValue"]["epic"])
       allDisabled = false
    end
    if allDisabled then
       msg = msg.." ".."Disabled. Check settings"
    end
    return msg
end

-- Display welcome message
function _DestroyusProManager.PrettyLoadMessage()
    _DestroyusProUtils.Print(string.format("Addon successfully loaded. %s", _DestroyusProManager.PrettyLoadQuality()))
end

-- Callback function which contains event handling when addon data is loaded
function _DestroyusProManager.LoadAddonData(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == 'DestroyusPro' then
        if _G["DestroyusProPrintOutState"] == nil then
            _G["DestroyusProPrintOutState"] = true
        end
        if _G["DestroyusProItemQualityValue"] == nil then
            _G["DestroyusProItemQualityValue"] = {}
            _G["DestroyusProItemQualityValue"]["uncommon"] = Enum.ItemQuality.Uncommon
            _G["DestroyusProItemQualityValue"]["rare"] = nil
            _G["DestroyusProItemQualityValue"]["epic"] = nil
        end
        if _G["DestroyusProBlackList"] == nil then
            _DestroyusProItems.InitBlackList()
        end
        if _G["DestroyusProWhiteList"] == nil then
            _DestroyusProItems.InitWhiteList()
        end    
        _DestroyusProManager.PrettyLoadMessage()
    end
end

-- Helper method for updating global variable related to disabling printouts
function _DestroyusProManager.ChangeStateForPrintout(state)
    _G["DestroyusProPrintOutState"] = state
end

-- Helper method for updating global variable related to disenchanting
function _DestroyusProManager.ChangeQualityDisenchanting(quality, value)
    _G["DestroyusProItemQualityValue"][quality] = value
end

-- Helper method which select method depending of professionID
function _DestroyusProMain.SelectMacroOperation(professionID)
    if professionID == _DestroyusProTradeSkill.ENCHANTING then
        return _DestroyusProItems.IsItemForDisenchanting
    end
    error(string.format("ERROR: SelectMacroOperation with wrong professionID %d", professionID));
end

-- Find item in containers for classic profession
function _DestroyusProMain.FindItemToWork(professionID)
    local Operation = _DestroyusProMain.SelectMacroOperation(professionID)
    if _DestroyusProTradeSkill.IsTradeSkillLearned(professionID) then
        for bagID = 0, NUM_BAG_SLOTS do
            for slotIndex = 1, C_Container.GetContainerNumSlots(bagID) do
                if Operation(bagID, slotIndex) then
                    local itemLink = C_Item.GetItemLink(ItemLocation:CreateFromBagAndSlot(bagID, slotIndex))
                    return {bagID=bagID, slotIndex=slotIndex, itemLink=itemLink}
                end
            end
        end
    end
    return nil
end

-- Create macro string for profession
function _DestroyusProMain.CreateMacroUsage(spellID, result)
    local spellName = _DestroyusProUtils.GetSpellName(spellID)
    local itemLocation = string.format("%d %d", result.bagID, result.slotIndex)
    return string.format("/cast %s\n/use %s", spellName, itemLocation)
end

-- Print results of the selected item from the bag
function _DestroyusProMain.PrintResults(spellID, result)
    local spellName = _DestroyusProUtils.GetSpellName(spellID)
    if result then
        _DestroyusProUtils.Print("".. spellName .." => " .. result.itemLink)
    else
        local msg = ""
        if spellID == _DestroyusProSpellID.DISENCHANT then
            msg = msg .. _DestroyusProManager.PrettyLoadQuality()
        end
        _DestroyusProUtils.Print(string.format("Nothing to %s! %s", spellName, msg))
    end
end

-- Check if spellID is from professions
function _DestroyusProMain.IsBasicSpellInList(spellID)
      return spellID == _DestroyusProSpellID.DISENCHANT
end

-- Callback function which contains event handling for basic profession work
function _DestroyusProMain.BasicWorkCallback(self, event, unitTarget, castGUID, spellID)
    if _DestroyusProMain.basicWorkStarted == false and unitTarget ~= "player" then
        return nil
    end

    if event == "UNIT_SPELLCAST_START" and _DestroyusProMain.IsBasicSpellInList(spellID) then
        -- Disable macro creation when basic work is invoked.
        _DestroyusProMain.disableMacroCreation = true
        return nil
    end

    if event == "UNIT_SPELLCAST_SUCCEEDED" and _DestroyusProMain.IsBasicSpellInList(spellID) then
        _DestroyusProMain.basicWorkStarted = false
        _DestroyusProMain.lootItems = true
        return nil
    end

    if (event == "UNIT_SPELLCAST_INTERRUPTED" or event == "UNIT_SPELLCAST_FAILED") and 
       _DestroyusProMain.IsBasicSpellInList(spellID) then
        _DestroyusProMain.basicWorkStarted = false
        _DestroyusProMain.lootItems = false
        _DestroyusProMain.disableMacroCreation = false
        return nil
    end
end

-- Callback function which contains event handling for collecting loot after basic work
function _DestroyusProMain.CollectLootCallback(self, event, autoLoot)
    -- Spell Cast failed or become interrupted.
    if _DestroyusProMain.lootItems and event == "LOOT_OPENED" then
        _DestroyusProMain.LootAllItems()
        _DestroyusProMain.lootItems = false
        return nil
    end

    -- In case of the strange behaves all flags are set to their defaults
    if event == "LOOT_CLOSED" then
        _DestroyusProMain.basicWorkStarted = false
        _DestroyusProMain.lootItems = false
        _DestroyusProMain.disableMacroCreation = false
        return nil
    end
end

-- Loot all items after milling, disenchanting, prospecting
function _DestroyusProMain.LootAllItems()
    for i = 1, GetNumLootItems() do 
        LootSlot(i)
    end
end

-- Create frames from event handling
_DestroyusProManager.CreateCustomFrame("LoadAddonData", _DestroyusProManager.LoadAddonData, {"ADDON_LOADED"})
_DestroyusProManager.CreateCustomFrame("BasicWork", _DestroyusProMain.BasicWorkCallback, {"UNIT_SPELLCAST_SUCCEEDED",
                                       "UNIT_SPELLCAST_START", "UNIT_SPELLCAST_FAILED", "UNIT_SPELLCAST_INTERRUPTED"})
_DestroyusProManager.CreateCustomFrame("LootItems", _DestroyusProMain.CollectLootCallback, {"LOOT_OPENED", "LOOT_CLOSED"})

-- Create Macro frames
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.DISENCHANTING, _DestroyusProSpellID.DISENCHANT, _DestroyusProTradeSkill.ENCHANTING)
