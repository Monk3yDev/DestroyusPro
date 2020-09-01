# DestroyusPro

Addon searching items in personal containers which later will be disenchanted, milled or prospected. Items which do not meet requirements are omitted from the search. Additional DestroyusPro macros automatically collect all materials from the loot window.

## Quick Start

- Install addon in the WoW addons location
- Login to the game and open panel using /despro command in chat window
- Create macros using panel options
- Use button "Calibration" to scan already known mass spells in character
- Open /macro panel from chat window and move addon macros to the skill bar

## Mass Mill and Prospect Overview

To use properly mass techniques "calibration" of the actual learned recipes must be performed, before starting using mass mill/prospect macros. One time is enough. In case of any problem calibration can be reused. Macros must be pressed 3 times in a row during 2 seconds to select properly recipe and amount of repeating.

- First macro press open TradeSkill
- Second macro press select recipe and amount
- Third macro press start work

## Macro Type

- Disenchanting - "DesProDisenchant": Disenchant items from the selected quality in the settings
- Milling - "DesProMilling": Classic milling for all herbs
- Prospecting - "DesProProspect": Classic prospecting for all ores
- Mass Mill Battle for Azeroth - "DesProMMAzeroth": Mill herbs using learned mass mill techniques
- Mass Prospect Battle for Azeroth - "DesProMPAzeroth": Prospect ores using learned mass prospect techniques
- Mass Mill Legion - "DesProMMLegion": Mill herbs using learned mass mill techniques
- Mass Prospect Legion - "DesProMPLegion": Prospect ores using learned mass prospect techniques
- Mass Mill Shadowlands - "DesProMMShadowlands": Mill herbs using learned mass mill techniques
- Mass Prospect Shadowlands - "DesProMPShadowlands": Prospect ores using learned mass prospect techniques

## Disenchanting

- Skip items which are part of set saved in EquipmentManger
- Skip items from unwanted quality
- Skip items from the blacklist (default list)
- When whitelist is active disenchanting will be performed only on items from this list
- Whitelist is activated per character
- Blacklist is activated in global scope
- ItemID can be added or removed from blacklist/whitelist in addon panel by drag and drop item from inventory

## How open addon panel

- /despro

## Other information

- Be careful during using disenchanting macro
- Addon should work with all languages clients
- Only English localization is used
- All has beed tested in default WoW UI

## Reporting issues and improvements

- Issues and improvements should be registered in the GitHub
