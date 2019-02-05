local checkMyMog = {}

function checkMyMog.getLocation(itemName)
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
	isCraftingReagent = GetItemInfo(itemName)
	print(itemEquipLoc);
	print(itemType);
	print(itemSubType);

	--For Head Armor:
	if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Cloth") then
		require("./final_DB/cloth-head_db");
		for key, value in pairs(cloth_head_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Leather") then
		require("./final_DB/leather-head_db")
		for key, value in pairs(leather_head_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Mail") then
		require("./final_DB/mail-head_db")
		for key, value in pairs(mail_head_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_HEAD" and itemType == "Armor" and itemSubType == "Plate") then
		require("./final_DB/plate-head_db")
		for key, value in pairs(plate_head_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Shoulder Armor:
	if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Cloth") then
		require("./final_DB/cloth-shoulder_db");
		for key, value in pairs(cloth_shoulder_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Leather") then
		require("./final_DB/leather-shoulder_db");
		for key, value in pairs(leather_shoulder_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Mail") then
		require("./final_DB/mail-shoulder_db");
		for key, value in pairs(mail_shoulder_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_SHOULDER" and itemType == "Armor" and itemSubType == "Plate") then
		require("./final_DB/plate-shoulder_db");
		for key, value in pairs(plate_shoulder_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Body Armor:
	if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Cloth") then
		require("./final_DB/cloth-chest_db");
		for key, value in pairs(cloth_chest_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Leather") then
		require("./final_DB/leather-chest_db");
		for key, value in pairs(leather_chest_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Mail") then
		require("./final_DB/mail-chest_db");
		for key, value in pairs(mail_chest_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_BODY" and itemType == "Armor" and itemSubType == "Plate") then
		require("./final_DB/plate-chest_db");
		for key, value in pairs(plate_chest_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Feet Armor:
	if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Cloth") then
		require("./final_DB/cloth-foot_db");
		for key, value in pairs(cloth_foot_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Leather") then
		require("./final_DB/leather-foot_db");
		for key, value in pairs(leather_foot_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Mail") then
		require("./final_DB/mail-foot_db");
		for key, value in pairs(mail_foot_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_FEET" and itemType == "Armor" and itemSubType == "Plate") then
		require("./final_DB/plate-foot_db");
		for key, value in pairs(plate_foot_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Legs Armor:
	if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Cloth") then
		require("./final_DB/cloth-leg_db");
		for key, value in pairs(cloth_leg_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Leather") then
		require("./final_DB/leather-leg_db");
		for key, value in pairs(leather_leg_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Mail") then
		require("./final_DB/mail-leg_db");
		for key, value in pairs(mail_leg_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_LEGS" and itemType == "Armor" and itemSubType == "Plate") then
		require("./final_DB/plate-leg_db");
		for key, value in pairs(plate_leg_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Waist Armor:
	if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Cloth") then
		require("./final_DB/cloth-belts_db");
		for key, value in pairs(cloth_belts_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Leather") then
		require("./final_DB/leather-belts_db");
		for key, value in pairs(leather_belts_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Mail") then
		require("./final_DB/mail-belts_db");
		for key, value in pairs(mail_belts_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_WAIST" and itemType == "Armor" and itemSubType == "Plate") then
		require("./final_DB/plate-belts_db");
		for key, value in pairs(plate_belts_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Hand Armor:
	if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Cloth") then
		require("./final_DB/cloth-hand_db");
		for key, value in pairs(cloth_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Leather") then
		require("./final_DB/leather-hand_db");
		for key, value in pairs(leather_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Mail") then
		require("./final_DB/mail-hand_db");
		for key, value in pairs(mail_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemEquipLoc == "INVTYPE_HAND" and itemType == "Armor" and itemSubType == "Plate") then
		require("./final_DB/plate-hand_db");
		for key, value in pairs(plate_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Cloak:
	if (itemEquipLoc == "INVTYPE_CLOAK" and itemType == "Armor") then
		require("./final_DB/cloaks_db");
		for key, value in pairs(cloaks_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end

	--For Weapon:
	if (itemType == "Weapon" and itemSubType == "Bows") then
		require("./final_DB/bows_db");
		for key, value in pairs(bows_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Crossbows") then
		require("./final_DB/crossbows_db");
		for key, value in pairs(crossbows_hand_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Daggers") then
		require("./final_DB/daggers_db");
		for key, value in pairs(daggers_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Guns") then
		require("./final_DB/guns_db");
		for key, value in pairs(guns_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Fist Weapons") then
		require("./final_DB/fist-weapons_db");
		for key, value in pairs(fist_weapons_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Two-Handed Axes") then
		require("./final_DB/two-handed-axes_db");
		for key, value in pairs(two_handed_axes_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Two-Handed Maces") then
		require("./final_DB/two-handed-maces_db");
		for key, value in pairs(two_handed_maces_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Two-Handed Swords") then
		require("./final_DB/two-handed-swords_db");
		for key, value in pairs(two_handed_swords_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "One-Handed Axes") then
		require("./final_DB/one-handed-axes_db");
		for key, value in pairs(one_handed_axes_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "One-Handed Maces") then
		require("./final_DB/one-handed-maces_db");
		for key, value in pairs(one_handed_maces_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "One-Handed Swords") then
		require("./final_DB/one-handed-swords_db");
		for key, value in pairs(one_handed_swords_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Polearms") then
		require("./final_DB/polearms_db");
		for key, value in pairs(polearms_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Staves") then
		require("./final_DB/staves_db");
		for key, value in pairs(staves_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	else if (itemType == "Weapon" and itemSubType == "Wands") then
		require("./final_DB/wands_db");
		for key, value in pairs(wands_db) do
			if (value.name == itemName) then
				return (value.location)
			end
		end
	end
end

return checkMyMog