--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
core.Config = {} -- adds Config table to addon namespace

local Config = core.Config
local UIConfig
local C_TransmogCollection = C_TransmogCollection
local NO_TRANSMOG_SOURCE_ID = NO_TRANSMOG_SOURCE_ID

local headContent;
local shoulderContent;
local backContent;
local chestContent;
local handsContent;
local beltContent;
local legsContent;
local bootsContent;
local weaponsContent;

--------------------------------------
-- Defaults (usually a database!)
--------------------------------------
local defaults = {
	theme = {
		r = 0, 
		g = 0.8, -- 204/255
		b = 1,
		hex = "00ccff"
	}
}

local playerInfos = {
	gear = {
		head = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		},
		shoulders = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		},
		chest = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		},
		back = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		},
		legs = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		},
		gloves = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		},
		waist = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		},
		boots = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		},
		weapon = {
			name = "",
			sourceName = "",
			location = "",
			locationTerritory = "",
			locationCategory = "",
			dropRate = "",
			expansion = ""
		}
	},
	name = ""
}

--------------------------------------
-- Config functions
--------------------------------------

function Config:GetThemeColor()
	local c = defaults.theme;
	return c.r, c.g, c.b, c.hex;
end

function Config:CreateButton(point, relativeFrame, relativePoint, yOffset, text)
	local btn = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
	btn:SetPoint(point, relativeFrame, relativePoint, 0, yOffset);
	btn:SetSize(140, 40);
	btn:SetText(text);
	btn:SetNormalFontObject("GameFontNormalLarge");
	btn:SetHighlightFontObject("GameFontHighlightLarge");
	return btn;
end

local function Tab_OnClick(self)
	PanelTemplates_SetTab(self:GetParent(), self:GetID());
	
	local scrollChild = UIConfig.ScrollFrame:GetScrollChild();
	if (scrollChild) then
		scrollChild:Hide();
	end
	
	UIConfig.ScrollFrame:SetScrollChild(self.content);
	self.content:Show();	
end

local function SetTabs(frame, numTabs, ...)
	frame.numTabs = numTabs;
	
	local contents = {};
	local frameName = frame:GetName();
	
	for i = 1, numTabs do	
		local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "CharacterFrameTabButtonTemplate");
		tab:SetID(i);
		tab:SetText(select(i, ...));
		tab:SetScript("OnClick", Tab_OnClick);
		
		tab.content = CreateFrame("Frame", nil, UIConfig.ScrollFrame);
		tab.content:SetSize(400, 260);
		tab.content:Hide();
		
		-- just for tutorial only:
		tab.content.bg = tab.content:CreateTexture(nil, "BACKGROUND");
		tab.content.bg:SetAllPoints(true);
		tab.content.bg:SetColorTexture(math.random(), math.random(), math.random(), 0.6);
		
		table.insert(contents, tab.content);
		
		if (i == 1) then
			tab:SetPoint("TOPLEFT", UIConfig, "BOTTOMLEFT", 5, 7);
		else
			tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i - 1)], "TOPRIGHT", -14, 0);
		end	
	end
	
	Tab_OnClick(_G[frameName.."Tab1"]);
	
	return unpack(contents);
end

local function ScrollFrame_OnMouseWheel(self, delta)
	local newValue = self:GetVerticalScroll() - (delta * 20);
	
	if (newValue < 0) then
		newValue = 0;
	elseif (newValue > self:GetVerticalScrollRange()) then
		newValue = self:GetVerticalScrollRange();
	end
	
	self:SetVerticalScroll(newValue);
end

local function Tab_OnClick(self)
	PanelTemplates_SetTab(self:GetParent(), self:GetID());
	
	local scrollChild = UIConfig.ScrollFrame:GetScrollChild();
	if (scrollChild) then
		scrollChild:Hide();
	end
	
	UIConfig.ScrollFrame:SetScrollChild(self.content);
	self.content:Show();	
end

local function SetTabs(frame, numTabs, ...)
	frame.numTabs = numTabs;
	
	local contents = {};
	local frameName = frame:GetName();
	
	for i = 1, numTabs do	
		local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "CharacterFrameTabButtonTemplate");
		tab:SetID(i);
		tab:SetText(select(i, ...));
		tab:SetScript("OnClick", Tab_OnClick);
		
		tab.content = CreateFrame("Frame", nil, UIConfig.ScrollFrame);
		tab.content:SetSize(600, 450);
		tab.content:Hide();
		
		table.insert(contents, tab.content);
		
		if (i == 1) then
			tab:SetPoint("TOPLEFT", UIConfig, "BOTTOMLEFT", 5, 7);
		else
			tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i - 1)], "TOPRIGHT", -14, 0);
		end	
	end
	
	Tab_OnClick(_G[frameName.."Tab1"]);
	
	return unpack(contents);
end

function fillContent(UIConfig, headContent, shoulderContent, backContent, chestContent, handsContent, beltContent, legsContent, bootsContent, weaponsContent)
	if headContent.gearName then
		headContent.gearName:SetText(playerInfos.gear.head.name);
	else 
		headContent.gearName = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		headContent.gearName:SetPoint("CENTER");
		headContent.gearName:SetText(playerInfos.gear.head.name);
	end

	if shoulderContent.gearName then
		shoulderContent.gearName:SetText(playerInfos.gear.shoulders.name);
	else 
		shoulderContent.gearName = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		shoulderContent.gearName:SetPoint("CENTER");
		shoulderContent.gearName:SetText(playerInfos.gear.shoulders.name);
	end

	if backContent.gearName then
		backContent.gearName:SetText(playerInfos.gear.back.name);
	else 
		backContent.gearName = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		backContent.gearName:SetPoint("CENTER");
		backContent.gearName:SetText(playerInfos.gear.back.name);
	end

	if chestContent.gearName then
		chestContent.gearName:SetText(playerInfos.gear.chest.name);
	else 
		chestContent.gearName = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		chestContent.gearName:SetPoint("CENTER");
		chestContent.gearName:SetText(playerInfos.gear.chest.name);
	end

	if handsContent.gearName then
		handsContent.gearName:SetText(playerInfos.gear.gloves.name);
	else 
		handsContent.gearName = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		handsContent.gearName:SetPoint("CENTER");
		handsContent.gearName:SetText(playerInfos.gear.gloves.name);
	end

	if beltContent.gearName then
		beltContent.gearName:SetText(playerInfos.gear.waist.name);
	else 
		beltContent.gearName = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		beltContent.gearName:SetPoint("CENTER");
		beltContent.gearName:SetText(playerInfos.gear.waist.name);
	end

	if legsContent.gearName then
		legsContent.gearName:SetText(playerInfos.gear.legs.name);
	else 
		legsContent.gearName = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		legsContent.gearName:SetPoint("CENTER");
		legsContent.gearName:SetText(playerInfos.gear.legs.name);
	end

	if bootsContent.gearName then
		bootsContent.gearName:SetText(playerInfos.gear.boots.name);
	else 
		bootsContent.gearName = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		bootsContent.gearName:SetPoint("CENTER");
		bootsContent.gearName:SetText(playerInfos.gear.boots.name);
	end

	if weaponsContent.gearName then
		weaponsContent.gearName:SetText(playerInfos.gear.weapon.name);
	else 
		weaponsContent.gearName = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		weaponsContent.gearName:SetPoint("CENTER");
		weaponsContent.gearName:SetText(playerInfos.gear.weapon.name);
	end
end

function Config:CreateMenu()
	UIConfig = CreateFrame("Frame", "CheckMyMogConfig", UIParent, "UIPanelDialogTemplate");
	UIConfig:SetSize(600, 450);
	UIConfig:SetPoint("CENTER");

	UIConfig.Title:ClearAllPoints();
	UIConfig.Title:SetFontObject("GameFontHighlight");
	UIConfig.Title:SetPoint("LEFT", CheckMyMogConfigTitleBG, "LEFT", 6, 1);
	UIConfig.Title:SetText("Check My Mog");

	UIConfig.ScrollFrame = CreateFrame("ScrollFrame", nil, UIConfig, "UIPanelScrollFrameTemplate");
	UIConfig.ScrollFrame:SetPoint("TOPLEFT", CheckMyMogConfigDialogBG, "TOPLEFT", 4, -8);
	UIConfig.ScrollFrame:SetPoint("BOTTOMRIGHT", CheckMyMogConfigDialogBG, "BOTTOMRIGHT", -3, 4);
	UIConfig.ScrollFrame:SetClipsChildren(true);
	UIConfig.ScrollFrame:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel);
	
	UIConfig.ScrollFrame.ScrollBar:ClearAllPoints();
	UIConfig.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", UIConfig.ScrollFrame, "TOPRIGHT", -12, -18);
	UIConfig.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", UIConfig.ScrollFrame, "BOTTOMRIGHT", -7, 18);

	local child = CreateFrame("Frame", nil, UIConfig.ScrollFrame);
	child:SetSize(600, 450);
	UIConfig.ScrollFrame:SetScrollChild(child);	

	headContent, shoulderContent, backContent, chestContent,
	handsContent, beltContent, legsContent, bootsContent, weaponsContent = SetTabs(UIConfig, 9, "Head", "Shoulder", "Back", "Chest", "Gloves", "Waist", "Legs", "Boots", "Weapons");

	UIConfig:Hide();
	return UIConfig;
end

function CmmOnEvent(Event, arg1, arg2, ...)
	if Event == "ADDON_LOADED" then
		Cmm_load(arg1)
	elseif Event == "PLAYER_LOGIN" then
		Config:CreateMenu();
		Cmm_Initialize();
	elseif Event == "INSPECT_READY" then
		Cmm_UpdateInfos();
	elseif Event == "ITEM_DATA_LOAD_RESULT" then
		print(arg1);
	end
end

function Cmm_UpdateInfos()
	local appearanceSources = C_TransmogCollection.GetInspectSources()
	if appearanceSources then
		for i = 1, #appearanceSources do
			if ( appearanceSources[i] and appearanceSources[i] ~= NO_TRANSMOG_SOURCE_ID ) then
				local categoryID , appearanceID, unknownBoolean1, itemTexture, unknownBoolean2, itemLink, appearanceLink, unknownFlag = C_TransmogCollection.GetAppearanceSourceInfo(appearanceSources[i]);
				appearanceName = select(1, GetItemInfo(itemLink));
				if i == 1 then
					playerInfos.gear.head.name = appearanceName;
				elseif i == 3 then
					playerInfos.gear.shoulders.name = appearanceName;
				elseif i == 5 then
					playerInfos.gear.chest.name = appearanceName;
				elseif i == 6 then
					playerInfos.gear.waist.name = appearanceName;
				elseif i == 7 then
					playerInfos.gear.legs.name = appearanceName;
				elseif i == 8 then
					playerInfos.gear.boots.name = appearanceName;
				elseif i == 10 then
					playerInfos.gear.gloves.name = appearanceName;
				elseif i == 15 then
					playerInfos.gear.back.name = appearanceName;
				elseif i == 16 then
					playerInfos.gear.weapon.name = appearanceName;
					print(wowItemDB.getLocation(itemLink));
				end
			end
		end
	end
	local playerName = UnitName("target");
	playerInfos.name = playerName;
end

function checkMyMog_buttonInspect_Attach()
	CreateFrame("Button", "checkMyMog_buttonInspect", InspectPaperDollFrame, "checkMyMog_buttonTemplate")
	checkMyMog_buttonInspect:SetParent(InspectPaperDollFrame)
	checkMyMog_buttonInspect:SetScript('OnClick',
	function()
		fillContent(UIConfig, headContent, shoulderContent, backContent, chestContent, handsContent, beltContent, legsContent, bootsContent, weaponsContent);
		UIConfig:SetShown(not UIConfig:IsShown());
	end)
	if checkMyMog_buttonInspect then
		checkMyMog_buttonInspect:ClearAllPoints()
		checkMyMog_buttonInspect:SetPoint("TOPRIGHT", "InspectWristSlot", "BOTTOMRIGHT", 8, -6)
		checkMyMog_buttonInspect:Show()
	end
end

function Cmm_load(AddonName)
	if AddonName == "Blizzard_InspectUI" then
		checkMyMog_buttonInspect_Attach();
	end
end

function Cmm_Initialize()
	if IsAddOnLoaded("Blizzard_InspectUI") then Cmm_load("Blizzard_InspectUI") end
end