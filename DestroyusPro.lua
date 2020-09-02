_DestroyusProMain = {}
_DestroyusProMain.isCombatModeOn = false
_DestroyusProMain.calibrationStarted = false
_DestroyusProMain.calibrationOngoing = false
_DestroyusProMain.lootItems = false
_DestroyusProMain.basicWorkStarted = false
_DestroyusProMain.disableMacroCreation = false
_DestroyusProMain.macroPushAmount = 1
_DestroyusProMain.macroPushOngoing = false
_DestroyusProMain.massWorkStarted = false
_DestroyusProMain.pushMacroTimer = nil
_DestroyusProMain.workProgressTimer = nil

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

-- Create pre click callback function mass work
function _DestroyusProManager.CreateButtonPreClickCallback(spellID, professionID, expansionID)
    return function (self, event)
        if _DestroyusProMain.isCombatModeOn == false then
            _DestroyusProMain.CreateMassWork(professionID, spellID, expansionID)
        end
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
function _DestroyusProManager.CreateMacroFrame(buttonName, buttonType, spellID, professionID, expansionID)
    local buttonFrame = CreateFrame("Button", buttonName, UIParent, "SecureActionButtonTemplate")
    if buttonType == _DestroyusProFrameType.MACRO then
        buttonFrame:SetAttribute("type", "macro")
        buttonFrame:SetAttribute("macrotext", "")
        buttonFrame:SetScript("PreClick", _DestroyusProManager.CreateMacroPreClickCallback(spellID, professionID))
        buttonFrame:SetScript("PostClick", _DestroyusProManager.CreateMacroPostClickCallback())
    elseif buttonType == _DestroyusProFrameType.BUTTON then
        buttonFrame:SetScript("PreClick", _DestroyusProManager.CreateButtonPreClickCallback(spellID, professionID, expansionID))
        -- No action needed for PostClick event
    end
    buttonFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
    buttonFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
    buttonFrame:SetScript("OnEvent", _DestroyusProManager.CombatModeCallback)
    
    -- Store frames in the list.
    table.insert(_DestroyusProFrameContainer, buttonFrame)
end

-- Helper function used during creation welcome message
function _DestroyusProManager.PrettyLoadQuality()
    local msg = "Quality of items:"
    local allDisabled = true
    if _G["DestroyusProItemQualityValue"]["uncommon"] == Enum.ItemQuality.Good then
       msg = msg.." *".._DestroyusProItems.ItemQualityToString(_G["DestroyusProItemQualityValue"]["uncommon"])
       allDisabled = false
    end
    if _G["DestroyusProItemQualityValue"]["rare"] == Enum.ItemQuality.Superior then
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
            _G["DestroyusProItemQualityValue"]["uncommon"] = Enum.ItemQuality.Good
            _G["DestroyusProItemQualityValue"]["rare"] = nil
            _G["DestroyusProItemQualityValue"]["epic"] = nil
        end
        if _G["DestroyusProBlackList"] == nil then
            _DestroyusProItems.InitBlackList()
        end
        if _G["DestroyusProWhiteList"] == nil then
            _DestroyusProItems.InitWhiteList()
        end    
        if _G["DestroyusProSpellsID"] == nil then
            _DestroyusProTradeSkill.InitGlobalVariables()
        end
        _DestroyusProTradeSkill.InitShadowlandsVariables()
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
    elseif professionID == _DestroyusProTradeSkill.INSCRIPTION then
        return _DestroyusProMaterials.IsItemForMilling
    elseif professionID == _DestroyusProTradeSkill.JEWELCRAFTING then
        return _DestroyusProMaterials.IsItemForProspecting
    end
    error(string.format("ERROR: SelectMacroOperation with wrong professionID %d", professionID));
end

-- Find item in containers for classic profession
function _DestroyusProMain.FindItemToWork(professionID)
    local Operation = _DestroyusProMain.SelectMacroOperation(professionID)
    if _DestroyusProTradeSkill.IsTradeSkillLearned(professionID) then
        for bagID = 0, NUM_BAG_SLOTS do
            for slotIndex = 1, GetContainerNumSlots(bagID) do
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
    local itemLocation = string.format("%d %d", result.bagID, result.slotIndex)-- /use # #
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
      if spellID == _DestroyusProSpellID.MILLING or
         spellID == _DestroyusProSpellID.DISENCHANT or
         spellID == _DestroyusProSpellID.PROSPECTING then
         return true
      end
      return false
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

-- Collect all know mass spells from the professions and save them to character database
function _DestroyusProMain.CollectMassSpells(self, event)
    if _DestroyusProMain.calibrationStarted and event == "TRADE_SKILL_DATA_SOURCE_CHANGED" then
        _DestroyusProTradeSkill.CollectAllMassSpells()
        local secondProfessionID = _DestroyusProTradeSkill.GetTradeSkillProfessionID(_DestroyusProTradeSkill.SECOND_PROFESSION_INDEX)
        if (secondProfessionID == _DestroyusProTradeSkill.INSCRIPTION or
           secondProfessionID == _DestroyusProTradeSkill.JEWELCRAFTING) and _DestroyusProMain.calibrationOngoing == false then
           _DestroyusProMain.calibrationOngoing = true -- Calibration for second profession is ongoing
           C_TradeSkillUI.OpenTradeSkill(secondProfessionID)
        else
            _DestroyusProMain.calibrationStarted = false
            _DestroyusProMain.calibrationOngoing = false
            C_TradeSkillUI.CloseTradeSkill()
        end
    end
end

-- Collect all learned mass spells from current learned professions
function _DestroyusProMain.StartCalibration(self)
    _DestroyusProMain.calibrationStarted = false
    _DestroyusProMain.calibrationOngoing = false
    local firstProfessionID = _DestroyusProTradeSkill.GetTradeSkillProfessionID(_DestroyusProTradeSkill.FIRST_PROFESSION_INDEX)
    if firstProfessionID == _DestroyusProTradeSkill.INSCRIPTION or
       firstProfessionID == _DestroyusProTradeSkill.JEWELCRAFTING then
       _DestroyusProMain.calibrationStarted = true
       C_TradeSkillUI.OpenTradeSkill(firstProfessionID)
       return
    end
    local secondProfessionID = _DestroyusProTradeSkill.GetTradeSkillProfessionID(_DestroyusProTradeSkill.SECOND_PROFESSION_INDEX)
    if secondProfessionID == _DestroyusProTradeSkill.INSCRIPTION or
       secondProfessionID == _DestroyusProTradeSkill.JEWELCRAFTING then
       _DestroyusProMain.calibrationStarted = true
       _DestroyusProMain.calibrationOngoing = true -- Calibration for second profession is ongoing
       C_TradeSkillUI.OpenTradeSkill(secondProfessionID)
       return
     end
end

-- Reset data related to creating mass work
function _DestroyusProMain.ResetCreateMassWork()
    if _DestroyusProMain.macroPushOngoing then
        _DestroyusProMain.macroPushOngoing = false
        _DestroyusProMain.macroPushAmount = 1
        _DestroyusProMain.pushMacroTimer = nil
        C_TradeSkillUI.CloseTradeSkill()
    end
end

-- Run mass work procedure by running function 3 times in short time (2 seconds)
function _DestroyusProMain.CreateMassWork(professionID, printoutSpellID, expansionID)
    if C_TradeSkillUI.IsRecipeRepeating() then
        _DestroyusProUtils.Print("Recipe is repeating. Nothing to do.")
        return
    end
    local learnedSpells = _DestroyusProTradeSkill.SelectMassSpellTable(expansionID, professionID)
    local spellID, amount = _DestroyusProMaterials.SelectSpellToCast(learnedSpells, expansionID, professionID)
    if spellID and _DestroyusProTradeSkill.IsTradeSkillLearned(professionID) then
        C_TradeSkillUI.OpenTradeSkill(professionID)
        C_TradeSkillUI.SetRecipeRepeatCount(spellID, amount)
        if _DestroyusProMain.macroPushAmount == 1 then
            _DestroyusProMain.macroPushOngoing = true
            if _DestroyusProMain.pushMacroTimer == nil then
                _DestroyusProMain.pushMacroTimer = C_Timer.NewTimer(2, _DestroyusProMain.ResetCreateMassWork)
            else
                -- Cancel and start new timer. It can happen when player soon after interrupted skill
                -- will trigger new macro push procedure
                _DestroyusProMain.pushMacroTimer:Cancel()
                _DestroyusProMain.pushMacroTimer = C_Timer.NewTimer(2, _DestroyusProMain.ResetCreateMassWork)
            end
        end
        if _DestroyusProMain.macroPushAmount == 2 then
            if TradeSkillFrame then
                TradeSkillFrame:SelectRecipe(spellID)
            end
        end
        if _DestroyusProMain.macroPushAmount == 3 then
            _DestroyusProMain.macroPushAmount = 1
            _DestroyusProMain.macroPushOngoing = false
            _DestroyusProMain.massWorkStarted = true
            _DestroyusProUtils.Print(string.format("Repeating %s %d times.", _DestroyusProUtils.GetSpellName(spellID), amount))
            C_TradeSkillUI.CraftRecipe(spellID, amount)
        else
            _DestroyusProMain.macroPushAmount = _DestroyusProMain.macroPushAmount + 1
        end
    else
        _DestroyusProUtils.Print(string.format("Nothing to %s!", _DestroyusProUtils.GetSpellName(printoutSpellID)))
    end
end

-- Callback function which check if recipe is no more repeating and work can be finished
function _DestroyusProMain.MassSpellWorkProgress()
    if C_TradeSkillUI.IsRecipeRepeating() == false and _DestroyusProMain.massWorkStarted == true then
        _DestroyusProMain.massWorkStarted = false
        _DestroyusProMain.workProgressTimer = nil
        C_TradeSkillUI.CloseTradeSkill()
    end
end

-- Callback function which contains event handling for mass work
function _DestroyusProMain.MassWorkCallback(self, event, unitTarget, castGUID, spellID)
    if _DestroyusProMain.massWorkStarted == false and unitTarget ~= "player" then
        return nil
    end

    -- Spell Cast was successful.
    if event == "UNIT_SPELLCAST_SUCCEEDED" and _DestroyusProMaterials.IsSpellInMaterials(spellID) then
        if _DestroyusProMain.workProgressTimer == nil then
            _DestroyusProMain.workProgressTimer = C_Timer.NewTimer(0.5, _DestroyusProMain.MassSpellWorkProgress)
        else
            _DestroyusProMain.workProgressTimer:Cancel()
            _DestroyusProMain.workProgressTimer = C_Timer.NewTimer(0.5, _DestroyusProMain.MassSpellWorkProgress)
        end
        return nil
    end

    -- Spell Cast was failed or become interrupted.
    if (event == "UNIT_SPELLCAST_INTERRUPTED" or event == "UNIT_SPELLCAST_FAILED") and
        _DestroyusProMaterials.IsSpellInMaterials(spellID) then
        _DestroyusProMain.massWorkStarted = false
        C_TradeSkillUI.CloseTradeSkill()
        return nil
    end
end

-- Create frames from event handling
_DestroyusProManager.CreateCustomFrame("LoadAddonData", _DestroyusProManager.LoadAddonData, {"ADDON_LOADED"})
_DestroyusProManager.CreateCustomFrame("BasicWork", _DestroyusProMain.BasicWorkCallback, {"UNIT_SPELLCAST_SUCCEEDED",
                                       "UNIT_SPELLCAST_START", "UNIT_SPELLCAST_FAILED", "UNIT_SPELLCAST_INTERRUPTED"})
_DestroyusProManager.CreateCustomFrame("LootItems", _DestroyusProMain.CollectLootCallback, {"LOOT_OPENED", "LOOT_CLOSED"})
_DestroyusProManager.CreateCustomFrame("CollectMassSpells", _DestroyusProMain.CollectMassSpells, {"TRADE_SKILL_DATA_SOURCE_CHANGED"})
_DestroyusProManager.CreateCustomFrame("MassWork", _DestroyusProMain.MassWorkCallback, {"UNIT_SPELLCAST_SUCCEEDED",
                                       "UNIT_SPELLCAST_FAILED", "UNIT_SPELLCAST_INTERRUPTED"})

-- Create Macro frames
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.MILLING, _DestroyusProFrameType.MACRO,
                                       _DestroyusProSpellID.MILLING, _DestroyusProTradeSkill.INSCRIPTION)
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.DISENCHANTING, _DestroyusProFrameType.MACRO,
                                    _DestroyusProSpellID.DISENCHANT, _DestroyusProTradeSkill.ENCHANTING)
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.PROSPECTING, _DestroyusProFrameType.MACRO,
                                    _DestroyusProSpellID.PROSPECTING, _DestroyusProTradeSkill.JEWELCRAFTING)
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.MASS_MILLING_LEGION, _DestroyusProFrameType.BUTTON,
                                    _DestroyusProSpellID.MILLING, _DestroyusProTradeSkill.INSCRIPTION, _DestroyusProExpansionID.LEGION)
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.MASS_PROSPECTING_LEGION, _DestroyusProFrameType.BUTTON,
                                    _DestroyusProSpellID.PROSPECTING, _DestroyusProTradeSkill.JEWELCRAFTING, _DestroyusProExpansionID.LEGION)
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.MASS_MILLING_AZEROTH, _DestroyusProFrameType.BUTTON,
                                    _DestroyusProSpellID.MILLING, _DestroyusProTradeSkill.INSCRIPTION, _DestroyusProExpansionID.BFA)
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.MASS_PROSPECTING_AZEROTH, _DestroyusProFrameType.BUTTON,
                                    _DestroyusProSpellID.PROSPECTING, _DestroyusProTradeSkill.JEWELCRAFTING, _DestroyusProExpansionID.BFA)
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.MASS_MILLING_SHADOWLANDS, _DestroyusProFrameType.BUTTON,
                                    _DestroyusProSpellID.MILLING, _DestroyusProTradeSkill.INSCRIPTION, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProManager.CreateMacroFrame(_DestroyusProButtonName.MASS_PROSPECTING_SHADOWLANDS, _DestroyusProFrameType.BUTTON,
                                    _DestroyusProSpellID.PROSPECTING, _DestroyusProTradeSkill.JEWELCRAFTING, _DestroyusProExpansionID.SHADOWLANDS)