_DestroyusProMacro = {}
_DestroyusProMacro.CREATE = "CREATE"
_DestroyusProMacro.DELETE = "DELETE"

-- Macro Names
_DestroyusProMacro.DISENCHANTING = "DesProDisenchant"
_DestroyusProMacro.MILLING = "DesProMilling"
_DestroyusProMacro.PROSPECTING = "DesProProspect"
_DestroyusProMacro.MASS_MILLING_LEGION = "DesProMMLegion"
_DestroyusProMacro.MASS_PROSPECTING_LEGION = "DesProMPLegion"
_DestroyusProMacro.MASS_MILLING_AZEROTH = "DesProMMAzeroth"
_DestroyusProMacro.MASS_PROSPECTING_AZEROTH = "DesProMPAzeroth"
_DestroyusProMacro.MASS_MILLING_SHADOWLANDS = "DesProMMShadowlands"
_DestroyusProMacro.MASS_PROSPECTING_SHADOWLANDS = "DesProMPShadowlands"

-- Macro Icons
_DestroyusProMacro.BLUE_BOWL = "237032"
_DestroyusProMacro.RED_BOWL = "237031"
_DestroyusProMacro.BLACK_MAGIC_HAND = "645142"
_DestroyusProMacro.SMALL_ROCK = "133287"
_DestroyusProMacro.GROUP_OF_SMALL_ROCKS = "134119"
_DestroyusProMacro.BOX_WITH_RED_DUST = "236995"
_DestroyusProMacro.BROWN_DUST = "133208"
_DestroyusProMacro.BLACK_BOWL = "1500969"
_DestroyusProMacro.WHITE_ROCKS = "961625"

-- Combat mode
_DestroyusProMacro.isCombatModeOn = false

-- Function is responsible for creating or deleting macro with specific name
function _DestroyusProMacro.ManageMacro(action, macro, icon, content)
    if not _DestroyusProMacro.isCombatModeOn then
        if action == _DestroyusProMacro.CREATE then
            _DestroyusProMacro.CreateMacro(macro, icon, "/click " .. content)
        elseif action == _DestroyusProMacro.DELETE then
            _DestroyusProMacro.DeleteMacro(macro)
        end
    end
end

-- Delete macro. If already deleted further action is not needed
function _DestroyusProMacro.DeleteMacro(macro)
    if _DestroyusProMacro.IsMacroCreated(macro) then
        if MacroFrame then
            if MacroFrame:IsVisible() then -- Macro frame is open
                MacroFrame:Hide()
                DeleteMacro(macro)
                MacroFrame:Show()
            else
                -- Macro frame is closed.
                DeleteMacro(macro)
            end
        else
            DeleteMacro(macro) -- Macro frame do not exist yet
        end
    end
end

-- Create macro. If already exist further action is not needed
function _DestroyusProMacro.CreateMacro(macro, icon, content)
    if _DestroyusProMacro.IsMacroCreated(macro) == false then
        if MacroFrame then
            if MacroFrame:IsVisible() then -- Macro frame is open
                MacroFrame:Hide()
                CreateMacro(macro, icon, content)
                MacroFrame:Show()
            else
                -- Macro frame is closed.
                CreateMacro(macro, icon, content)
            end
        else
            -- Macro frame do not exist yet.
            CreateMacro(macro, icon, content)
        end
    end
end

-- Check if macro is already created
function _DestroyusProMacro.IsMacroCreated(macro)
    return GetMacroInfo(macro) ~= nil
end
