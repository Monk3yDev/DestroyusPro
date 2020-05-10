_DestroyusProItems = {}
_DestroyusProItems.ARMORS_CLASS_ID = 4
_DestroyusProItems.MISCELLANEOUS_SUBCLASS_ID = 0
_DestroyusProItems.CLOTH_SUBCLASS_ID = 1
_DestroyusProItems.LEATHER_SUBCLASS_ID = 2
_DestroyusProItems.MAIL_SUBCLASS_ID = 3
_DestroyusProItems.PLATE_SUBCLASS_ID = 4
_DestroyusProItems.SHIELDS_SUBCLASS_ID = 6

_DestroyusProItems.WEAPONS_CLASS_ID = 2
_DestroyusProItems.ONE_HANDED_AXES_SUBCLASS_ID = 0
_DestroyusProItems.TWO_HANDED_AXES_SUBCLASS_ID = 1
_DestroyusProItems.BOWS_SUBCLASS_ID = 2
_DestroyusProItems.GUNS_SUBCLASS_ID = 3
_DestroyusProItems.ONE_HANDED_MACES_SUBCLASS_ID = 4
_DestroyusProItems.TWO_HANDED_MACES_SUBCLASS_ID = 5
_DestroyusProItems.POLEARMS_SUBCLASS_ID = 6
_DestroyusProItems.ONE_HANDED_SWORD_SUBCLASS_ID = 7
_DestroyusProItems.TWO_HANDED_SWORD_SUBCLASS_ID = 8
_DestroyusProItems.WARGLAIVES_SUBCLASS_ID = 9
_DestroyusProItems.STAVES_SUBCLASS_ID = 10
_DestroyusProItems.FIST_WEAPONS_SUBCLASS_ID = 13
_DestroyusProItems.DAGGERS_SUBCLASS_ID = 15
_DestroyusProItems.WANDS_SUBCLASS_ID = 19
_DestroyusProItems.CROSSBOWS_SUBCLASS_ID = 18

_DestroyusProItems.GEMS_CLASS_ID = 3
_DestroyusProItems.ARTIFACT_RELIC_SUBCLASS_ID = 11

_DestroyusProItems.INVTYPE_TRINKET = "INVTYPE_TRINKET"
_DestroyusProItems.INVTYPE_NECK = "INVTYPE_NECK"
_DestroyusProItems.INVTYPE_FINGER = "INVTYPE_FINGER"
_DestroyusProItems.INVTYPE_HOLDABLE = "INVTYPE_HOLDABLE"

_DestroyusProItemsCharacteristic = {}
-- Helper function to add material to the list
function _DestroyusProAddItem(_classID, _subClassID)
    table.insert(_DestroyusProItemsCharacteristic, {classID=_classID, subClassID=_subClassID})
end

_DestroyusProAddItem(_DestroyusProItems.ARMORS_CLASS_ID, _DestroyusProItems.MISCELLANEOUS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.ARMORS_CLASS_ID, _DestroyusProItems.CLOTH_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.ARMORS_CLASS_ID, _DestroyusProItems.LEATHER_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.ARMORS_CLASS_ID, _DestroyusProItems.MAIL_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.ARMORS_CLASS_ID, _DestroyusProItems.PLATE_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.ARMORS_CLASS_ID, _DestroyusProItems.SHIELDS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.ONE_HANDED_AXES_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.TWO_HANDED_AXES_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.BOWS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.GUNS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.ONE_HANDED_MACES_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.TWO_HANDED_MACES_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.POLEARMS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.ONE_HANDED_SWORD_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.TWO_HANDED_SWORD_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.WARGLAIVES_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.STAVES_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.FIST_WEAPONS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.DAGGERS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.WANDS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.WEAPONS_CLASS_ID, _DestroyusProItems.CROSSBOWS_SUBCLASS_ID)
_DestroyusProAddItem(_DestroyusProItems.GEMS_CLASS_ID, _DestroyusProItems.ARTIFACT_RELIC_SUBCLASS_ID)

-- Check if item belong to specific class and subclass
function _DestroyusProItems.IsItem(classID, subClassID, equipSlot)
    for i = 1, #_DestroyusProItemsCharacteristic do
        if _DestroyusProItemsCharacteristic[i].classID == classID and
           _DestroyusProItemsCharacteristic[i].subClassID == subClassID then
            -- Additional check for Rings, Trinkets, Holdable, Necks
            if classID == _DestroyusProItems.ARMORS_CLASS_ID and
               subClassID == _DestroyusProItems.MISCELLANEOUS_SUBCLASS_ID then
                return _DestroyusProItems.IsMiscellaneous(equipSlot)
            else
                return true
            end
        end
    end
    return false
end

-- Check if equipment slot is from Rings, Trinkets, Holdable, Necks
function _DestroyusProItems.IsMiscellaneous(equipSlot)
    return (equipSlot == _DestroyusProItems.INVTYPE_FINGER or
           equipSlot == _DestroyusProItems.INVTYPE_NECK or
           equipSlot == _DestroyusProItems.INVTYPE_TRINKET or
           equipSlot == _DestroyusProItems.INVTYPE_HOLDABLE)
end

-- Check if item quality is allowed
function _DestroyusProItems.IsItemQualityAllowed(quality)
    return _G["DestroyusProItemQualityValue"]["uncommon"] == quality or
       _G["DestroyusProItemQualityValue"]["rare"] == quality or
       _G["DestroyusProItemQualityValue"]["epic"] == quality
end

-- Check if itemID exist in black list
function _DestroyusProItems.IsItemOnList(itemID)
    local blackList = _G["DestroyusProBlackList"]
    for	i = 1, #blackList do
        if itemID == blackList[i] then
            return true
        end
    end
    return false
end

-- Manage black list depending on commandType
function _DestroyusProItems.ManageBlackList(itemLink, commandType)
    local itemID = GetItemInfoInstant(itemLink)
    local itemIndex = nil
    local blackList = _G["DestroyusProBlackList"]
    if itemID then
        for	i = 1, #blackList do
            if itemID == blackList[i] then
                itemIndex = i
                break
            end
        end
        if commandType == _DestroyusProCommandType.ADD_ITEM then
            if itemIndex then
                _DestroyusProUtils.Print(string.format("Item %s is already on the black list", itemLink))
            else
                _DestroyusProUtils.Print(string.format("Adding %s to the black list", itemLink))
                table.insert(_G["DestroyusProBlackList"], itemID)
            end
        elseif commandType == _DestroyusProCommandType.REMOVE_ITEM then
            if itemIndex then
                _DestroyusProUtils.Print(string.format("Removing %s item from the black list", itemLink))
                table.remove(_G["DestroyusProBlackList"], itemIndex)
            else
                _DestroyusProUtils.Print(string.format("Item %s is already removed from the black list", itemLink))
            end
        end
    else
        _DestroyusProUtils.Print(string.format("Link data is corrupted '%s'", itemLink))
    end
end

-- Main check based of classID and subClassID with itemEquipLocalization
-- Let's skip locked items
-- Let's skip items ID from black list
-- Let's skip items which are part of the set
function _DestroyusProItems.IsItemForDisenchanting(bagID, slotIndex)
    local itemLocation = ItemLocation:CreateFromBagAndSlot(bagID, slotIndex)
    if C_Item.DoesItemExist(itemLocation) then
        local itemID = C_Item.GetItemID(itemLocation)
        local _, _, _, itemEquipLoc, _, classID, subClassID = GetItemInfoInstant(itemID)
        return _DestroyusProItems.IsItemQualityAllowed(C_Item.GetItemQuality(itemLocation)) and
            C_Item.IsLocked(itemLocation) == false and
            _DestroyusProItems.IsItem(classID, subClassID, itemEquipLoc) and
            _DestroyusProItems.IsItemOnList(itemID) == false and
            _DestroyusProItems.IsPartOfSet(bagID, slotIndex) == false
    end
end

-- TODO Change in patch 9.0
-- LE_ITEM_QUALITY_UNCOMMON Enum.ItemQuality.Uncommon
-- LE_ITEM_QUALITY_RARE -> Enum.ItemQuality.Superior
-- LE_ITEM_QUALITY_EPIC -> Enum.ItemQuality.Epic
-- Convert number to global strings
function _DestroyusProItems.ItemQualityToString(quality)
    if quality == LE_ITEM_QUALITY_UNCOMMON then
        return ITEM_QUALITY2_DESC
    elseif quality == LE_ITEM_QUALITY_RARE then
        return ITEM_QUALITY3_DESC
    elseif quality == LE_ITEM_QUALITY_EPIC then
        return ITEM_QUALITY4_DESC
    end
    return ""
end

-- Check if item is part of Equipment Set
function _DestroyusProItems.IsPartOfSet(bagID, slotIndex)
    local sets = C_EquipmentSet.GetEquipmentSetIDs()
    for i = 1, #sets do
        for _, location in pairs(C_EquipmentSet.GetItemLocations(sets[i])) do
            local _, _, _, _, _slotIndex, _bagID, _, _ = EquipmentManager_UnpackLocation(location) -- EquipmentManager.lua
            if (bagID == _bagID) and (_slotIndex == slotIndex) then
                return true
            end
        end
    end
    return false
end
