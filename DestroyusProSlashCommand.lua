_DestroyusProCommand = {}
SLASH_DESPRO1 = '/despro'  --destroyuspro

-- Handle unknown command content
function _DestroyusProCommand.UnknownCommand(command)
    if command == nil then
        command = ""
    end
    local commandMsg = "Unknown value for the command: %s"
    _DestroyusProUtils.Print(commandMsg:format(command))
end

-- Callback function during executing command
function _DestroyusProCommand.CallbackDestroyusPro(msg, editBox)
    if msg == "" then
        if _DestroyusProManagerFrame:IsVisible() then
            _DestroyusProManagerFrame:Hide()
            _DestroyusProManagerUI.OnClickCallbackItemManager(DisplayIconButton, "RightButton")
        else
            _DestroyusProManagerFrame:Show()
        end
    else
        _DestroyusProCommand.UnknownCommand(msg)
    end
end

SlashCmdList["DESPRO"] = _DestroyusProCommand.CallbackDestroyusPro
