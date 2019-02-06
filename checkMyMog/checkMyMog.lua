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
		tab.content:SetSize(500, 400);
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
	end
	if headContent.gearSource then
		headContent.gearSource:SetText(playerInfos.gear.head.sourceName);
	end
	if headContent.gearLocation then
		headContent.gearLocation:SetText(playerInfos.gear.head.location);
	end
	if headContent.gearLocationTerritory then
		headContent.gearLocationTerritory:SetText(playerInfos.gear.head.locationTerritory);
	end
	if headContent.gearLocationCategory then
		headContent.gearLocationCategory:SetText(playerInfos.gear.head.locationCategory);
	end
	if headContent.gearDropRate then
		headContent.gearDropRate:SetText(playerInfos.gear.head.dropRate);
	end
	if headContent.gearExpansion then
		headContent.gearExpansion:SetText(playerInfos.gear.head.expansion);
	else 
		headContent.gearName = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		headContent.gearSource = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		headContent.gearLocation = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		headContent.gearLocationTerritory = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		headContent.gearLocationCategory = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		headContent.gearDropRate = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		headContent.gearExpansion = headContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		headContent.gearName:SetPoint("TOP");
		headContent.gearName:SetFontObject("GameFontRedLarge")
		headContent.gearName:SetText(playerInfos.gear.head.name);

		headContent.gearSource:SetPoint("LEFT", 0, 30);
		headContent.gearSource:SetText(playerInfos.gear.head.sourceName);

		headContent.gearLocation:SetPoint("LEFT", 0, 60);
		headContent.gearLocation:SetText(playerInfos.gear.head.location);

		headContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		headContent.gearLocationTerritory:SetText(playerInfos.gear.head.locationTerritory);

		headContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		headContent.gearLocationCategory:SetText(playerInfos.gear.head.locationCategory);

		headContent.gearDropRate:SetPoint("LEFT", 0, 150);
		headContent.gearDropRate:SetText(playerInfos.gear.head.dropRate);

		headContent.gearExpansion:SetPoint("LEFT", 0, 180);
		headContent.gearExpansion:SetText(playerInfos.gear.head.expansion);
	end

	if shoulderContent.gearName then
		shoulderContent.gearName:SetText(playerInfos.gear.shoulders.name);
	end
	if shoulderContent.gearSource then
		shoulderContent.gearSource:SetText(playerInfos.gear.shoulders.sourceName);
	end
	if shoulderContent.gearLocation then
		shoulderContent.gearLocation:SetText(playerInfos.gear.shoulders.location);
	end
	if shoulderContent.gearLocationTerritory then
		shoulderContent.gearLocationTerritory:SetText(playerInfos.gear.shoulders.locationTerritory);
	end
	if shoulderContent.gearLocationCategory then
		shoulderContent.gearLocationCategory:SetText(playerInfos.gear.shoulders.locationCategory);
	end
	if shoulderContent.gearDropRate then
		shoulderContent.gearDropRate:SetText(playerInfos.gear.shoulders.dropRate);
	end
	if shoulderContent.gearExpansion then
		shoulderContent.gearExpansion:SetText(playerInfos.gear.shoulders.expansion);
	else 
		shoulderContent.gearName = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		shoulderContent.gearSource = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		shoulderContent.gearLocation = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		shoulderContent.gearLocationTerritory = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		shoulderContent.gearLocationCategory = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		shoulderContent.gearDropRate = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		shoulderContent.gearExpansion = shoulderContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		shoulderContent.gearName:SetPoint("TOP");
		shoulderContent.gearName:SetFontObject("GameFontRedLarge")
		shoulderContent.gearName:SetText(playerInfos.gear.shoulders.name);

		shoulderContent.gearSource:SetPoint("LEFT", 0, 30);
		shoulderContent.gearSource:SetText(playerInfos.gear.shoulders.sourceName);

		shoulderContent.gearLocation:SetPoint("LEFT", 0, 60);
		shoulderContent.gearLocation:SetText(playerInfos.gear.shoulders.location);

		shoulderContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		shoulderContent.gearLocationTerritory:SetText(playerInfos.gear.shoulders.locationTerritory);

		shoulderContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		shoulderContent.gearLocationCategory:SetText(playerInfos.gear.shoulders.locationCategory);

		shoulderContent.gearDropRate:SetPoint("LEFT", 0, 150);
		shoulderContent.gearDropRate:SetText(playerInfos.gear.shoulders.dropRate);

		shoulderContent.gearExpansion:SetPoint("LEFT", 0, 180);
		shoulderContent.gearExpansion:SetText(playerInfos.gear.shoulders.expansion);
	end

	if backContent.gearName then
		backContent.gearName:SetText(playerInfos.gear.back.name);
	end
	if backContent.gearSource then
		backContent.gearSource:SetText(playerInfos.gear.back.sourceName);
	end
	if backContent.gearLocation then
		backContent.gearLocation:SetText(playerInfos.gear.back.location);
	end
	if backContent.gearLocationTerritory then
		backContent.gearLocationTerritory:SetText(playerInfos.gear.back.locationTerritory);
	end
	if backContent.gearLocationCategory then
		backContent.gearLocationCategory:SetText(playerInfos.gear.back.locationCategory);
	end
	if backContent.gearDropRate then
		backContent.gearDropRate:SetText(playerInfos.gear.back.dropRate);
	end
	if backContent.gearExpansion then
		backContent.gearExpansion:SetText(playerInfos.gear.back.expansion);
	else 
		backContent.gearName = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		backContent.gearSource = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		backContent.gearLocation = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		backContent.gearLocationTerritory = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		backContent.gearLocationCategory = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		backContent.gearDropRate = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		backContent.gearExpansion = backContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		backContent.gearName:SetPoint("TOP");
		backContent.gearName:SetFontObject("GameFontRedLarge")
		backContent.gearName:SetText(playerInfos.gear.back.name);

		backContent.gearSource:SetPoint("LEFT", 0, 30);
		backContent.gearSource:SetText(playerInfos.gear.back.sourceName);

		backContent.gearLocation:SetPoint("LEFT", 0, 60);
		backContent.gearLocation:SetText(playerInfos.gear.back.location);

		backContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		backContent.gearLocationTerritory:SetText(playerInfos.gear.back.locationTerritory);

		backContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		backContent.gearLocationCategory:SetText(playerInfos.gear.back.locationCategory);

		backContent.gearDropRate:SetPoint("LEFT", 0, 150);
		backContent.gearDropRate:SetText(playerInfos.gear.back.dropRate);

		backContent.gearExpansion:SetPoint("LEFT", 0, 180);
		backContent.gearExpansion:SetText(playerInfos.gear.back.expansion);
	end

	if chestContent.gearName then
		chestContent.gearName:SetText(playerInfos.gear.chest.name);
	end
	if chestContent.gearSource then
		chestContent.gearSource:SetText(playerInfos.gear.chest.sourceName);
	end
	if chestContent.gearLocation then
		chestContent.gearLocation:SetText(playerInfos.gear.chest.location);
	end
	if chestContent.gearLocationTerritory then
		chestContent.gearLocationTerritory:SetText(playerInfos.gear.chest.locationTerritory);
	end
	if chestContent.gearLocationCategory then
		chestContent.gearLocationCategory:SetText(playerInfos.gear.chest.locationCategory);
	end
	if chestContent.gearDropRate then
		chestContent.gearDropRate:SetText(playerInfos.gear.chest.dropRate);
	end
	if chestContent.gearExpansion then
		chestContent.gearExpansion:SetText(playerInfos.gear.chest.expansion);
	else 
		chestContent.gearName = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		chestContent.gearSource = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		chestContent.gearLocation = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		chestContent.gearLocationTerritory = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		chestContent.gearLocationCategory = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		chestContent.gearDropRate = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		chestContent.gearExpansion = chestContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		chestContent.gearName:SetPoint("TOP");
		chestContent.gearName:SetFontObject("GameFontRedLarge")
		chestContent.gearName:SetText(playerInfos.gear.chest.name);

		chestContent.gearSource:SetPoint("LEFT", 0, 30);
		chestContent.gearSource:SetText(playerInfos.gear.chest.sourceName);

		chestContent.gearLocation:SetPoint("LEFT", 0, 60);
		chestContent.gearLocation:SetText(playerInfos.gear.chest.location);

		chestContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		chestContent.gearLocationTerritory:SetText(playerInfos.gear.chest.locationTerritory);

		chestContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		chestContent.gearLocationCategory:SetText(playerInfos.gear.chest.locationCategory);

		chestContent.gearDropRate:SetPoint("LEFT", 0, 150);
		chestContent.gearDropRate:SetText(playerInfos.gear.chest.dropRate);

		chestContent.gearExpansion:SetPoint("LEFT", 0, 180);
		chestContent.gearExpansion:SetText(playerInfos.gear.chest.expansion);
	end

	if handsContent.gearName then
		handsContent.gearName:SetText(playerInfos.gear.gloves.name);
	end
	if handsContent.gearSource then
		handsContent.gearSource:SetText(playerInfos.gear.gloves.sourceName);
	end
	if handsContent.gearLocation then
		handsContent.gearLocation:SetText(playerInfos.gear.gloves.location);
	end
	if handsContent.gearLocationTerritory then
		handsContent.gearLocationTerritory:SetText(playerInfos.gear.gloves.locationTerritory);
	end
	if handsContent.gearLocationCategory then
		handsContent.gearLocationCategory:SetText(playerInfos.gear.gloves.locationCategory);
	end
	if handsContent.gearDropRate then
		handsContent.gearDropRate:SetText(playerInfos.gear.gloves.dropRate);
	end
	if handsContent.gearExpansion then
		handsContent.gearExpansion:SetText(playerInfos.gear.gloves.expansion);
	else 
		handsContent.gearName = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		handsContent.gearSource = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		handsContent.gearLocation = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		handsContent.gearLocationTerritory = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		handsContent.gearLocationCategory = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		handsContent.gearDropRate = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		handsContent.gearExpansion = handsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		handsContent.gearName:SetPoint("TOP");
		handsContent.gearName:SetFontObject("GameFontRedLarge")
		handsContent.gearName:SetText(playerInfos.gear.gloves.name);

		handsContent.gearSource:SetPoint("LEFT", 0, 30);
		handsContent.gearSource:SetText(playerInfos.gear.gloves.sourceName);

		handsContent.gearLocation:SetPoint("LEFT", 0, 60);
		handsContent.gearLocation:SetText(playerInfos.gear.gloves.location);

		handsContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		handsContent.gearLocationTerritory:SetText(playerInfos.gear.gloves.locationTerritory);

		handsContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		handsContent.gearLocationCategory:SetText(playerInfos.gear.gloves.locationCategory);

		handsContent.gearDropRate:SetPoint("LEFT", 0, 150);
		handsContent.gearDropRate:SetText(playerInfos.gear.gloves.dropRate);

		handsContent.gearExpansion:SetPoint("LEFT", 0, 180);
		handsContent.gearExpansion:SetText(playerInfos.gear.gloves.expansion);
	end

	if beltContent.gearName then
		beltContent.gearName:SetText(playerInfos.gear.waist.name);
	end
	if beltContent.gearSource then
		beltContent.gearSource:SetText(playerInfos.gear.waist.sourceName);
	end
	if beltContent.gearLocation then
		beltContent.gearLocation:SetText(playerInfos.gear.waist.location);
	end
	if beltContent.gearLocationTerritory then
		beltContent.gearLocationTerritory:SetText(playerInfos.gear.waist.locationTerritory);
	end
	if beltContent.gearLocationCategory then
		beltContent.gearLocationCategory:SetText(playerInfos.gear.waist.locationCategory);
	end
	if beltContent.gearDropRate then
		beltContent.gearDropRate:SetText(playerInfos.gear.waist.dropRate);
	end
	if beltContent.gearExpansion then
		beltContent.gearExpansion:SetText(playerInfos.gear.waist.expansion);
	else 
		beltContent.gearName = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		beltContent.gearSource = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		beltContent.gearLocation = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		beltContent.gearLocationTerritory = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		beltContent.gearLocationCategory = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		beltContent.gearDropRate = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		beltContent.gearExpansion = beltContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		beltContent.gearName:SetPoint("TOP");
		beltContent.gearName:SetFontObject("GameFontRedLarge")
		beltContent.gearName:SetText(playerInfos.gear.waist.name);

		beltContent.gearSource:SetPoint("LEFT", 0, 30);
		beltContent.gearSource:SetText(playerInfos.gear.waist.sourceName);

		beltContent.gearLocation:SetPoint("LEFT", 0, 60);
		beltContent.gearLocation:SetText(playerInfos.gear.waist.location);

		beltContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		beltContent.gearLocationTerritory:SetText(playerInfos.gear.waist.locationTerritory);

		beltContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		beltContent.gearLocationCategory:SetText(playerInfos.gear.waist.locationCategory);

		beltContent.gearDropRate:SetPoint("LEFT", 0, 150);
		beltContent.gearDropRate:SetText(playerInfos.gear.waist.dropRate);

		beltContent.gearExpansion:SetPoint("LEFT", 0, 180);
		beltContent.gearExpansion:SetText(playerInfos.gear.waist.expansion);
	end

	if legsContent.gearName then
		legsContent.gearName:SetText(playerInfos.gear.legs.name);
	end
	if legsContent.gearSource then
		legsContent.gearSource:SetText(playerInfos.gear.legs.sourceName);
	end
	if legsContent.gearLocation then
		legsContent.gearLocation:SetText(playerInfos.gear.legs.location);
	end
	if legsContent.gearLocationTerritory then
		legsContent.gearLocationTerritory:SetText(playerInfos.gear.legs.locationTerritory);
	end
	if legsContent.gearLocationCategory then
		legsContent.gearLocationCategory:SetText(playerInfos.gear.legs.locationCategory);
	end
	if legsContent.gearDropRate then
		legsContent.gearDropRate:SetText(playerInfos.gear.legs.dropRate);
	end
	if legsContent.gearExpansion then
		legsContent.gearExpansion:SetText(playerInfos.gear.legs.expansion);
	else 
		legsContent.gearName = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		legsContent.gearSource = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		legsContent.gearLocation = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		legsContent.gearLocationTerritory = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		legsContent.gearLocationCategory = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		legsContent.gearDropRate = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		legsContent.gearExpansion = legsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		legsContent.gearName:SetPoint("TOP");
		legsContent.gearName:SetFontObject("GameFontRedLarge")
		legsContent.gearName:SetText(playerInfos.gear.legs.name);

		legsContent.gearSource:SetPoint("LEFT", 0, 30);
		legsContent.gearSource:SetText(playerInfos.gear.legs.sourceName);

		legsContent.gearLocation:SetPoint("LEFT", 0, 60);
		legsContent.gearLocation:SetText(playerInfos.gear.legs.location);

		legsContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		legsContent.gearLocationTerritory:SetText(playerInfos.gear.legs.locationTerritory);

		legsContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		legsContent.gearLocationCategory:SetText(playerInfos.gear.legs.locationCategory);

		legsContent.gearDropRate:SetPoint("LEFT", 0, 150);
		legsContent.gearDropRate:SetText(playerInfos.gear.legs.dropRate);

		legsContent.gearExpansion:SetPoint("LEFT", 0, 180);
		legsContent.gearExpansion:SetText(playerInfos.gear.legs.expansion);
	end

	if bootsContent.gearName then
		bootsContent.gearName:SetText(playerInfos.gear.boots.name);
	end
	if bootsContent.gearSource then
		bootsContent.gearSource:SetText(playerInfos.gear.boots.sourceName);
	end
	if bootsContent.gearLocation then
		bootsContent.gearLocation:SetText(playerInfos.gear.boots.location);
	end
	if bootsContent.gearLocationTerritory then
		bootsContent.gearLocationTerritory:SetText(playerInfos.gear.boots.locationTerritory);
	end
	if bootsContent.gearLocationCategory then
		bootsContent.gearLocationCategory:SetText(playerInfos.gear.boots.locationCategory);
	end
	if bootsContent.gearDropRate then
		bootsContent.gearDropRate:SetText(playerInfos.gear.boots.dropRate);
	end
	if bootsContent.gearExpansion then
		bootsContent.gearExpansion:SetText(playerInfos.gear.boots.expansion);
	else 
		bootsContent.gearName = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		bootsContent.gearSource = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		bootsContent.gearLocation = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		bootsContent.gearLocationTerritory = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		bootsContent.gearLocationCategory = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		bootsContent.gearDropRate = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		bootsContent.gearExpansion = bootsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		bootsContent.gearName:SetPoint("TOP");
		bootsContent.gearName:SetFontObject("GameFontRedLarge")
		bootsContent.gearName:SetText(playerInfos.gear.boots.name);

		bootsContent.gearSource:SetPoint("LEFT", 0, 30);
		bootsContent.gearSource:SetText(playerInfos.gear.boots.sourceName);

		bootsContent.gearLocation:SetPoint("LEFT", 0, 60);
		bootsContent.gearLocation:SetText(playerInfos.gear.boots.location);

		bootsContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		bootsContent.gearLocationTerritory:SetText(playerInfos.gear.boots.locationTerritory);

		bootsContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		bootsContent.gearLocationCategory:SetText(playerInfos.gear.boots.locationCategory);

		bootsContent.gearDropRate:SetPoint("LEFT", 0, 150);
		bootsContent.gearDropRate:SetText(playerInfos.gear.boots.dropRate);

		bootsContent.gearExpansion:SetPoint("LEFT", 0, 180);
		bootsContent.gearExpansion:SetText(playerInfos.gear.boots.expansion);
	end

	if weaponsContent.gearName then
		weaponsContent.gearName:SetText(playerInfos.gear.weapon.name);
	end
	if weaponsContent.gearSource then
		weaponsContent.gearSource:SetText(playerInfos.gear.weapon.sourceName);
	end
	if weaponsContent.gearLocation then
		weaponsContent.gearLocation:SetText(playerInfos.gear.weapon.location);
	end
	if weaponsContent.gearLocationTerritory then
		weaponsContent.gearLocationTerritory:SetText(playerInfos.gear.weapon.locationTerritory);
	end
	if weaponsContent.gearLocationCategory then
		weaponsContent.gearLocationCategory:SetText(playerInfos.gear.weapon.locationCategory);
	end
	if weaponsContent.gearDropRate then
		weaponsContent.gearDropRate:SetText(playerInfos.gear.weapon.dropRate);
	end
	if weaponsContent.gearExpansion then
		weaponsContent.gearExpansion:SetText(playerInfos.gear.weapon.expansion);
	else 
		weaponsContent.gearName = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		weaponsContent.gearSource = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		weaponsContent.gearLocation = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		weaponsContent.gearLocationTerritory = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		weaponsContent.gearLocationCategory = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		weaponsContent.gearDropRate = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		weaponsContent.gearExpansion = weaponsContent:CreateFontString(nil, "OVERLAY", "GameFontNormal");

		weaponsContent.gearName:SetPoint("TOP");
		weaponsContent.gearName:SetFontObject("GameFontRedLarge")
		weaponsContent.gearName:SetText(playerInfos.gear.weapon.name);

		weaponsContent.gearSource:SetPoint("LEFT", 0, 30);
		weaponsContent.gearSource:SetText(playerInfos.gear.weapon.sourceName);

		weaponsContent.gearLocation:SetPoint("LEFT", 0, 60);
		weaponsContent.gearLocation:SetText(playerInfos.gear.weapon.location);

		weaponsContent.gearLocationTerritory:SetPoint("LEFT", 0, 90);
		weaponsContent.gearLocationTerritory:SetText(playerInfos.gear.weapon.locationTerritory);

		weaponsContent.gearLocationCategory:SetPoint("LEFT", 0, 120);
		weaponsContent.gearLocationCategory:SetText(playerInfos.gear.weapon.locationCategory);

		weaponsContent.gearDropRate:SetPoint("LEFT", 0, 150);
		weaponsContent.gearDropRate:SetText(playerInfos.gear.weapon.dropRate);

		weaponsContent.gearExpansion:SetPoint("LEFT", 0, 180);
		weaponsContent.gearExpansion:SetText(playerInfos.gear.weapon.expansion);
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
					playerInfos.gear.head.sourceName = wowItemDB.getSource(itemLink)
					if playerInfos.gear.head.sourceName == "" then
						playerInfos.gear.head.sourceName = "Unknown"
					end
					playerInfos.gear.head.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.head.location == "" then
						playerInfos.gear.head.location = "Unknown"
					end
					playerInfos.gear.head.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.head.locationTerritory == "" then
						playerInfos.gear.head.locationTerritory = "Unknown"
					end
					playerInfos.gear.head.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.head.locationCategory == "" then
						playerInfos.gear.head.locationCategory = "Unknown"
					end
					playerInfos.gear.head.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.head.dropRate == "" then
						playerInfos.gear.head.dropRate = "Unknown"
					end
					playerInfos.gear.head.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.head.expansion == "" then
						playerInfos.gear.head.expansion = "Unknown"
					end
				elseif i == 3 then
					playerInfos.gear.shoulders.name = appearanceName;
					playerInfos.gear.shoulders.sourceName = wowItemDB.getSource(itemLink);
					if playerInfos.gear.shoulders.sourceName == "" then
						playerInfos.gear.shoulders.sourceName = "Unknown"
					end
					playerInfos.gear.shoulders.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.shoulders.location == "" then
						playerInfos.gear.shoulders.location = "Unknown"
					end
					playerInfos.gear.shoulders.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.shoulders.locationTerritory == "" then
						playerInfos.gear.shoulders.locationTerritory = "Unknown"
					end
					playerInfos.gear.shoulders.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.shoulders.locationCategory == "" then
						playerInfos.gear.shoulders.locationCategory = "Unknown"
					end
					playerInfos.gear.shoulders.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.shoulders.dropRate == "" then
						playerInfos.gear.shoulders.dropRate = "Unknown"
					end
					playerInfos.gear.shoulders.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.shoulders.expansion == "" then
						playerInfos.gear.shoulders.expansion = "Unknown"
					end
				elseif i == 5 then
					playerInfos.gear.chest.name = appearanceName;
					playerInfos.gear.chest.sourceName = wowItemDB.getSource(itemLink);
					if playerInfos.gear.chest.sourceName == "" then
						playerInfos.gear.chest.sourceName = "Unknown"
					end
					playerInfos.gear.chest.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.chest.location == "" then
						playerInfos.gear.chest.location = "Unknown"
					end
					playerInfos.gear.chest.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.chest.locationTerritory == "" then
						playerInfos.gear.chest.locationTerritory = "Unknown"
					end
					playerInfos.gear.chest.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.chest.locationCategory == "" then
						playerInfos.gear.chest.locationCategory = "Unknown"
					end
					playerInfos.gear.chest.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.chest.dropRate == "" then
						playerInfos.gear.chest.dropRate = "Unknown"
					end
					playerInfos.gear.chest.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.chest.expansion == "" then
						playerInfos.gear.chest.expansion = "Unknown"
					end
				elseif i == 6 then
					playerInfos.gear.waist.name = appearanceName;
					playerInfos.gear.waist.sourceName = wowItemDB.getSource(itemLink);
					if playerInfos.gear.waist.sourceName == "" then
						playerInfos.gear.waist.sourceName = "Unknown"
					end
					playerInfos.gear.waist.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.waist.location == "" then
						playerInfos.gear.waist.location = "Unknown"
					end
					playerInfos.gear.waist.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.waist.locationTerritory == "" then
						playerInfos.gear.waist.locationTerritory = "Unknown"
					end
					playerInfos.gear.waist.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.waist.locationCategory == "" then
						playerInfos.gear.waist.locationCategory = "Unknown"
					end
					playerInfos.gear.waist.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.waist.dropRate == "" then
						playerInfos.gear.waist.dropRate = "Unknown"
					end
					playerInfos.gear.waist.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.waist.expansion == "" then
						playerInfos.gear.waist.expansion = "Unknown"
					end
				elseif i == 7 then
					playerInfos.gear.legs.name = appearanceName;
					playerInfos.gear.legs.sourceName = wowItemDB.getSource(itemLink);
					if playerInfos.gear.legs.sourceName == "" then
						playerInfos.gear.legs.sourceName = "Unknown"
					end
					playerInfos.gear.legs.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.legs.location == "" then
						playerInfos.gear.legs.location = "Unknown"
					end
					playerInfos.gear.legs.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.legs.locationTerritory == "" then
						playerInfos.gear.legs.locationTerritory = "Unknown"
					end
					playerInfos.gear.legs.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.legs.locationCategory == "" then
						playerInfos.gear.legs.locationCategory = "Unknown"
					end
					playerInfos.gear.legs.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.legs.dropRate == "" then
						playerInfos.gear.legs.dropRate = "Unknown"
					end
					playerInfos.gear.legs.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.legs.expansion == "" then
						playerInfos.gear.legs.expansion = "Unknown"
					end
				elseif i == 8 then
					playerInfos.gear.boots.name = appearanceName;
					playerInfos.gear.boots.sourceName = wowItemDB.getSource(itemLink);
					if playerInfos.gear.boots.sourceName == "" then
						playerInfos.gear.boots.sourceName = "Unknown"
					end
					playerInfos.gear.boots.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.boots.location == "" then
						playerInfos.gear.boots.location = "Unknown"
					end
					playerInfos.gear.boots.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.boots.locationTerritory == "" then
						playerInfos.gear.boots.locationTerritory = "Unknown"
					end
					playerInfos.gear.boots.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.boots.locationCategory == "" then
						playerInfos.gear.boots.locationCategory = "Unknown"
					end
					playerInfos.gear.boots.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.boots.dropRate == "" then
						playerInfos.gear.boots.dropRate = "Unknown"
					end
					playerInfos.gear.boots.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.boots.expansion == "" then
						playerInfos.gear.boots.expansion = "Unknown"
					end
				elseif i == 10 then
					playerInfos.gear.gloves.name = appearanceName;
					playerInfos.gear.gloves.sourceName = wowItemDB.getSource(itemLink);
					if playerInfos.gear.gloves.sourceName == "" then
						playerInfos.gear.gloves.sourceName = "Unknown"
					end
					playerInfos.gear.gloves.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.gloves.location == "" then
						playerInfos.gear.gloves.location = "Unknown"
					end
					playerInfos.gear.gloves.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.gloves.locationTerritory == "" then
						playerInfos.gear.gloves.locationTerritory = "Unknown"
					end
					playerInfos.gear.gloves.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.gloves.locationCategory == "" then
						playerInfos.gear.gloves.locationCategory = "Unknown"
					end
					playerInfos.gear.gloves.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.gloves.dropRate == "" then
						playerInfos.gear.gloves.dropRate = "Unknown"
					end
					playerInfos.gear.gloves.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.gloves.expansion == "" then
						playerInfos.gear.gloves.expansion = "Unknown"
					end
				elseif i == 15 then
					playerInfos.gear.back.name = appearanceName;
					playerInfos.gear.back.sourceName = wowItemDB.getSource(itemLink);
					if playerInfos.gear.back.sourceName == "" then
						playerInfos.gear.back.sourceName = "Unknown"
					end
					playerInfos.gear.back.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.back.location == "" then
						playerInfos.gear.back.location = "Unknown"
					end
					playerInfos.gear.back.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.back.locationTerritory == "" then
						playerInfos.gear.back.locationTerritory = "Unknown"
					end
					playerInfos.gear.back.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.back.locationCategory == "" then
						playerInfos.gear.back.locationCategory = "Unknown"
					end
					playerInfos.gear.back.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.back.dropRate == "" then
						playerInfos.gear.back.dropRate = "Unknown"
					end
					playerInfos.gear.back.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.back.expansion == "" then
						playerInfos.gear.back.expansion = "Unknown"
					end
				elseif i == 16 then
					playerInfos.gear.weapon.name = appearanceName;
					playerInfos.gear.weapon.sourceName = wowItemDB.getSource(itemLink);
					if playerInfos.gear.weapon.sourceName == "" then
						playerInfos.gear.weapon.sourceName = "Unknown"
					end
					playerInfos.gear.weapon.location = wowItemDB.getLocation(itemLink);
					if playerInfos.gear.weapon.location == "" then
						playerInfos.gear.weapon.location = "Unknown"
					end
					playerInfos.gear.weapon.locationTerritory = wowItemDB.getTerritory(itemLink);
					if playerInfos.gear.weapon.locationTerritory == "" then
						playerInfos.gear.weapon.locationTerritory = "Unknown"
					end
					playerInfos.gear.weapon.locationCategory = wowItemDB.getCategoryTerritory(itemLink);
					if playerInfos.gear.weapon.locationCategory == "" then
						playerInfos.gear.weapon.locationCategory = "Unknown"
					end
					playerInfos.gear.weapon.dropRate = wowItemDB.getDropRate(itemLink);
					if playerInfos.gear.weapon.dropRate == "" then
						playerInfos.gear.weapon.dropRate = "Unknown"
					end
					playerInfos.gear.weapon.expansion = wowItemDB.getExpansion(itemLink);
					if playerInfos.gear.weapon.expansion == "" then
						playerInfos.gear.weapon.expansion = "Unknown"
					end
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