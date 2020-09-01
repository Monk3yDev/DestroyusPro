-- Helper function to add material to the list
function _DestroyusProAddMaterial(materialList, _itemID, _itemName, _massSpellID, _expansionID)
    materialList[_itemID] = {itemName=_itemName, massSpellID=_massSpellID, expansionID=_expansionID}
end

_DestroyusProHerbs = {}
-- Shadowlands
_DestroyusProAddMaterial(_DestroyusProHerbs, 169701, "Death Blossom", _DestroyusProSpellID.MASS_MILL_DEATHBLOSSOM, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProHerbs, 168589, "Marrowroot", _DestroyusProSpellID.MASS_MILL_MARROWROOT, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProHerbs, 168586, "Rising Glory", _DestroyusProSpellID.MASS_MILL_RISINGGLORY, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProHerbs, 170554, "Vigil's Torch", _DestroyusProSpellID.MASS_MILL_VIGILTORCH, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProHerbs, 168583, "Widowbloom", _DestroyusProSpellID.MASS_MILL_WIDOWBLOOM, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProHerbs, 171315, "Nightshade", _DestroyusProSpellID.MASS_MILL_NIGHTSHADE, _DestroyusProExpansionID.SHADOWLANDS)

-- Battle for Azeroth
_DestroyusProAddMaterial(_DestroyusProHerbs, 152510, "Anchor Weed", _DestroyusProSpellID.MASS_MILL_ANCHORWEED, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProHerbs, 152505, "Riverbud", _DestroyusProSpellID.MASS_MILL_RIVERBUD, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProHerbs, 152506, "Star Moss", _DestroyusProSpellID.MASS_MILL_STARMOSS, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProHerbs, 152507, "Akunda's Bite", _DestroyusProSpellID.MASS_MILL_AKUNDASBITE, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProHerbs, 152508, "Winter's Kiss", _DestroyusProSpellID.MASS_MILL_WINTERSKISS, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProHerbs, 152509, "Siren's Pollen", _DestroyusProSpellID.MASS_MILL_SIRENSPOLLEN, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProHerbs, 152511, "Sea Stalk", _DestroyusProSpellID.MASS_MILL_SEASTALK, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProHerbs, 168487, "Zin'anthid", _DestroyusProSpellID.MASS_MILL_ZINANTHID, _DestroyusProExpansionID.BFA)
-- Legion
_DestroyusProAddMaterial(_DestroyusProHerbs, 151565, "Astral Glory", _DestroyusProSpellID.MASS_MILL_ASTRALGLORY, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProHerbs, 124101, "Aethril", _DestroyusProSpellID.MASS_MILL_AETHRIL, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProHerbs, 124102, "Dreamleaf", _DestroyusProSpellID.MASS_MILL_DREAMLEAF, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProHerbs, 124106, "Felwort", _DestroyusProSpellID.MASS_MILL_FELWORT, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProHerbs, 124104, "Fjarnskaggl", _DestroyusProSpellID.MASS_MILL_FJARNSKAGGL, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProHerbs, 124103, "Foxflower", _DestroyusProSpellID.MASS_MILL_FOXFLOWER, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProHerbs, 124105, "Starlight Rose", _DestroyusProSpellID.MASS_MILL_STARLIGHTROSE, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProHerbs, 128304, "Yseralline Seed", _DestroyusProSpellID.MASS_MILL_YSERALLINESEEDS, _DestroyusProExpansionID.LEGION)
-- Dreanor
_DestroyusProAddMaterial(_DestroyusProHerbs, 109124, "Frostweed", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 109127, "Starflower", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 109125, "Fireweed", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 109126, "Gorgrond Flytrap", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 109129, "Talador Orchid", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 109128, "Nagrand Arrowbloom", nil, _DestroyusProExpansionID.OTHER)
-- Classic
_DestroyusProAddMaterial(_DestroyusProHerbs, 2447, "Peacebloom", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 765, "Silverleaf", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 2449, "Earthroot", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 785, "Mageroyal", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 2450, "Briarthorn", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 2452, "Swiftthistle", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 2453, "Bruiseweed", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3820, "Stranglekelp", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3357, "Liferoot", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3356, "Kingsblood", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3369, "Grave Moss", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3355, "Wild Steelbloom", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3818, "Fadeleaf", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3821, "Goldthorn", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3358, "Khadgar's Whisker", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 3819, "Dragon's Teeth", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 4625, "Firebloom", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 8831, "Purple Lotus", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 8836, "Arthas' Tears", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 8838, "Sungrass", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 8839, "Blindweed", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 8845, "Ghost Mushroom", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 8846, "Gromsblood", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 13464, "Golden Sansam", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 13463, "Dreamfoil", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 13465, "Mountain Silversage", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 13466, "Sorrowmoss", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 13467, "Icecap", nil, _DestroyusProExpansionID.OTHER)
-- TBC
_DestroyusProAddMaterial(_DestroyusProHerbs, 22785, "Felweed", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 22786, "Dreaming Glory", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 22787, "Ragveil", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 22789, "Terocone", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 22790, "Ancient Lichen", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 22791, "Netherbloom", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 22792, "Nightmare Vine", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 22793, "Mana Thistle", nil, _DestroyusProExpansionID.OTHER)
-- Lich King
_DestroyusProAddMaterial(_DestroyusProHerbs, 36901, "Goldclover", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 39970, "Fire Leaf", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 36904, "Tiger Lily", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 36907, "Talandra's Rose", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 36903, "Adder's Tongue", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 37921, "Deadnettle", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 36905, "Lichbloom", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 36906, "Icethorn", nil, _DestroyusProExpansionID.OTHER)
-- Cata
_DestroyusProAddMaterial(_DestroyusProHerbs, 52983, "Cinderbloom", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 52985, "Azshara's Veil", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 52984, "Stormvine", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 52988, "Whiptail", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 52986, "Heartblossom", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 52987, "Twilight Jasmine", nil, _DestroyusProExpansionID.OTHER)
-- Pandas
_DestroyusProAddMaterial(_DestroyusProHerbs, 72234, "Green Tea Leaf", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 72237, "Rain Poppy", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 72235, "Silkweed", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 79010, "Snow Lily", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 79011, "Fool's Cap", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProHerbs, 89639, "Desecrated Herb", nil, _DestroyusProExpansionID.OTHER)

-- Ore 
_DestroyusProOres = {}
-- Shadowlands
_DestroyusProAddMaterial(_DestroyusProOres, 171828, "Laestrite Ore", _DestroyusProSpellID.MASS_PROSPECT_LAESTRITE, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProOres, 171830, "Oxxein Ore", _DestroyusProSpellID.MASS_PROSPECT_OXXEIN, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProOres, 171831, "Phaedrum Ore", _DestroyusProSpellID.MASS_PROSPECT_PHAEDRUM, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProOres, 171832, "Sinvyr Ore", _DestroyusProSpellID.MASS_PROSPECT_SINVYR, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProOres, 171829, "Solenium Ore", _DestroyusProSpellID.MASS_PROSPECT_SOLENIUM, _DestroyusProExpansionID.SHADOWLANDS)
_DestroyusProAddMaterial(_DestroyusProOres, 171833, "Elethium Ore", _DestroyusProSpellID.MASS_PROSPECT_ELETHIUM, _DestroyusProExpansionID.SHADOWLANDS)

-- Battle for Azeroth
_DestroyusProAddMaterial(_DestroyusProOres, 152513, "Platinum Ore", _DestroyusProSpellID.MASS_PROSPECT_PLATINUM, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProOres, 152512, "Monelite Ore", _DestroyusProSpellID.MASS_PROSPECT_MONELITE, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProOres, 152579, "Storm Silver Ore", _DestroyusProSpellID.MASS_PROSPECT_STORMSILVER, _DestroyusProExpansionID.BFA)
_DestroyusProAddMaterial(_DestroyusProOres, 168185, "Osmenite Ore", _DestroyusProSpellID.MASS_PROSPECT_OSMENITE, _DestroyusProExpansionID.BFA)
-- Legion
_DestroyusProAddMaterial(_DestroyusProOres, 151564, "Empyrium", _DestroyusProSpellID.MASS_PROSPECT_EMPYRIUM, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProOres, 123918, "Leystone Ore", _DestroyusProSpellID.MASS_PROSPECT_LEYSTONE, _DestroyusProExpansionID.LEGION)
_DestroyusProAddMaterial(_DestroyusProOres, 123919, "Felslate", _DestroyusProSpellID.MASS_PROSPECT_FELSLATE, _DestroyusProExpansionID.LEGION)
-- Other
_DestroyusProAddMaterial(_DestroyusProOres, 2770, "Copper Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 2771, "Tin Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 2772, "Iron Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 3858, "Mithril Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 10620, "Thorium Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 23424, "Fel Iron Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 23425, "Adamantite Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 36909, "Cobalt Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 36912, "Saronite Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 36910, "Titanium Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 53038, "Obsidium Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 52185, "Elementium Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 52183, "Pyrite Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 72092, "Ghost Iron Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 72093, "Kyparite", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 72103, "White Trillium Ore", nil, _DestroyusProExpansionID.OTHER)
_DestroyusProAddMaterial(_DestroyusProOres, 72094, "Black Trillium Ore", nil, _DestroyusProExpansionID.OTHER)

_DestroyusProMaterials = {}

-- Check if itemID is on the list
function _DestroyusProMaterials.IsItemOnList(itemID, list)
    for materialID, _ in pairs(list) do
        if materialID == itemID then
            return true
        end
    end
    return false
end

-- Check if spellID is on the material lists
function _DestroyusProMaterials.IsSpellInMaterials(spellID)
    for _, data in pairs(_DestroyusProHerbs) do
        if data.massSpellID == spellID then
            return true
        end
    end
    for _, data in pairs(_DestroyusProOres) do
        if data.massSpellID == spellID then
            return true
        end
    end
    return false
end

-- Check if item from specific bag location contain material item from the list
function _DestroyusProMaterials.IsMaterialItem(bagID, slotIndex, materials)
    local itemLocation = ItemLocation:CreateFromBagAndSlot(bagID, slotIndex)
    if C_Item.DoesItemExist(itemLocation) then
        return C_Item.IsLocked(itemLocation) == false and
               C_Item.GetStackCount(itemLocation) >= _DestroyusProStackSize.CLASSIC and
               _DestroyusProMaterials.IsItemOnList(C_Item.GetItemID(itemLocation), materials)
    end
    return false
end

-- Check if item in bag can be milled
function _DestroyusProMaterials.IsItemForMilling(bagID, slotIndex)
    return _DestroyusProMaterials.IsMaterialItem(bagID, slotIndex, _DestroyusProHerbs)
end

-- Check if item in bag is prospected
function _DestroyusProMaterials.IsItemForProspecting(bagID, slotIndex)
    return _DestroyusProMaterials.IsMaterialItem(bagID, slotIndex, _DestroyusProOres)
end

-- Select materials from specific expansion and profession
function _DestroyusProMaterials.SelectMaterials(expansionID, professionID)
    local materials = {}
    if professionID == _DestroyusProTradeSkill.INSCRIPTION then
        materials = _DestroyusProHerbs
    elseif professionID == _DestroyusProTradeSkill.JEWELCRAFTING then
        materials = _DestroyusProOres
    end
    local selectedMaterials = {}
    for materialID, data in pairs(materials) do
        if data.expansionID == expansionID then
            selectedMaterials[materialID] = data
        end
    end
    return selectedMaterials
end

-- Select mass spellID from specific expansion and profession
function _DestroyusProMaterials.SelectMassSpells(expansionID, professionID)
    local materials = {}
    if professionID == _DestroyusProTradeSkill.INSCRIPTION then
        materials = _DestroyusProHerbs
    elseif professionID == _DestroyusProTradeSkill.JEWELCRAFTING then
        materials = _DestroyusProOres
    end
    local selectedSpells = {}
    for _, data in pairs(materials) do
        if data.expansionID == expansionID and data.massSpellID ~= nil then
            table.insert(selectedSpells, data.massSpellID)
        end
    end
    return selectedSpells
end

-- Count materials in container and extend materials table with total stack count variable
function _DestroyusProMaterials.CountMaterials(materials)
    for _, data in pairs(materials) do
        data.totalStackCount = 0
    end
    for bagID = 0, NUM_BAG_SLOTS do
        for slotIndex = 1, GetContainerNumSlots(bagID) do
            local itemLocation = ItemLocation:CreateFromBagAndSlot(bagID, slotIndex)
            if C_Item.DoesItemExist(itemLocation) then
                local itemID = C_Item.GetItemID(itemLocation)
                if _DestroyusProMaterials.IsItemOnList(itemID, materials) then
                    materials[itemID].totalStackCount = materials[itemID].totalStackCount + C_Item.GetStackCount(itemLocation)
                end
            end
        end
    end
end

-- Select Mass SpellID to cast with total number of attempts
function _DestroyusProMaterials.SelectSpellToCast(learnedSpells, expansionID, professionID)
    local materials = _DestroyusProMaterials.SelectMaterials(expansionID, professionID)
    _DestroyusProMaterials.CountMaterials(materials)
    for i = 1 , #learnedSpells do
        local spellID = learnedSpells[i]
        for _, data in pairs(materials) do
            if data.massSpellID == spellID and data.totalStackCount >= _DestroyusProStackSize.TRADE_SKILL then
                return spellID, floor(data.totalStackCount / _DestroyusProStackSize.TRADE_SKILL)
            end
        end
    end
    return nil
end
