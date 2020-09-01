_DestroyusProTradeSkill = {}
_DestroyusProTradeSkill.ENCHANTING = 333
_DestroyusProTradeSkill.INSCRIPTION = 773
_DestroyusProTradeSkill.JEWELCRAFTING = 755
_DestroyusProTradeSkill.FIRST_PROFESSION_INDEX = 1
_DestroyusProTradeSkill.SECOND_PROFESSION_INDEX = 2

-- Collect all mass spellID from the current specific expansion and profession
function _DestroyusProTradeSkill.CollectMassWorkSpells(expansionID, professionID)
    local professionMassSpells = _DestroyusProMaterials.SelectMassSpells(expansionID, professionID)
    local learnedSpells = _DestroyusProTradeSkill.SelectMassSpellTable(expansionID, professionID)
    -- Clear list by removing elements. Keep reference to old list
    for i = 1, #learnedSpells do
        table.remove(learnedSpells)
    end
    for _, spellID in ipairs(professionMassSpells) do
        local recipeInfo = C_TradeSkillUI.GetRecipeInfo(spellID)
        if recipeInfo and recipeInfo.learned == true then
            _DestroyusProUtils.Print("Adding " .. _DestroyusProUtils.GetSpellName(spellID))
            _DestroyusProTradeSkill.AddNewSpell(learnedSpells, spellID)
        end
    end
end

-- Init global variables related with mass spells
function _DestroyusProTradeSkill.InitGlobalVariables()
    _G["DestroyusProSpellsID"] = {}
    _G["DestroyusProSpellsID"]["MillLegion"] = {}
    _G["DestroyusProSpellsID"]["MillAzeroth"] = {}
    _G["DestroyusProSpellsID"]["MillShadowlands"] = {}
    _G["DestroyusProSpellsID"]["ProspectingLegion"] = {}
    _G["DestroyusProSpellsID"]["ProspectingAzeroth"] = {}
    _G["DestroyusProSpellsID"]["ProspectingShadowlands"] = {}
end

-- Init variables connected to Shadowlands expansion for already installed addons
function _DestroyusProTradeSkill.InitShadowlandsVariables()
    if _G["DestroyusProSpellsID"]["MillShadowlands"] == nil then
        _G["DestroyusProSpellsID"]["MillShadowlands"] = {}
    end
    if _G["DestroyusProSpellsID"]["ProspectingShadowlands"] == nil then
        _G["DestroyusProSpellsID"]["ProspectingShadowlands"] = {}
    end
end

-- Collect all mass spells from activate profession
function _DestroyusProTradeSkill.CollectAllMassSpells()
    _DestroyusProTradeSkill.CollectMassWorkSpells(_DestroyusProExpansionID.LEGION, _DestroyusProTradeSkill.INSCRIPTION)
    _DestroyusProTradeSkill.CollectMassWorkSpells(_DestroyusProExpansionID.LEGION, _DestroyusProTradeSkill.JEWELCRAFTING)
    _DestroyusProTradeSkill.CollectMassWorkSpells(_DestroyusProExpansionID.BFA, _DestroyusProTradeSkill.JEWELCRAFTING)
    _DestroyusProTradeSkill.CollectMassWorkSpells(_DestroyusProExpansionID.BFA, _DestroyusProTradeSkill.INSCRIPTION)
    _DestroyusProTradeSkill.CollectMassWorkSpells(_DestroyusProExpansionID.SHADOWLANDS, _DestroyusProTradeSkill.JEWELCRAFTING)
    _DestroyusProTradeSkill.CollectMassWorkSpells(_DestroyusProExpansionID.SHADOWLANDS, _DestroyusProTradeSkill.INSCRIPTION)
end

-- Perform action when player learned new spell
function _DestroyusProTradeSkill.NewSpellAppear(newSpellID, expansionID, professionID)
    local learnedSpells = _DestroyusProTradeSkill.SelectMassSpellTable(expansionID, professionID)
    local massSpells = _DestroyusProMaterials.SelectMassSpells(expansionID, professionID)
    if _DestroyusProTradeSkill.IsSpellOnList(newSpellID, massSpells) then -- Check if spellID is mass spell
        if _DestroyusProTradeSkill.IsSpellOnList(newSpellID, learnedSpells) == false then -- Check if spell is already known
            _DestroyusProTradeSkill.AddNewSpell(learnedSpells, newSpellID)
        end
    end
end

-- Select table for the specific expansion and profession with learned mass spells
function _DestroyusProTradeSkill.SelectMassSpellTable(expansionID, professionID)
    if expansionID == _DestroyusProExpansionID.LEGION then
        if professionID == _DestroyusProTradeSkill.JEWELCRAFTING then
            return _G["DestroyusProSpellsID"]["ProspectingLegion"]
        elseif professionID == _DestroyusProTradeSkill.INSCRIPTION then
            return _G["DestroyusProSpellsID"]["MillLegion"]
        end
    end
    if expansionID == _DestroyusProExpansionID.BFA then
        if professionID == _DestroyusProTradeSkill.JEWELCRAFTING then
            return _G["DestroyusProSpellsID"]["ProspectingAzeroth"]
        elseif professionID == _DestroyusProTradeSkill.INSCRIPTION then
            return _G["DestroyusProSpellsID"]["MillAzeroth"]
        end
    end
    if expansionID == _DestroyusProExpansionID.SHADOWLANDS then
        if professionID == _DestroyusProTradeSkill.JEWELCRAFTING then
            return _G["DestroyusProSpellsID"]["ProspectingShadowlands"]
        elseif professionID == _DestroyusProTradeSkill.INSCRIPTION then
            return _G["DestroyusProSpellsID"]["MillShadowlands"]
        end
    end
    -- This place should never happen.
    local errorText = string.format("ERROR: SelectMassSpellTable with wrong professionID %d or expansionID %d",
                                    professionID, expansionID)
    error(errorText);
end

-- Get professionID from specific index location
function _DestroyusProTradeSkill.GetTradeSkillProfessionID(index)
    local profession = select(index, GetProfessions())
    if profession then
        return select(7, GetProfessionInfo(profession))
    end
    return nil
end

-- Check if profession is learned by player
function _DestroyusProTradeSkill.IsTradeSkillLearned(professionID)
    local skillLearned = false
    local firstProfessionID = _DestroyusProTradeSkill.GetTradeSkillProfessionID(_DestroyusProTradeSkill.FIRST_PROFESSION_INDEX)
    local secondProfessionID = _DestroyusProTradeSkill.GetTradeSkillProfessionID(_DestroyusProTradeSkill.SECOND_PROFESSION_INDEX)
    if firstProfessionID == professionID then
        skillLearned = true
    elseif secondProfessionID == professionID then
        skillLearned = true
    end
    return skillLearned
end

-- Check if spellID is on the list
function _DestroyusProTradeSkill.IsSpellOnList(spellID, spells)
    for i = 1, #spells do
        if spells[i] == newSpellID then
            return true
        end
    end
    return false
end

-- Add new spellID to the list
function _DestroyusProTradeSkill.AddNewSpell(spells, spellID)
    table.insert(spells, spellID)
end

-- Create frame for event callbacks
_DestroyusProTradeSkill.newRecipeLearnedFrame = CreateFrame("Frame", "DestroyusProNewRecipeLearnedFrame")
_DestroyusProTradeSkill.newRecipeLearnedFrame:RegisterEvent("NEW_RECIPE_LEARNED")

-- Add new spellID to proper list if possible
function _DestroyusProTradeSkill.CallbackNewRecipeLearned(self, event, spellID)
    if event == "NEW_RECIPE_LEARNED" then
        _DestroyusProTradeSkill.NewSpellAppear(spellID, _DestroyusProExpansionID.LEGION, _DestroyusProTradeSkill.INSCRIPTION)
        _DestroyusProTradeSkill.NewSpellAppear(spellID, _DestroyusProExpansionID.LEGION, _DestroyusProTradeSkill.JEWELCRAFTING)
        _DestroyusProTradeSkill.NewSpellAppear(spellID, _DestroyusProExpansionID.BFA, _DestroyusProTradeSkill.INSCRIPTION)
        _DestroyusProTradeSkill.NewSpellAppear(spellID, _DestroyusProExpansionID.BFA, _DestroyusProTradeSkill.JEWELCRAFTING)
        _DestroyusProTradeSkill.NewSpellAppear(spellID, _DestroyusProExpansionID.SHADOWLANDS, _DestroyusProTradeSkill.INSCRIPTION)
        _DestroyusProTradeSkill.NewSpellAppear(spellID, _DestroyusProExpansionID.SHADOWLANDS, _DestroyusProTradeSkill.JEWELCRAFTING)
    end
end

-- Register event
_DestroyusProTradeSkill.newRecipeLearnedFrame:SetScript("OnEvent", _DestroyusProTradeSkill.CallbackNewRecipeLearned)
