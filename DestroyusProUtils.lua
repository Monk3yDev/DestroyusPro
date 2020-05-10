_DestroyusProUtils = {}

-- Return spell name if exist. Otherwise return empty string
function _DestroyusProUtils.GetSpellName(spellID)
    local spellName = select(1, GetSpellInfo(spellID))
    if spellName then
        return spellName
    end
    return ""
end

-- Print text using specific addon format output
function _DestroyusProUtils.Print(text)
    if _G["DestroyusProPrintOutState"] ~= false then
        print(string.format("|CFF18BE00DestroyusPro: |r%s", text))
    end
end
