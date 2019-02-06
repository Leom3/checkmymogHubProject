wowItemDB = {}

function getExpansion(itemName)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
	isCraftingReagent = GetItemInfo(itemName)

	--For Head Armor:
	if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_head_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_head_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_head_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_head_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end

	--For Shoulder Armor:
	if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_shoulder_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_shoulder_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_shoulder_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_shoulder_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end

	--For Body Armor:
	if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_chest_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_chest_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_chest_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_chest_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end

	--For Feet Armor:
	if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_foot_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_foot_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_foot_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_foot_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end

	--For Legs Armor:
	if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_leg_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_leg_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_leg_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_leg_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end

	--For Waist Armor:
	if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_belts_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_belts_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_belts_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_belts_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end

	--For Hand Armor:
	if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_hand_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_hand_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_hand_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_hand_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end

	--For Cloak:
	if (itemEquipLoc == "INVTYPE_CLOAK" and itemType == "Armor") then
		for key, value in pairs(cloaks_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end

	--For Weapon:
	if (itemType == "Weapon" and itemSubType == "Bows") then
		for key, value in pairs(bows_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Crossbows") then
		for key, value in pairs(crossbows_hand_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Daggers") then
		for key, value in pairs(daggers_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Guns") then
		for key, value in pairs(guns_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Fist Weapons") then
		for key, value in pairs(fist_weapons_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Axes") then
		for key, value in pairs(two_handed_axes_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Maces") then
		for key, value in pairs(two_handed_maces_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Swords") then
		for key, value in pairs(two_handed_swords_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Axes") then
		for key, value in pairs(one_handed_axes_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Maces") then
		for key, value in pairs(one_handed_maces_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Swords") then
		for key, value in pairs(one_handed_swords_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Polearms") then
		for key, value in pairs(polearms_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Staves") then
		for key, value in pairs(staves_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Wands") then
		for key, value in pairs(wands_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Warglaives") then
		for key, value in pairs(warglaives_db) do
			if (value.name == itemName) then
				return (value.expansion)
			end
		end
	end
	return ("Item not found")
end

wowItemDB.getExpansion = getExpansion

function getId(itemName)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
	isCraftingReagent = GetItemInfo(itemName)

	--For Head Armor:
	if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_head_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_head_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_head_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_head_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end

	--For Shoulder Armor:
	if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_shoulder_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_shoulder_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_shoulder_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_shoulder_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end

	--For Body Armor:
	if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_chest_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_chest_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_chest_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_chest_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end

	--For Feet Armor:
	if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_foot_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_foot_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_foot_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_foot_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end

	--For Legs Armor:
	if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_leg_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_leg_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_leg_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_leg_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end

	--For Waist Armor:
	if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_belts_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_belts_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_belts_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_belts_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end

	--For Hand Armor:
	if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_hand_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_hand_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_hand_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_hand_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end

	--For Cloak:
	if (itemEquipLoc == "INVTYPE_CLOAK" and itemType == "Armor") then
		for key, value in pairs(cloaks_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end

	--For Weapon:
	if (itemType == "Weapon" and itemSubType == "Bows") then
		for key, value in pairs(bows_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Crossbows") then
		for key, value in pairs(crossbows_hand_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Daggers") then
		for key, value in pairs(daggers_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Guns") then
		for key, value in pairs(guns_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Fist Weapons") then
		for key, value in pairs(fist_weapons_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Axes") then
		for key, value in pairs(two_handed_axes_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Maces") then
		for key, value in pairs(two_handed_maces_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Swords") then
		for key, value in pairs(two_handed_swords_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Axes") then
		for key, value in pairs(one_handed_axes_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Maces") then
		for key, value in pairs(one_handed_maces_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Swords") then
		for key, value in pairs(one_handed_swords_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Polearms") then
		for key, value in pairs(polearms_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Staves") then
		for key, value in pairs(staves_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Wands") then
		for key, value in pairs(wands_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Warglaives") then
		for key, value in pairs(warglaives_db) do
			if (value.name == itemName) then
				return (value.id)
			end
		end
	end
	return ("Item not found")
end

wowItemDB.getId = getId

function getTerritory(itemName)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
	isCraftingReagent = GetItemInfo(itemName)

	--For Head Armor:
	if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_head_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_head_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_head_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_head_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end

	--For Shoulder Armor:
	if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_shoulder_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_shoulder_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_shoulder_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_shoulder_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end

	--For Body Armor:
	if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_chest_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_chest_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_chest_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_chest_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end

	--For Feet Armor:
	if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_foot_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_foot_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_foot_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_foot_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end

	--For Legs Armor:
	if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_leg_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_leg_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_leg_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_leg_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end

	--For Waist Armor:
	if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_belts_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_belts_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_belts_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_belts_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end

	--For Hand Armor:
	if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_hand_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_hand_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_hand_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_hand_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end

	--For Cloak:
	if (itemEquipLoc == "INVTYPE_CLOAK" and itemType == "Armor") then
		for key, value in pairs(cloaks_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end

	--For Weapon:
	if (itemType == "Weapon" and itemSubType == "Bows") then
		for key, value in pairs(bows_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Crossbows") then
		for key, value in pairs(crossbows_hand_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Daggers") then
		for key, value in pairs(daggers_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Guns") then
		for key, value in pairs(guns_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Fist Weapons") then
		for key, value in pairs(fist_weapons_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Axes") then
		for key, value in pairs(two_handed_axes_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Maces") then
		for key, value in pairs(two_handed_maces_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Swords") then
		for key, value in pairs(two_handed_swords_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Axes") then
		for key, value in pairs(one_handed_axes_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Maces") then
		for key, value in pairs(one_handed_maces_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Swords") then
		for key, value in pairs(one_handed_swords_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Polearms") then
		for key, value in pairs(polearms_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Staves") then
		for key, value in pairs(staves_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Wands") then
		for key, value in pairs(wands_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Warglaives") then
		for key, value in pairs(warglaives_db) do
			if (value.name == itemName) then
				return (value.territory)
			end
		end
	end
	return ("Item not found")
end

wowItemDB.getTerritory = getTerritory

function getCategoryTerritory(itemName)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
	isCraftingReagent = GetItemInfo(itemName)

	--For Head Armor:
	if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_head_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_head_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_head_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_head_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end

	--For Shoulder Armor:
	if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_shoulder_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_shoulder_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_shoulder_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_shoulder_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end

	--For Body Armor:
	if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_chest_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_chest_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_chest_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_chest_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end

	--For Feet Armor:
	if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_foot_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_foot_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_foot_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_foot_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end

	--For Legs Armor:
	if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_leg_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_leg_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_leg_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_leg_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end

	--For Waist Armor:
	if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_belts_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_belts_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_belts_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_belts_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end

	--For Hand Armor:
	if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_hand_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_hand_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_hand_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_hand_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end

	--For Cloak:
	if (itemEquipLoc == "INVTYPE_CLOAK" and itemType == "Armor") then
		for key, value in pairs(cloaks_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end

	--For Weapon:
	if (itemType == "Weapon" and itemSubType == "Bows") then
		for key, value in pairs(bows_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Crossbows") then
		for key, value in pairs(crossbows_hand_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Daggers") then
		for key, value in pairs(daggers_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Guns") then
		for key, value in pairs(guns_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Fist Weapons") then
		for key, value in pairs(fist_weapons_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Axes") then
		for key, value in pairs(two_handed_axes_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Maces") then
		for key, value in pairs(two_handed_maces_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Swords") then
		for key, value in pairs(two_handed_swords_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Axes") then
		for key, value in pairs(one_handed_axes_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Maces") then
		for key, value in pairs(one_handed_maces_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Swords") then
		for key, value in pairs(one_handed_swords_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Polearms") then
		for key, value in pairs(polearms_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Staves") then
		for key, value in pairs(staves_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Wands") then
		for key, value in pairs(wands_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Warglaives") then
		for key, value in pairs(warglaives_db) do
			if (value.name == itemName) then
				return (value.category_territory)
			end
		end
	end
	return ("Item not found")
end

wowItemDB.getCategoryTerritory = getCategoryTerritory

function getDropRate(itemName)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
	isCraftingReagent = GetItemInfo(itemName)

	--For Head Armor:
	if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_head_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_head_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_head_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_head_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end

	--For Shoulder Armor:
	if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_shoulder_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_shoulder_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_shoulder_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_shoulder_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end

	--For Body Armor:
	if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_chest_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_chest_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_chest_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_chest_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end

	--For Feet Armor:
	if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_foot_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_foot_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_foot_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_foot_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end

	--For Legs Armor:
	if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_leg_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_leg_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_leg_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_leg_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end

	--For Waist Armor:
	if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_belts_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_belts_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_belts_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_belts_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end

	--For Hand Armor:
	if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_hand_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_hand_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_hand_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_hand_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end

	--For Cloak:
	if (itemEquipLoc == "INVTYPE_CLOAK" and itemType == "Armor") then
		for key, value in pairs(cloaks_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end

	--For Weapon:
	if (itemType == "Weapon" and itemSubType == "Bows") then
		for key, value in pairs(bows_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Crossbows") then
		for key, value in pairs(crossbows_hand_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Daggers") then
		for key, value in pairs(daggers_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Guns") then
		for key, value in pairs(guns_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Fist Weapons") then
		for key, value in pairs(fist_weapons_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Axes") then
		for key, value in pairs(two_handed_axes_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Maces") then
		for key, value in pairs(two_handed_maces_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Swords") then
		for key, value in pairs(two_handed_swords_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Axes") then
		for key, value in pairs(one_handed_axes_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Maces") then
		for key, value in pairs(one_handed_maces_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Swords") then
		for key, value in pairs(one_handed_swords_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Polearms") then
		for key, value in pairs(polearms_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Staves") then
		for key, value in pairs(staves_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Wands") then
		for key, value in pairs(wands_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Warglaives") then
		for key, value in pairs(warglaives_db) do
			if (value.name == itemName) then
				return (value.drop_rate)
			end
		end
	end
	return ("Item not found")
end

wowItemDB.getDropRate = getDropRate

function getSource(itemName)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
	isCraftingReagent = GetItemInfo(itemName)

	--For Head Armor:
	if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_head_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_head_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_head_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_head_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end

	--For Shoulder Armor:
	if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_shoulder_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_shoulder_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_shoulder_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_shoulder_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end

	--For Body Armor:
	if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_chest_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_chest_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_chest_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_chest_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end

	--For Feet Armor:
	if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_foot_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_foot_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_foot_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_foot_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end

	--For Legs Armor:
	if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_leg_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_leg_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_leg_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_leg_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end

	--For Waist Armor:
	if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_belts_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_belts_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_belts_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_belts_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end

	--For Hand Armor:
	if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_hand_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_hand_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_hand_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_hand_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end

	--For Cloak:
	if (itemEquipLoc == "INVTYPE_CLOAK" and itemType == "Armor") then
		for key, value in pairs(cloaks_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end

	--For Weapon:
	if (itemType == "Weapon" and itemSubType == "Bows") then
		for key, value in pairs(bows_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Crossbows") then
		for key, value in pairs(crossbows_hand_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Daggers") then
		for key, value in pairs(daggers_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Guns") then
		for key, value in pairs(guns_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Fist Weapons") then
		for key, value in pairs(fist_weapons_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Axes") then
		for key, value in pairs(two_handed_axes_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Maces") then
		for key, value in pairs(two_handed_maces_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Swords") then
		for key, value in pairs(two_handed_swords_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Axes") then
		for key, value in pairs(one_handed_axes_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Maces") then
		for key, value in pairs(one_handed_maces_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Swords") then
		for key, value in pairs(one_handed_swords_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Polearms") then
		for key, value in pairs(polearms_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Staves") then
		for key, value in pairs(staves_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Wands") then
		for key, value in pairs(wands_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Warglaives") then
		for key, value in pairs(warglaives_db) do
			if (value.name == itemName) then
				return (value.source)
			end
		end
	end
	return ("Item not found")
end

wowItemDB.getSource = getSource

function getLocation(itemName)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
	isCraftingReagent = GetItemInfo(itemName)
	--print (itemType)
	--print (itemSubType)
	--print (itemIcon)

	--For Head Armor:
	if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_head_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_head_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_head_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_head_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Shoulder Armor:
	if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_shoulder_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_shoulder_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_shoulder_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_shoulder_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Body Armor:
	if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_chest_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_chest_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_chest_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_chest_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Feet Armor:
	if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_foot_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_foot_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_foot_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_foot_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Legs Armor:
	if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_leg_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_leg_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_leg_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_leg_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Waist Armor:
	if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_belts_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_belts_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_belts_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_belts_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Hand Armor:
	if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Cloth") then
		for key, value in pairs(cloth_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Leather") then
		for key, value in pairs(leather_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Mail") then
		for key, value in pairs(mail_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Plate") then
		for key, value in pairs(plate_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Cloak:
	if (itemEquipLoc == "INVTYPE_CLOAK" and itemType == "Armor") then
		for key, value in pairs(cloaks_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Weapon:
	if (itemType == "Weapon" and itemSubType == "Bows") then
		for key, value in pairs(bows_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Crossbows") then
		for key, value in pairs(crossbows_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Daggers") then
		for key, value in pairs(daggers_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Guns") then
		for key, value in pairs(guns_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Fist Weapons") then
		for key, value in pairs(fist_weapons_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Axes") then
		for key, value in pairs(two_handed_axes_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Maces") then
		for key, value in pairs(two_handed_maces_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Two-Handed Swords") then
		for key, value in pairs(two_handed_swords_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Axes") then
		for key, value in pairs(one_handed_axes_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Maces") then
		for key, value in pairs(one_handed_maces_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "One-Handed Swords") then
		for key, value in pairs(one_handed_swords_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Polearms") then
		for key, value in pairs(polearms_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Staves") then
		for key, value in pairs(staves_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Wands") then
		for key, value in pairs(wands_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	elseif (itemType == "Weapon" and itemSubType == "Warglaives") then
		for key, value in pairs(warglaives_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end
	return ("Item not found")
end

wowItemDB.getLocation = getLocation