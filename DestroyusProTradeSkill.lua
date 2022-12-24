_DestroyusProTradeSkill = {}
_DestroyusProTradeSkill.ENCHANTING = 333
_DestroyusProTradeSkill.FIRST_PROFESSION_INDEX = 1
_DestroyusProTradeSkill.SECOND_PROFESSION_INDEX = 2

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
