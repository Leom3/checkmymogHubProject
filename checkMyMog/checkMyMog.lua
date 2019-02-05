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
		head = "",
		headLoc = "",
		shoulders = "",
		chest = "",
		back = "",
		legs = "",
		gloves = "",
		waist = "",
		boots = ""
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
		tab.content:SetSize(160, 260);
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
		tab.content:SetSize(350, 450);
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
		headContent.gearName:SetText(playerInfos.gear.head);
	else 
		headContent.gearName = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		headContent.gearName:SetPoint("CENTER");
		headContent.gearName:SetText(playerInfos.gear.head);
	end

	if shoulderContent.gearName then
		shoulderContent.gearName:SetText(playerInfos.gear.shoulders);
	else 
		shoulderContent.gearName = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		shoulderContent.gearName:SetPoint("CENTER");
		shoulderContent.gearName:SetText(playerInfos.gear.shoulders);
	end

	if backContent.gearName then
		backContent.gearName:SetText(playerInfos.gear.back);
	else 
		backContent.gearName = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		backContent.gearName:SetPoint("CENTER");
		backContent.gearName:SetText(playerInfos.gear.back);
	end

	if chestContent.gearName then
		chestContent.gearName:SetText(playerInfos.gear.chest);
	else 
		chestContent.gearName = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		chestContent.gearName:SetPoint("CENTER");
		chestContent.gearName:SetText(playerInfos.gear.chest);
	end

	if handsContent.gearName then
		handsContent.gearName:SetText(playerInfos.gear.hands);
	else 
		handsContent.gearName = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		handsContent.gearName:SetPoint("CENTER");
		handsContent.gearName:SetText(playerInfos.gear.hands);
	end

	if beltContent.gearName then
		beltContent.gearName:SetText(playerInfos.gear.waist);
	else 
		beltContent.gearName = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		beltContent.gearName:SetPoint("CENTER");
		beltContent.gearName:SetText(playerInfos.gear.waist);
	end

	if legsContent.gearName then
		legsContent.gearName:SetText(playerInfos.gear.legs);
	else 
		legsContent.gearName = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		legsContent.gearName:SetPoint("CENTER");
		legsContent.gearName:SetText(playerInfos.gear.legs);
	end

	if bootsContent.gearName then
		bootsContent.gearName:SetText(playerInfos.gear.boots);
	else 
		bootsContent.gearName = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		bootsContent.gearName:SetPoint("CENTER");
		bootsContent.gearName:SetText(playerInfos.gear.boots);
	end

	if weaponsContent.gearName then
		weaponsContent.gearName:SetText(playerInfos.gear.weapons);
	else 
		weaponsContent.gearName = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		weaponsContent.gearName:SetPoint("CENTER");
		weaponsContent.gearName:SetText(playerInfos.gear.weapons);
	end
end

function Config:CreateMenu()
	UIConfig = CreateFrame("Frame", "CheckMyMogConfig", UIParent, "UIPanelDialogTemplate");
	UIConfig:SetSize(350, 450);
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
	child:SetSize(350, 450);
	UIConfig.ScrollFrame:SetScrollChild(child);	

	headContent, shoulderContent, backContent, chestContent,
	handsContent, beltContent, legsContent, bootsContent, weaponsContent = SetTabs(UIConfig, 9, "H", "S", "B", "C", "G", "W", "L", "B", "WP");

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
		print("AYOOYOYOYOYOO");
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
					playerInfos.gear.head = appearanceName;
					print(wowItemDB.getLocation(itemLink));
				elseif i == 3 then
					playerInfos.gear.shoulders = appearanceName;
				elseif i == 5 then
					playerInfos.gear.chest = appearanceName;
				elseif i == 6 then
					playerInfos.gear.waist = appearanceName;
				elseif i == 7 then
					playerInfos.gear.legs = appearanceName;
				elseif i == 8 then
					playerInfos.gear.boots = appearanceName;
				elseif i == 10 then
					playerInfos.gear.hands = appearanceName;
				elseif i == 15 then
					playerInfos.gear.back = appearanceName;
				elseif i == 16 then
					playerInfos.gear.weapons = appearanceName;
				end
			end
		end
	end
	local playerName = UnitName("target");
	playerInfos.name = playerName;
	print(playerInfos.name);
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