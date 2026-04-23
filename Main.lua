local library = {}
local par = game.CoreGui
if _G.ToggleUi == nil then _G.ToggleUi = true end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService('RunService')
local camera = workspace.CurrentCamera
local DDX,DDY
local Mouse = game.Players.LocalPlayer:GetMouse()
local BlurFrameL = loadstring(game:HttpGet('https://raw.githubusercontent.com/aresZee7/aresLibrary/main/BlurFrame'))()

if par:FindFirstChild('Lux002') then par:FindFirstChild('Lux002'):Destroy() end


function dragify(Frame, object)
	local dragToggle = false
	local dragSpeed = 0.25
	local dragInput = nil
	local dragStart = nil
	local startPos = nil

	function updateInput(input)
		if not dragStart then
			return
		end
		local Delta = input.Position - dragStart
		if _G['ทำให้ UI ไม่ออก ขอบ'] then
			Delta = Vector2.new(math.clamp(startPos.X.Offset + Delta.X, -DDX, DDX), math.clamp(startPos.Y.Offset +  Delta.Y, -DDY, DDY))
			local Position = UDim2.new(startPos.X.Scale, Delta.X, startPos.Y.Scale, Delta.Y)
			TweenService:Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
		else
			Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
		end

	end

	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragToggle = true
			dragStart = input.Position
			startPos = object.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
local MainDirectory = "Dummy UI"
local AssetsDirectory = "Dummy UI\\Assets"
local function CheckDirectory()
	if getgenv then
		if not isfolder(MainDirectory) then
			makefolder(MainDirectory)
		end
		if not isfolder(AssetsDirectory) then
			makefolder(AssetsDirectory)
		end
	end
end
local function GetImage(name, url)
	if getgenv then
		CheckDirectory()

		local path = string.format("%s\\%s.png", AssetsDirectory, name)
		if not isfile(path) then
			local content = game:HttpGet(url)
			writefile(path, content)
		end

		return getcustomasset(path)
	end
end

if par:FindFirstChild('Lux002') then
	par:FindFirstChild('Lux002'):Destroy()
end

local Lux002 = Instance.new("ScreenGui")
Lux002.Name = "Lux002"
Lux002.Parent = par
Lux002.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function library.Create(options)

	local Shadown = Instance.new("ImageLabel")

	Shadown.Name = "Shadown"
	Shadown.Parent = Lux002
	Shadown.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadown.BackgroundColor3 = Color3.fromRGB(48, 51, 71)
	Shadown.BackgroundTransparency = 1.000
	Shadown.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadown.Size = UDim2.new(0, options.UISize.X, 0, options.UISize.Y) -- {0, 755},{0, 425} > PC 
	Shadown.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Shadown.ZIndex = 0
	Shadown.Image = "rbxassetid://7912134082"
	Shadown.ImageColor3 = options.UIColor['Shadow'] or Color3.fromRGB(48, 51, 71)
	Shadown.ImageTransparency = 0.300
	Shadown.SliceCenter = Rect.new(95, 95, 205, 205)

	local MainBackground = options.UIColor['MainBackground']
	local Background2 = options.UIColor['Background2']
	local ToggleOC = options.UIColor['ToggleO']
	local TapC = options.UIColor['TapButtonColor']
	local DropDownSelect = options.UIColor['DropDownSelect']
	local TextColorUI = options.UIColor['TextColor']

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Parent = Shadown
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
	Main.BackgroundTransparency = 0
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)

	local UICorner_24 = Instance.new("UICorner")
	UICorner_24.CornerRadius = UDim.new(0, options.CornerRadius)
	UICorner_24.Parent = Main

	local Loading = Instance.new("Frame")
	local UICorner_25 = Instance.new("UICorner")
	local LoadLogo = Instance.new("ImageLabel")
	local TextLabel_6 = Instance.new("TextLabel")

	Loading.Name = "Loading"
	Loading.Parent = Main
	Loading.AnchorPoint = Vector2.new(0.5, 0.5)
	Loading.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
	Loading.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Loading.BorderSizePixel = 0
	Loading.Position = UDim2.new(0.5, 0, 0.5, 0)
	Loading.Size = UDim2.new(1, 0, 1, 0)
	Loading.ZIndex = 9999
	Loading.Visible = false

	UICorner_25.CornerRadius = UDim.new(0, options.CornerRadius)
	UICorner_25.Parent = Loading

	LoadLogo.Name = "LoadLogo"
	LoadLogo.Parent = Loading
	LoadLogo.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadLogo.BackgroundTransparency = 1.000
	LoadLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadLogo.BorderSizePixel = 0
	LoadLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
	LoadLogo.Size = UDim2.new(0, 70, 0, 70)
	LoadLogo.ZIndex = 2
	if type(options.Logo) == 'string' and not options.Logo:find('rbxassetid://') then
		LoadLogo.Image = "rbxassetid://".. options.Logo
	elseif type(options.Logo) == 'number' then
		LoadLogo.Image = "rbxassetid://".. options.Logo
	else
		LoadLogo.Image = options.Logo
	end

	TextLabel_6.Parent = Loading
	TextLabel_6.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_6.BackgroundTransparency = 1.000
	TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_6.BorderSizePixel = 0
	TextLabel_6.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel_6.Size = UDim2.new(0, 200, 0, 50)
	TextLabel_6.ZIndex = 2
	TextLabel_6.Font = Enum.Font.FredokaOne
	TextLabel_6.Text = options.Title .. " Community"
	TextLabel_6.TextColor3 = Color3.fromRGB(189, 198, 212)
	TextLabel_6.TextSize = 14.000
	TextLabel_6.TextTransparency = 1.000

	local OP = false
	local function NNNF_fake_script()
		local script = Instance.new('LocalScript', Loading)

		local Type__ = 1
		delay(1, function()
			for i = 1,10 do
				script.Parent.Visible = true
				game:GetService("TweenService"):Create(
					script.Parent.LoadLogo,
					TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Rotation = 180 * i}
				):Play()
				if i >= 3 then
					game:GetService("TweenService"):Create(
						script.Parent.LoadLogo,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Position = UDim2.new(0.5, 0, 0.5, -30)}
					):Play()
					delay(1, function()
						game:GetService("TweenService"):Create(
							script.Parent.TextLabel,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
						game:GetService("TweenService"):Create(
							script.Parent.TextLabel,
							TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.5, 30)}
						):Play()
						if i == 10 then
							OP = true
						end
					end)
				end
				wait(.002)
			end
		end)
		repeat task.wait() until OP == true
		task.delay(1, function()
			game:GetService("TweenService"):Create(
				script.Parent,
				TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 0, 0, 0)}
			):Play()
			game:GetService("TweenService"):Create(
				script.Parent.TextLabel,
				TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
			game:GetService("TweenService"):Create(
				script.Parent.LoadLogo,
				TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
				{ImageTransparency = 1}
			):Play()
		end)
	end
	coroutine.wrap(NNNF_fake_script)()
	repeat task.wait() until OP == true


	local Top = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	Top.Name = "Top"
	Top.Parent = Main
	Top.Active = true
	Top.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
	Top.BackgroundTransparency = 1.000
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Position = UDim2.new(0, 0, 0.0222222228, 0)
	Top.Size = UDim2.new(1, 0, 0.00999999978, 40)

	UICorner.CornerRadius = UDim.new(0, options.CornerRadius)
	UICorner.Parent = Top

	local frame,object = Top, Shadown
	local BlurFrame2 = BlurFrameL:BlurFrame(Main)
	if DDX == nil then DDX = object.AbsolutePosition.X end
	if DDY == nil then DDY = object.AbsolutePosition.Y end

	dragify(frame, object)

	local Cup = Instance.new("Frame")
	local NameHub = Instance.new("TextLabel")
	local LogoHub = Instance.new("ImageLabel")

	Cup.Name = "Cup"
	Cup.Parent = Top
	Cup.Active = true
	Cup.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
	Cup.BackgroundTransparency = 1.000
	Cup.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Cup.BorderSizePixel = 0
	Cup.Position = UDim2.new(0, 0, 0.467185766, 0)
	Cup.Size = UDim2.new(1, 0, -0.357063383, 40)

	NameHub.Name = "NameHub"
	NameHub.Parent = Top
	NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.BackgroundTransparency = 1.000
	NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NameHub.BorderSizePixel = 0
	NameHub.ClipsDescendants = true
	NameHub.Position = UDim2.new(0.0851851851, 0, 0, 0)
	NameHub.Size = UDim2.new(0.298148155, 0, 0.986308813, 0)
	NameHub.Text = options.Title
	NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.TextSize = 12.000
	NameHub.TextXAlignment = Enum.TextXAlignment.Left
	NameHub.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

	LogoHub.Name = "Logo Hub"
	LogoHub.Parent = Top
	LogoHub.AnchorPoint = Vector2.new(0.5, 0.5)
	LogoHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoHub.BackgroundTransparency = 1.000
	LogoHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoHub.BorderSizePixel = 0
	LogoHub.Position = UDim2.new(0.053703703, 0, 0.499999881, 0)
	LogoHub.Size = UDim2.new(0, 30, 0, 30)
	if type(options.Logo) == 'string' and not options.Logo:find('rbxassetid://') then
		LogoHub.Image = "rbxassetid://".. options.Logo
	elseif type(options.Logo) == 'number' then
		LogoHub.Image = "rbxassetid://".. options.Logo
	else
		LogoHub.Image = options.Logo
	end

	local MainPage = Instance.new("Frame")
	MainPage.Name = "MainPage"
	MainPage.Parent = Main
	MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainPage.BackgroundTransparency = 4.000
	MainPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainPage.BorderSizePixel = 0
	MainPage.Position = UDim2.new(0.214814797, 0, 0.141666651, 0)
	MainPage.Size = UDim2.new(0.769999981, 0, 0.850000024, 0)

	local Tap = Instance.new("Frame")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")

	Tap.Name = "Tap"
	Tap.Parent = Main
	Tap.AnchorPoint = Vector2.new(0, 0.5)
	Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tap.BackgroundTransparency = 1.000
	Tap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tap.BorderSizePixel = 0
	Tap.Position = UDim2.new(0.0129999798, 0, 0.5625, 0)
	Tap.Size = UDim2.new(0.200000003, 0, 0.834686875, 0)

	ScrollingFrame.Parent = Tap
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.ScrollBarImageTransparency = 0.800000011920929
	ScrollingFrame.ScrollBarThickness = 1

	UIPadding.Parent = ScrollingFrame
	UIPadding.PaddingLeft = UDim.new(0, 5)

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	local OpenUI = true
	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.RightControl then
			if OpenUI then
				OpenUI = false
				Shadown.Visible = false
				for i = 1,2 do
					BlurFrame2[i]:Destroy()
				end
			else
				OpenUI = true
				Shadown.Visible = true
				BlurFrame2 = BlurFrameL:BlurFrame(Main)
			end
		end
	end)

	if _G.ToggleUi then
		local CloseUI = Instance.new("ScreenGui")
		local CloseUIMain = Instance.new("Frame")
		local Logo = Instance.new("ImageLabel")
		local UICorner = Instance.new("UICorner")
		local Use = Instance.new("TextButton")

		CloseUI.Name = "CloseUI"
		CloseUI.Parent = par
		CloseUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		CloseUIMain.Name = "CloseUIMain"
		CloseUIMain.Parent = CloseUI
		CloseUIMain.BackgroundColor3 = MainBackground
		CloseUIMain.BorderColor3 = Color3.new(0, 0, 0)
		CloseUIMain.BorderSizePixel = 0
		CloseUIMain.Position = UDim2.new(0.0319926888, 0, 0.129, 0)
		CloseUIMain.Size = UDim2.new(0, 75, 0, 0)

		CloseUIMain:TweenSize(UDim2.new(0, 75, 0, 51),"Out","Back",3.5,false)

		Logo.Name = "Logo"
		Logo.Parent = CloseUIMain
		Logo.BackgroundColor3 = Color3.new(1, 1, 1)
		Logo.BackgroundTransparency = 1
		Logo.BorderColor3 = Color3.new(0, 0, 0)
		Logo.BorderSizePixel = 0
		Logo.Position = UDim2.new(0.323333323, 0, 0.235294119, 0)
		Logo.Size = UDim2.new(0.349999994, 0, 0.5, 0)
		if type(options.Logo) == 'string' and not options.Logo:find('rbxassetid://') then
			Logo.Image = "rbxassetid://".. options.Logo
		elseif type(options.Logo) == 'number' then
			Logo.Image = "rbxassetid://".. options.Logo
		else
			Logo.Image = options.Logo
		end


		UICorner.Parent = CloseUIMain
		UICorner.CornerRadius = UDim.new(0, 100)

		Use.Name = "Use"
		Use.Parent = CloseUIMain
		Use.BackgroundColor3 = Color3.new(1, 1, 1)
		Use.BackgroundTransparency = 1
		Use.BorderColor3 = Color3.new(0, 0, 0)
		Use.BorderSizePixel = 0
		Use.Size = UDim2.new(1, 0, 1, 0)
		Use.Font = Enum.Font.SourceSans
		Use.Text = ""
		Use.TextColor3 = Color3.new(0, 0, 0)
		Use.TextSize = 14

		Use.MouseButton1Click:Connect(function()
			if OpenUI then
				OpenUI = false
				Shadown.Visible = false
				for i = 1,2 do
					BlurFrame2[i]:Destroy()
				end
			else
				OpenUI = true
				Shadown.Visible = true
				BlurFrame2 = BlurFrameL:BlurFrame(Main)
			end
		end)
	end

	library.TapGroup = {
		Value = false
	}
	library.TapGroup.CreateTap = function(options)
		local TapTitle = options.Title or ""
		local TapIcon = options.Icon or ""

		local ButtonTap = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")
		local ImageLabel = Instance.new("ImageLabel")
		local TextLabel = Instance.new("TextLabel")

		ButtonTap.Name = "ButtonTap"
		ButtonTap.Parent = ScrollingFrame
		ButtonTap.BackgroundColor3 = Color3.fromRGB(161, 155, 76)
		ButtonTap.BackgroundTransparency = 1.000
		ButtonTap.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ButtonTap.BorderSizePixel = 0
		ButtonTap.Position = UDim2.new(0, 0, 3.58570489e-08, 0)
		ButtonTap.Size = UDim2.new(0.949999988, 0, 0, 29)
		ButtonTap.Font = Enum.Font.SourceSans
		ButtonTap.Text = ""
		ButtonTap.TextColor3 = Color3.fromRGB(0, 0, 0)
		ButtonTap.TextSize = 14.000

		UICorner_2.CornerRadius = UDim.new(0, 5)
		UICorner_2.Parent = ButtonTap

		local assets = {
			["accessibility"] = "rbxassetid://10709751939",
			["activity"] = "rbxassetid://10709752035",
			["air-vent"] = "rbxassetid://10709752131",
			["airplay"] = "rbxassetid://10709752254",
			["alarm-check"] = "rbxassetid://10709752405",
			["alarm-clock"] = "rbxassetid://10709752630",
			["alarm-clock-off"] = "rbxassetid://10709752508",
			["alarm-minus"] = "rbxassetid://10709752732",
			["alarm-plus"] = "rbxassetid://10709752825",
			["album"] = "rbxassetid://10709752906",
			["alert-circle"] = "rbxassetid://10709752996",
			["alert-octagon"] = "rbxassetid://10709753064",
			["alert-triangle"] = "rbxassetid://10709753149",
			["align-center"] = "rbxassetid://10709753570",
			["align-center-horizontal"] = "rbxassetid://10709753272",
			["align-center-vertical"] = "rbxassetid://10709753421",
			["align-end-horizontal"] = "rbxassetid://10709753692",
			["align-end-vertical"] = "rbxassetid://10709753808",
			["align-horizontal-distribute-center"] = "rbxassetid://10747779791",
			["align-horizontal-distribute-end"] = "rbxassetid://10747784534",
			["align-horizontal-distribute-start"] = "rbxassetid://10709754118",
			["align-horizontal-justify-center"] = "rbxassetid://10709754204",
			["align-horizontal-justify-end"] = "rbxassetid://10709754317",
			["align-horizontal-justify-start"] = "rbxassetid://10709754436",
			["align-horizontal-space-around"] = "rbxassetid://10709754590",
			["align-horizontal-space-between"] = "rbxassetid://10709754749",
			["align-justify"] = "rbxassetid://10709759610",
			["align-left"] = "rbxassetid://10709759764",
			["align-right"] = "rbxassetid://10709759895",
			["align-start-horizontal"] = "rbxassetid://10709760051",
			["align-start-vertical"] = "rbxassetid://10709760244",
			["align-vertical-distribute-center"] = "rbxassetid://10709760351",
			["align-vertical-distribute-end"] = "rbxassetid://10709760434",
			["align-vertical-distribute-start"] = "rbxassetid://10709760612",
			["align-vertical-justify-center"] = "rbxassetid://10709760814",
			["align-vertical-justify-end"] = "rbxassetid://10709761003",
			["align-vertical-justify-start"] = "rbxassetid://10709761176",
			["align-vertical-space-around"] = "rbxassetid://10709761324",
			["align-vertical-space-between"] = "rbxassetid://10709761434",
			["anchor"] = "rbxassetid://10709761530",
			["angry"] = "rbxassetid://10709761629",
			["annoyed"] = "rbxassetid://10709761722",
			["aperture"] = "rbxassetid://10709761813",
			["apple"] = "rbxassetid://10709761889",
			["archive"] = "rbxassetid://10709762233",
			["archive-restore"] = "rbxassetid://10709762058",
			["armchair"] = "rbxassetid://10709762327",
			["arrow-big-down"] = "rbxassetid://10747796644",
			["arrow-big-left"] = "rbxassetid://10709762574",
			["arrow-big-right"] = "rbxassetid://10709762727",
			["arrow-big-up"] = "rbxassetid://10709762879",
			["arrow-down"] = "rbxassetid://10709767827",
			["arrow-down-circle"] = "rbxassetid://10709763034",
			["arrow-down-left"] = "rbxassetid://10709767656",
			["arrow-down-right"] = "rbxassetid://10709767750",
			["arrow-left"] = "rbxassetid://10709768114",
			["arrow-left-circle"] = "rbxassetid://10709767936",
			["arrow-left-right"] = "rbxassetid://10709768019",
			["arrow-right"] = "rbxassetid://10709768347",
			["arrow-right-circle"] = "rbxassetid://10709768226",
			["arrow-up"] = "rbxassetid://10709768939",
			["arrow-up-circle"] = "rbxassetid://10709768432",
			["arrow-up-down"] = "rbxassetid://10709768538",
			["arrow-up-left"] = "rbxassetid://10709768661",
			["arrow-up-right"] = "rbxassetid://10709768787",
			["asterisk"] = "rbxassetid://10709769095",
			["at-sign"] = "rbxassetid://10709769286",
			["award"] = "rbxassetid://10709769406",
			["axe"] = "rbxassetid://10709769508",
			["axis-3d"] = "rbxassetid://10709769598",
			["baby"] = "rbxassetid://10709769732",
			["backpack"] = "rbxassetid://10709769841",
			["baggage-claim"] = "rbxassetid://10709769935",
			["banana"] = "rbxassetid://10709770005",
			["banknote"] = "rbxassetid://10709770178",
			["bar-chart"] = "rbxassetid://10709773755",
			["bar-chart-2"] = "rbxassetid://10709770317",
			["bar-chart-3"] = "rbxassetid://10709770431",
			["bar-chart-4"] = "rbxassetid://10709770560",
			["bar-chart-horizontal"] = "rbxassetid://10709773669",
			["barcode"] = "rbxassetid://10747360675",
			["baseline"] = "rbxassetid://10709773863",
			["bath"] = "rbxassetid://10709773963",
			["battery"] = "rbxassetid://10709774640",
			["battery-charging"] = "rbxassetid://10709774068",
			["battery-full"] = "rbxassetid://10709774206",
			["battery-low"] = "rbxassetid://10709774370",
			["battery-medium"] = "rbxassetid://10709774513",
			["beaker"] = "rbxassetid://10709774756",
			["bed"] = "rbxassetid://10709775036",
			["bed-double"] = "rbxassetid://10709774864",
			["bed-single"] = "rbxassetid://10709774968",
			["beer"] = "rbxassetid://10709775167",
			["bell"] = "rbxassetid://10709775704",
			["bell-minus"] = "rbxassetid://10709775241",
			["bell-off"] = "rbxassetid://10709775320",
			["bell-plus"] = "rbxassetid://10709775448",
			["bell-ring"] = "rbxassetid://10709775560",
			["bike"] = "rbxassetid://10709775894",
			["binary"] = "rbxassetid://10709776050",
			["bitcoin"] = "rbxassetid://10709776126",
			["bluetooth"] = "rbxassetid://10709776655",
			["bluetooth-connected"] = "rbxassetid://10709776240",
			["bluetooth-off"] = "rbxassetid://10709776344",
			["bluetooth-searching"] = "rbxassetid://10709776501",
			["bold"] = "rbxassetid://10747813908",
			["bomb"] = "rbxassetid://10709781460",
			["bone"] = "rbxassetid://10709781605",
			["book"] = "rbxassetid://10709781824",
			["book-open"] = "rbxassetid://10709781717",
			["bookmark"] = "rbxassetid://10709782154",
			["bookmark-minus"] = "rbxassetid://10709781919",
			["bookmark-plus"] = "rbxassetid://10709782044",
			["bot"] = "rbxassetid://10709782230",
			["box"] = "rbxassetid://10709782497",
			["box-select"] = "rbxassetid://10709782342",
			["boxes"] = "rbxassetid://10709782582",
			["briefcase"] = "rbxassetid://10709782662",
			["brush"] = "rbxassetid://10709782758",
			["bug"] = "rbxassetid://10709782845",
			["building"] = "rbxassetid://10709783051",
			["building-2"] = "rbxassetid://10709782939",
			["bus"] = "rbxassetid://10709783137",
			["cake"] = "rbxassetid://10709783217",
			["calculator"] = "rbxassetid://10709783311",
			["calendar"] = "rbxassetid://10709789505",
			["calendar-check"] = "rbxassetid://10709783474",
			["calendar-check-2"] = "rbxassetid://10709783392",
			["calendar-clock"] = "rbxassetid://10709783577",
			["calendar-days"] = "rbxassetid://10709783673",
			["calendar-heart"] = "rbxassetid://10709783835",
			["calendar-minus"] = "rbxassetid://10709783959",
			["calendar-off"] = "rbxassetid://10709788784",
			["calendar-plus"] = "rbxassetid://10709788937",
			["calendar-range"] = "rbxassetid://10709789053",
			["calendar-search"] = "rbxassetid://10709789200",
			["calendar-x"] = "rbxassetid://10709789407",
			["calendar-x-2"] = "rbxassetid://10709789329",
			["camera"] = "rbxassetid://10709789686",
			["camera-off"] = "rbxassetid://10747822677",
			["car"] = "rbxassetid://10709789810",
			["carrot"] = "rbxassetid://10709789960",
			["cast"] = "rbxassetid://10709790097",
			["charge"] = "rbxassetid://10709790202",
			["check"] = "rbxassetid://10709790644",
			["check-circle"] = "rbxassetid://10709790387",
			["check-circle-2"] = "rbxassetid://10709790298",
			["check-square"] = "rbxassetid://10709790537",
			["chef-hat"] = "rbxassetid://10709790757",
			["cherry"] = "rbxassetid://10709790875",
			["chevron-down"] = "rbxassetid://10709790948",
			["chevron-first"] = "rbxassetid://10709791015",
			["chevron-last"] = "rbxassetid://10709791130",
			["chevron-left"] = "rbxassetid://10709791281",
			["chevron-right"] = "rbxassetid://10709791437",
			["chevron-up"] = "rbxassetid://10709791523",
			["chevrons-down"] = "rbxassetid://10709796864",
			["chevrons-down-up"] = "rbxassetid://10709791632",
			["chevrons-left"] = "rbxassetid://10709797151",
			["chevrons-left-right"] = "rbxassetid://10709797006",
			["chevrons-right"] = "rbxassetid://10709797382",
			["chevrons-right-left"] = "rbxassetid://10709797274",
			["chevrons-up"] = "rbxassetid://10709797622",
			["chevrons-up-down"] = "rbxassetid://10709797508",
			["chrome"] = "rbxassetid://10709797725",
			["circle"] = "rbxassetid://10709798174",
			["circle-dot"] = "rbxassetid://10709797837",
			["circle-ellipsis"] = "rbxassetid://10709797985",
			["circle-slashed"] = "rbxassetid://10709798100",
			["citrus"] = "rbxassetid://10709798276",
			["clapperboard"] = "rbxassetid://10709798350",
			["clipboard"] = "rbxassetid://10709799288",
			["clipboard-check"] = "rbxassetid://10709798443",
			["clipboard-copy"] = "rbxassetid://10709798574",
			["clipboard-edit"] = "rbxassetid://10709798682",
			["clipboard-list"] = "rbxassetid://10709798792",
			["clipboard-signature"] = "rbxassetid://10709798890",
			["clipboard-type"] = "rbxassetid://10709798999",
			["clipboard-x"] = "rbxassetid://10709799124",
			["clock"] = "rbxassetid://10709805144",
			["clock-1"] = "rbxassetid://10709799535",
			["clock-10"] = "rbxassetid://10709799718",
			["clock-11"] = "rbxassetid://10709799818",
			["clock-12"] = "rbxassetid://10709799962",
			["clock-2"] = "rbxassetid://10709803876",
			["clock-3"] = "rbxassetid://10709803989",
			["clock-4"] = "rbxassetid://10709804164",
			["clock-5"] = "rbxassetid://10709804291",
			["clock-6"] = "rbxassetid://10709804435",
			["clock-7"] = "rbxassetid://10709804599",
			["clock-8"] = "rbxassetid://10709804784",
			["clock-9"] = "rbxassetid://10709804996",
			["cloud"] = "rbxassetid://10709806740",
			["cloud-cog"] = "rbxassetid://10709805262",
			["cloud-drizzle"] = "rbxassetid://10709805371",
			["cloud-fog"] = "rbxassetid://10709805477",
			["cloud-hail"] = "rbxassetid://10709805596",
			["cloud-lightning"] = "rbxassetid://10709805727",
			["cloud-moon"] = "rbxassetid://10709805942",
			["cloud-moon-rain"] = "rbxassetid://10709805838",
			["cloud-off"] = "rbxassetid://10709806060",
			["cloud-rain"] = "rbxassetid://10709806277",
			["cloud-rain-wind"] = "rbxassetid://10709806166",
			["cloud-snow"] = "rbxassetid://10709806374",
			["cloud-sun"] = "rbxassetid://10709806631",
			["cloud-sun-rain"] = "rbxassetid://10709806475",
			["cloudy"] = "rbxassetid://10709806859",
			["clover"] = "rbxassetid://10709806995",
			["code"] = "rbxassetid://10709810463",
			["code-2"] = "rbxassetid://10709807111",
			["codepen"] = "rbxassetid://10709810534",
			["codesandbox"] = "rbxassetid://10709810676",
			["coffee"] = "rbxassetid://10709810814",
			["cog"] = "rbxassetid://10709810948",
			["coins"] = "rbxassetid://10709811110",
			["columns"] = "rbxassetid://10709811261",
			["command"] = "rbxassetid://10709811365",
			["compass"] = "rbxassetid://10709811445",
			["component"] = "rbxassetid://10709811595",
			["concierge-bell"] = "rbxassetid://10709811706",
			["connection"] = "rbxassetid://10747361219",
			["contact"] = "rbxassetid://10709811834",
			["contrast"] = "rbxassetid://10709811939",
			["cookie"] = "rbxassetid://10709812067",
			["copy"] = "rbxassetid://10709812159",
			["copyleft"] = "rbxassetid://10709812251",
			["copyright"] = "rbxassetid://10709812311",
			["corner-down-left"] = "rbxassetid://10709812396",
			["corner-down-right"] = "rbxassetid://10709812485",
			["corner-left-down"] = "rbxassetid://10709812632",
			["corner-left-up"] = "rbxassetid://10709812784",
			["corner-right-down"] = "rbxassetid://10709812939",
			["corner-right-up"] = "rbxassetid://10709813094",
			["corner-up-left"] = "rbxassetid://10709813185",
			["corner-up-right"] = "rbxassetid://10709813281",
			["cpu"] = "rbxassetid://10709813383",
			["croissant"] = "rbxassetid://10709818125",
			["crop"] = "rbxassetid://10709818245",
			["cross"] = "rbxassetid://10709818399",
			["crosshair"] = "rbxassetid://10709818534",
			["crown"] = "rbxassetid://10709818626",
			["cup-soda"] = "rbxassetid://10709818763",
			["curly-braces"] = "rbxassetid://10709818847",
			["currency"] = "rbxassetid://10709818931",
			["database"] = "rbxassetid://10709818996",
			["delete"] = "rbxassetid://10709819059",
			["diamond"] = "rbxassetid://10709819149",
			["dice-1"] = "rbxassetid://10709819266",
			["dice-2"] = "rbxassetid://10709819361",
			["dice-3"] = "rbxassetid://10709819508",
			["dice-4"] = "rbxassetid://10709819670",
			["dice-5"] = "rbxassetid://10709819801",
			["dice-6"] = "rbxassetid://10709819896",
			["dices"] = "rbxassetid://10723343321",
			["diff"] = "rbxassetid://10723343416",
			["disc"] = "rbxassetid://10723343537",
			["divide"] = "rbxassetid://10723343805",
			["divide-circle"] = "rbxassetid://10723343636",
			["divide-square"] = "rbxassetid://10723343737",
			["dollar-sign"] = "rbxassetid://10723343958",
			["download"] = "rbxassetid://10723344270",
			["download-cloud"] = "rbxassetid://10723344088",
			["droplet"] = "rbxassetid://10723344432",
			["droplets"] = "rbxassetid://10734883356",
			["drumstick"] = "rbxassetid://10723344737",
			["edit"] = "rbxassetid://10734883598",
			["edit-2"] = "rbxassetid://10723344885",
			["edit-3"] = "rbxassetid://10723345088",
			["egg"] = "rbxassetid://10723345518",
			["egg-fried"] = "rbxassetid://10723345347",
			["electricity"] = "rbxassetid://10723345749",
			["electricity-off"] = "rbxassetid://10723345643",
			["equal"] = "rbxassetid://10723345990",
			["equal-not"] = "rbxassetid://10723345866",
			["eraser"] = "rbxassetid://10723346158",
			["euro"] = "rbxassetid://10723346372",
			["expand"] = "rbxassetid://10723346553",
			["external-link"] = "rbxassetid://10723346684",
			["eye"] = "rbxassetid://10723346959",
			["eye-off"] = "rbxassetid://10723346871",
			["factory"] = "rbxassetid://10723347051",
			["fan"] = "rbxassetid://10723354359",
			["fast-forward"] = "rbxassetid://10723354521",
			["feather"] = "rbxassetid://10723354671",
			["figma"] = "rbxassetid://10723354801",
			["file"] = "rbxassetid://10723374641",
			["file-archive"] = "rbxassetid://10723354921",
			["file-audio"] = "rbxassetid://10723355148",
			["file-audio-2"] = "rbxassetid://10723355026",
			["file-axis-3d"] = "rbxassetid://10723355272",
			["file-badge"] = "rbxassetid://10723355622",
			["file-badge-2"] = "rbxassetid://10723355451",
			["file-bar-chart"] = "rbxassetid://10723355887",
			["file-bar-chart-2"] = "rbxassetid://10723355746",
			["file-box"] = "rbxassetid://10723355989",
			["file-check"] = "rbxassetid://10723356210",
			["file-check-2"] = "rbxassetid://10723356100",
			["file-clock"] = "rbxassetid://10723356329",
			["file-code"] = "rbxassetid://10723356507",
			["file-cog"] = "rbxassetid://10723356830",
			["file-cog-2"] = "rbxassetid://10723356676",
			["file-diff"] = "rbxassetid://10723357039",
			["file-digit"] = "rbxassetid://10723357151",
			["file-down"] = "rbxassetid://10723357322",
			["file-edit"] = "rbxassetid://10723357495",
			["file-heart"] = "rbxassetid://10723357637",
			["file-image"] = "rbxassetid://10723357790",
			["file-input"] = "rbxassetid://10723357933",
			["file-json"] = "rbxassetid://10723364435",
			["file-json-2"] = "rbxassetid://10723364361",
			["file-key"] = "rbxassetid://10723364605",
			["file-key-2"] = "rbxassetid://10723364515",
			["file-line-chart"] = "rbxassetid://10723364725",
			["file-lock"] = "rbxassetid://10723364957",
			["file-lock-2"] = "rbxassetid://10723364861",
			["file-minus"] = "rbxassetid://10723365254",
			["file-minus-2"] = "rbxassetid://10723365086",
			["file-output"] = "rbxassetid://10723365457",
			["file-pie-chart"] = "rbxassetid://10723365598",
			["file-plus"] = "rbxassetid://10723365877",
			["file-plus-2"] = "rbxassetid://10723365766",
			["file-question"] = "rbxassetid://10723365987",
			["file-scan"] = "rbxassetid://10723366167",
			["file-search"] = "rbxassetid://10723366550",
			["file-search-2"] = "rbxassetid://10723366340",
			["file-signature"] = "rbxassetid://10723366741",
			["file-spreadsheet"] = "rbxassetid://10723366962",
			["file-symlink"] = "rbxassetid://10723367098",
			["file-terminal"] = "rbxassetid://10723367244",
			["file-text"] = "rbxassetid://10723367380",
			["file-type"] = "rbxassetid://10723367606",
			["file-type-2"] = "rbxassetid://10723367509",
			["file-up"] = "rbxassetid://10723367734",
			["file-video"] = "rbxassetid://10723373884",
			["file-video-2"] = "rbxassetid://10723367834",
			["file-volume"] = "rbxassetid://10723374172",
			["file-volume-2"] = "rbxassetid://10723374030",
			["file-warning"] = "rbxassetid://10723374276",
			["file-x"] = "rbxassetid://10723374544",
			["file-x-2"] = "rbxassetid://10723374378",
			["files"] = "rbxassetid://10723374759",
			["film"] = "rbxassetid://10723374981",
			["filter"] = "rbxassetid://10723375128",
			["fingerprint"] = "rbxassetid://10723375250",
			["flag"] = "rbxassetid://10723375890",
			["flag-off"] = "rbxassetid://10723375443",
			["flag-triangle-left"] = "rbxassetid://10723375608",
			["flag-triangle-right"] = "rbxassetid://10723375727",
			["flame"] = "rbxassetid://10723376114",
			["flashlight"] = "rbxassetid://10723376471",
			["flashlight-off"] = "rbxassetid://10723376365",
			["flask-conical"] = "rbxassetid://10734883986",
			["flask-round"] = "rbxassetid://10723376614",
			["flip-horizontal"] = "rbxassetid://10723376884",
			["flip-horizontal-2"] = "rbxassetid://10723376745",
			["flip-vertical"] = "rbxassetid://10723377138",
			["flip-vertical-2"] = "rbxassetid://10723377026",
			["flower"] = "rbxassetid://10747830374",
			["flower-2"] = "rbxassetid://10723377305",
			["focus"] = "rbxassetid://10723377537",
			["folder"] = "rbxassetid://10723387563",
			["folder-archive"] = "rbxassetid://10723384478",
			["folder-check"] = "rbxassetid://10723384605",
			["folder-clock"] = "rbxassetid://10723384731",
			["folder-closed"] = "rbxassetid://10723384893",
			["folder-cog"] = "rbxassetid://10723385213",
			["folder-cog-2"] = "rbxassetid://10723385036",
			["folder-down"] = "rbxassetid://10723385338",
			["folder-edit"] = "rbxassetid://10723385445",
			["folder-heart"] = "rbxassetid://10723385545",
			["folder-input"] = "rbxassetid://10723385721",
			["folder-key"] = "rbxassetid://10723385848",
			["folder-lock"] = "rbxassetid://10723386005",
			["folder-minus"] = "rbxassetid://10723386127",
			["folder-open"] = "rbxassetid://10723386277",
			["folder-output"] = "rbxassetid://10723386386",
			["folder-plus"] = "rbxassetid://10723386531",
			["folder-search"] = "rbxassetid://10723386787",
			["folder-search-2"] = "rbxassetid://10723386674",
			["folder-symlink"] = "rbxassetid://10723386930",
			["folder-tree"] = "rbxassetid://10723387085",
			["folder-up"] = "rbxassetid://10723387265",
			["folder-x"] = "rbxassetid://10723387448",
			["folders"] = "rbxassetid://10723387721",
			["form-input"] = "rbxassetid://10723387841",
			["forward"] = "rbxassetid://10723388016",
			["frame"] = "rbxassetid://10723394389",
			["framer"] = "rbxassetid://10723394565",
			["frown"] = "rbxassetid://10723394681",
			["fuel"] = "rbxassetid://10723394846",
			["function-square"] = "rbxassetid://10723395041",
			["gamepad"] = "rbxassetid://10723395457",
			["gamepad-2"] = "rbxassetid://10723395215",
			["gauge"] = "rbxassetid://10723395708",
			["gavel"] = "rbxassetid://10723395896",
			["gem"] = "rbxassetid://10723396000",
			["ghost"] = "rbxassetid://10723396107",
			["gift"] = "rbxassetid://10723396402",
			["gift-card"] = "rbxassetid://10723396225",
			["git-branch"] = "rbxassetid://10723396676",
			["git-branch-plus"] = "rbxassetid://10723396542",
			["git-commit"] = "rbxassetid://10723396812",
			["git-compare"] = "rbxassetid://10723396954",
			["git-fork"] = "rbxassetid://10723397049",
			["git-merge"] = "rbxassetid://10723397165",
			["git-pull-request"] = "rbxassetid://10723397431",
			["git-pull-request-closed"] = "rbxassetid://10723397268",
			["git-pull-request-draft"] = "rbxassetid://10734884302",
			["glass"] = "rbxassetid://10723397788",
			["glass-2"] = "rbxassetid://10723397529",
			["glass-water"] = "rbxassetid://10723397678",
			["glasses"] = "rbxassetid://10723397895",
			["globe"] = "rbxassetid://10723404337",
			["globe-2"] = "rbxassetid://10723398002",
			["grab"] = "rbxassetid://10723404472",
			["graduation-cap"] = "rbxassetid://10723404691",
			["grape"] = "rbxassetid://10723404822",
			["grid"] = "rbxassetid://10723404936",
			["grip-horizontal"] = "rbxassetid://10723405089",
			["grip-vertical"] = "rbxassetid://10723405236",
			["hammer"] = "rbxassetid://10723405360",
			["hand"] = "rbxassetid://10723405649",
			["hand-metal"] = "rbxassetid://10723405508",
			["hard-drive"] = "rbxassetid://10723405749",
			["hard-hat"] = "rbxassetid://10723405859",
			["hash"] = "rbxassetid://10723405975",
			["haze"] = "rbxassetid://10723406078",
			["headphones"] = "rbxassetid://10723406165",
			["heart"] = "rbxassetid://10723406885",
			["heart-crack"] = "rbxassetid://10723406299",
			["heart-handshake"] = "rbxassetid://10723406480",
			["heart-off"] = "rbxassetid://10723406662",
			["heart-pulse"] = "rbxassetid://10723406795",
			["help-circle"] = "rbxassetid://10723406988",
			["hexagon"] = "rbxassetid://10723407092",
			["highlighter"] = "rbxassetid://10723407192",
			["history"] = "rbxassetid://10723407335",
			["home"] = "rbxassetid://10723407389",
			["hourglass"] = "rbxassetid://10723407498",
			["ice-cream"] = "rbxassetid://10723414308",
			["image"] = "rbxassetid://10723415040",
			["image-minus"] = "rbxassetid://10723414487",
			["image-off"] = "rbxassetid://10723414677",
			["image-plus"] = "rbxassetid://10723414827",
			["import"] = "rbxassetid://10723415205",
			["inbox"] = "rbxassetid://10723415335",
			["indent"] = "rbxassetid://10723415494",
			["indian-rupee"] = "rbxassetid://10723415642",
			["infinity"] = "rbxassetid://10723415766",
			["info"] = "rbxassetid://10723415903",
			["inspect"] = "rbxassetid://10723416057",
			["italic"] = "rbxassetid://10723416195",
			["japanese-yen"] = "rbxassetid://10723416363",
			["joystick"] = "rbxassetid://10723416527",
			["key"] = "rbxassetid://10723416652",
			["keyboard"] = "rbxassetid://10723416765",
			["lamp"] = "rbxassetid://10723417513",
			["lamp-ceiling"] = "rbxassetid://10723416922",
			["lamp-desk"] = "rbxassetid://10723417016",
			["lamp-floor"] = "rbxassetid://10723417131",
			["lamp-wall-down"] = "rbxassetid://10723417240",
			["lamp-wall-up"] = "rbxassetid://10723417356",
			["landmark"] = "rbxassetid://10723417608",
			["languages"] = "rbxassetid://10723417703",
			["laptop"] = "rbxassetid://10723423881",
			["laptop-2"] = "rbxassetid://10723417797",
			["lasso"] = "rbxassetid://10723424235",
			["lasso-select"] = "rbxassetid://10723424058",
			["laugh"] = "rbxassetid://10723424372",
			["layers"] = "rbxassetid://10723424505",
			["layout"] = "rbxassetid://10723425376",
			["layout-dashboard"] = "rbxassetid://10723424646",
			["layout-grid"] = "rbxassetid://10723424838",
			["layout-list"] = "rbxassetid://10723424963",
			["layout-template"] = "rbxassetid://10723425187",
			["leaf"] = "rbxassetid://10723425539",
			["library"] = "rbxassetid://10723425615",
			["life-buoy"] = "rbxassetid://10723425685",
			["lightbulb"] = "rbxassetid://10723425852",
			["lightbulb-off"] = "rbxassetid://10723425762",
			["line-chart"] = "rbxassetid://10723426393",
			["link"] = "rbxassetid://10723426722",
			["link-2"] = "rbxassetid://10723426595",
			["link-2-off"] = "rbxassetid://10723426513",
			["list"] = "rbxassetid://10723433811",
			["list-checks"] = "rbxassetid://10734884548",
			["list-end"] = "rbxassetid://10723426886",
			["list-minus"] = "rbxassetid://10723426986",
			["list-music"] = "rbxassetid://10723427081",
			["list-ordered"] = "rbxassetid://10723427199",
			["list-plus"] = "rbxassetid://10723427334",
			["list-start"] = "rbxassetid://10723427494",
			["list-video"] = "rbxassetid://10723427619",
			["list-x"] = "rbxassetid://10723433655",
			["loader"] = "rbxassetid://10723434070",
			["loader-2"] = "rbxassetid://10723433935",
			["locate"] = "rbxassetid://10723434557",
			["locate-fixed"] = "rbxassetid://10723434236",
			["locate-off"] = "rbxassetid://10723434379",
			["lock"] = "rbxassetid://10723434711",
			["log-in"] = "rbxassetid://10723434830",
			["log-out"] = "rbxassetid://10723434906",
			["luggage"] = "rbxassetid://10723434993",
			["magnet"] = "rbxassetid://10723435069",
			["mail"] = "rbxassetid://10734885430",
			["mail-check"] = "rbxassetid://10723435182",
			["mail-minus"] = "rbxassetid://10723435261",
			["mail-open"] = "rbxassetid://10723435342",
			["mail-plus"] = "rbxassetid://10723435443",
			["mail-question"] = "rbxassetid://10723435515",
			["mail-search"] = "rbxassetid://10734884739",
			["mail-warning"] = "rbxassetid://10734885015",
			["mail-x"] = "rbxassetid://10734885247",
			["mails"] = "rbxassetid://10734885614",
			["map"] = "rbxassetid://10734886202",
			["map-pin"] = "rbxassetid://10734886004",
			["map-pin-off"] = "rbxassetid://10734885803",
			["maximize"] = "rbxassetid://10734886735",
			["maximize-2"] = "rbxassetid://10734886496",
			["medal"] = "rbxassetid://10734887072",
			["megaphone"] = "rbxassetid://10734887454",
			["megaphone-off"] = "rbxassetid://10734887311",
			["meh"] = "rbxassetid://10734887603",
			["menu"] = "rbxassetid://10734887784",
			["message-circle"] = "rbxassetid://10734888000",
			["message-square"] = "rbxassetid://10734888228",
			["mic"] = "rbxassetid://10734888864",
			["mic-2"] = "rbxassetid://10734888430",
			["mic-off"] = "rbxassetid://10734888646",
			["microscope"] = "rbxassetid://10734889106",
			["microwave"] = "rbxassetid://10734895076",
			["milestone"] = "rbxassetid://10734895310",
			["minimize"] = "rbxassetid://10734895698",
			["minimize-2"] = "rbxassetid://10734895530",
			["minus"] = "rbxassetid://10734896206",
			["minus-circle"] = "rbxassetid://10734895856",
			["minus-square"] = "rbxassetid://10734896029",
			["monitor"] = "rbxassetid://10734896881",
			["monitor-off"] = "rbxassetid://10734896360",
			["monitor-speaker"] = "rbxassetid://10734896512",
			["moon"] = "rbxassetid://10734897102",
			["more-horizontal"] = "rbxassetid://10734897250",
			["more-vertical"] = "rbxassetid://10734897387",
			["mountain"] = "rbxassetid://10734897956",
			["mountain-snow"] = "rbxassetid://10734897665",
			["mouse"] = "rbxassetid://10734898592",
			["mouse-pointer"] = "rbxassetid://10734898476",
			["mouse-pointer-2"] = "rbxassetid://10734898194",
			["mouse-pointer-click"] = "rbxassetid://10734898355",
			["move"] = "rbxassetid://10734900011",
			["move-3d"] = "rbxassetid://10734898756",
			["move-diagonal"] = "rbxassetid://10734899164",
			["move-diagonal-2"] = "rbxassetid://10734898934",
			["move-horizontal"] = "rbxassetid://10734899414",
			["move-vertical"] = "rbxassetid://10734899821",
			["music"] = "rbxassetid://10734905958",
			["music-2"] = "rbxassetid://10734900215",
			["music-3"] = "rbxassetid://10734905665",
			["music-4"] = "rbxassetid://10734905823",
			["navigation"] = "rbxassetid://10734906744",
			["navigation-2"] = "rbxassetid://10734906332",
			["navigation-2-off"] = "rbxassetid://10734906144",
			["navigation-off"] = "rbxassetid://10734906580",
			["network"] = "rbxassetid://10734906975",
			["newspaper"] = "rbxassetid://10734907168",
			["octagon"] = "rbxassetid://10734907361",
			["option"] = "rbxassetid://10734907649",
			["outdent"] = "rbxassetid://10734907933",
			["package"] = "rbxassetid://10734909540",
			["package-2"] = "rbxassetid://10734908151",
			["package-check"] = "rbxassetid://10734908384",
			["package-minus"] = "rbxassetid://10734908626",
			["package-open"] = "rbxassetid://10734908793",
			["package-plus"] = "rbxassetid://10734909016",
			["package-search"] = "rbxassetid://10734909196",
			["package-x"] = "rbxassetid://10734909375",
			["paint-bucket"] = "rbxassetid://10734909847",
			["paintbrush"] = "rbxassetid://10734910187",
			["paintbrush-2"] = "rbxassetid://10734910030",
			["palette"] = "rbxassetid://10734910430",
			["palmtree"] = "rbxassetid://10734910680",
			["paperclip"] = "rbxassetid://10734910927",
			["party-popper"] = "rbxassetid://10734918735",
			["pause"] = "rbxassetid://10734919336",
			["pause-circle"] = "rbxassetid://10735024209",
			["pause-octagon"] = "rbxassetid://10734919143",
			["pen-tool"] = "rbxassetid://10734919503",
			["pencil"] = "rbxassetid://10734919691",
			["percent"] = "rbxassetid://10734919919",
			["person-standing"] = "rbxassetid://10734920149",
			["phone"] = "rbxassetid://10734921524",
			["phone-call"] = "rbxassetid://10734920305",
			["phone-forwarded"] = "rbxassetid://10734920508",
			["phone-incoming"] = "rbxassetid://10734920694",
			["phone-missed"] = "rbxassetid://10734920845",
			["phone-off"] = "rbxassetid://10734921077",
			["phone-outgoing"] = "rbxassetid://10734921288",
			["pie-chart"] = "rbxassetid://10734921727",
			["piggy-bank"] = "rbxassetid://10734921935",
			["pin"] = "rbxassetid://10734922324",
			["pin-off"] = "rbxassetid://10734922180",
			["pipette"] = "rbxassetid://10734922497",
			["pizza"] = "rbxassetid://10734922774",
			["plane"] = "rbxassetid://10734922971",
			["play"] = "rbxassetid://10734923549",
			["play-circle"] = "rbxassetid://10734923214",
			["plus"] = "rbxassetid://10734924532",
			["plus-circle"] = "rbxassetid://10734923868",
			["plus-square"] = "rbxassetid://10734924219",
			["podcast"] = "rbxassetid://10734929553",
			["pointer"] = "rbxassetid://10734929723",
			["pound-sterling"] = "rbxassetid://10734929981",
			["power"] = "rbxassetid://10734930466",
			["power-off"] = "rbxassetid://10734930257",
			["printer"] = "rbxassetid://10734930632",
			["puzzle"] = "rbxassetid://10734930886",
			["quote"] = "rbxassetid://10734931234",
			["radio"] = "rbxassetid://10734931596",
			["radio-receiver"] = "rbxassetid://10734931402",
			["rectangle-horizontal"] = "rbxassetid://10734931777",
			["rectangle-vertical"] = "rbxassetid://10734932081",
			["recycle"] = "rbxassetid://10734932295",
			["redo"] = "rbxassetid://10734932822",
			["redo-2"] = "rbxassetid://10734932586",
			["refresh-ccw"] = "rbxassetid://10734933056",
			["refresh-cw"] = "rbxassetid://10734933222",
			["refrigerator"] = "rbxassetid://10734933465",
			["regex"] = "rbxassetid://10734933655",
			["repeat"] = "rbxassetid://10734933966",
			["repeat-1"] = "rbxassetid://10734933826",
			["reply"] = "rbxassetid://10734934252",
			["reply-all"] = "rbxassetid://10734934132",
			["rewind"] = "rbxassetid://10734934347",
			["rocket"] = "rbxassetid://10734934585",
			["rocking-chair"] = "rbxassetid://10734939942",
			["rotate-3d"] = "rbxassetid://10734940107",
			["rotate-ccw"] = "rbxassetid://10734940376",
			["rotate-cw"] = "rbxassetid://10734940654",
			["rss"] = "rbxassetid://10734940825",
			["ruler"] = "rbxassetid://10734941018",
			["russian-ruble"] = "rbxassetid://10734941199",
			["sailboat"] = "rbxassetid://10734941354",
			["save"] = "rbxassetid://10734941499",
			["scale"] = "rbxassetid://10734941912",
			["scale-3d"] = "rbxassetid://10734941739",
			["scaling"] = "rbxassetid://10734942072",
			["scan"] = "rbxassetid://10734942565",
			["scan-face"] = "rbxassetid://10734942198",
			["scan-line"] = "rbxassetid://10734942351",
			["scissors"] = "rbxassetid://10734942778",
			["screen-share"] = "rbxassetid://10734943193",
			["screen-share-off"] = "rbxassetid://10734942967",
			["scroll"] = "rbxassetid://10734943448",
			["search"] = "rbxassetid://10734943674",
			["send"] = "rbxassetid://10734943902",
			["separator-horizontal"] = "rbxassetid://10734944115",
			["separator-vertical"] = "rbxassetid://10734944326",
			["server"] = "rbxassetid://10734949856",
			["server-cog"] = "rbxassetid://10734944444",
			["server-crash"] = "rbxassetid://10734944554",
			["server-off"] = "rbxassetid://10734944668",
			["settings"] = "rbxassetid://10734950309",
			["settings-2"] = "rbxassetid://10734950020",
			["share"] = "rbxassetid://10734950813",
			["share-2"] = "rbxassetid://10734950553",
			["sheet"] = "rbxassetid://10734951038",
			["shield"] = "rbxassetid://10734951847",
			["shield-alert"] = "rbxassetid://10734951173",
			["shield-check"] = "rbxassetid://10734951367",
			["shield-close"] = "rbxassetid://10734951535",
			["shield-off"] = "rbxassetid://10734951684",
			["shirt"] = "rbxassetid://10734952036",
			["shopping-bag"] = "rbxassetid://10734952273",
			["shopping-cart"] = "rbxassetid://10734952479",
			["shovel"] = "rbxassetid://10734952773",
			["shower-head"] = "rbxassetid://10734952942",
			["shrink"] = "rbxassetid://10734953073",
			["shrub"] = "rbxassetid://10734953241",
			["shuffle"] = "rbxassetid://10734953451",
			["sidebar"] = "rbxassetid://10734954301",
			["sidebar-close"] = "rbxassetid://10734953715",
			["sidebar-open"] = "rbxassetid://10734954000",
			["sigma"] = "rbxassetid://10734954538",
			["signal"] = "rbxassetid://10734961133",
			["signal-high"] = "rbxassetid://10734954807",
			["signal-low"] = "rbxassetid://10734955080",
			["signal-medium"] = "rbxassetid://10734955336",
			["signal-zero"] = "rbxassetid://10734960878",
			["siren"] = "rbxassetid://10734961284",
			["skip-back"] = "rbxassetid://10734961526",
			["skip-forward"] = "rbxassetid://10734961809",
			["skull"] = "rbxassetid://10734962068",
			["slack"] = "rbxassetid://10734962339",
			["slash"] = "rbxassetid://10734962600",
			["slice"] = "rbxassetid://10734963024",
			["sliders"] = "rbxassetid://10734963400",
			["sliders-horizontal"] = "rbxassetid://10734963191",
			["smartphone"] = "rbxassetid://10734963940",
			["smartphone-charging"] = "rbxassetid://10734963671",
			["smile"] = "rbxassetid://10734964441",
			["smile-plus"] = "rbxassetid://10734964188",
			["snowflake"] = "rbxassetid://10734964600",
			["sofa"] = "rbxassetid://10734964852",
			["sort-asc"] = "rbxassetid://10734965115",
			["sort-desc"] = "rbxassetid://10734965287",
			["speaker"] = "rbxassetid://10734965419",
			["sprout"] = "rbxassetid://10734965572",
			["square"] = "rbxassetid://10734965702",
			["star"] = "rbxassetid://10734966248",
			["star-half"] = "rbxassetid://10734965897",
			["star-off"] = "rbxassetid://10734966097",
			["stethoscope"] = "rbxassetid://10734966384",
			["sticker"] = "rbxassetid://10734972234",
			["sticky-note"] = "rbxassetid://10734972463",
			["stop-circle"] = "rbxassetid://10734972621",
			["stretch-horizontal"] = "rbxassetid://10734972862",
			["stretch-vertical"] = "rbxassetid://10734973130",
			["strikethrough"] = "rbxassetid://10734973290",
			["subscript"] = "rbxassetid://10734973457",
			["sun"] = "rbxassetid://10734974297",
			["sun-dim"] = "rbxassetid://10734973645",
			["sun-medium"] = "rbxassetid://10734973778",
			["sun-moon"] = "rbxassetid://10734973999",
			["sun-snow"] = "rbxassetid://10734974130",
			["sunrise"] = "rbxassetid://10734974522",
			["sunset"] = "rbxassetid://10734974689",
			["superscript"] = "rbxassetid://10734974850",
			["swiss-franc"] = "rbxassetid://10734975024",
			["switch-camera"] = "rbxassetid://10734975214",
			["sword"] = "rbxassetid://10734975486",
			["swords"] = "rbxassetid://10734975692",
			["syringe"] = "rbxassetid://10734975932",
			["table"] = "rbxassetid://10734976230",
			["table-2"] = "rbxassetid://10734976097",
			["tablet"] = "rbxassetid://10734976394",
			["tag"] = "rbxassetid://10734976528",
			["tags"] = "rbxassetid://10734976739",
			["target"] = "rbxassetid://10734977012",
			["tent"] = "rbxassetid://10734981750",
			["terminal"] = "rbxassetid://10734982144",
			["terminal-square"] = "rbxassetid://10734981995",
			["text-cursor"] = "rbxassetid://10734982395",
			["text-cursor-input"] = "rbxassetid://10734982297",
			["thermometer"] = "rbxassetid://10734983134",
			["thermometer-snowflake"] = "rbxassetid://10734982571",
			["thermometer-sun"] = "rbxassetid://10734982771",
			["thumbs-down"] = "rbxassetid://10734983359",
			["thumbs-up"] = "rbxassetid://10734983629",
			["ticket"] = "rbxassetid://10734983868",
			["timer"] = "rbxassetid://10734984606",
			["timer-off"] = "rbxassetid://10734984138",
			["timer-reset"] = "rbxassetid://10734984355",
			["toggle-left"] = "rbxassetid://10734984834",
			["toggle-right"] = "rbxassetid://10734985040",
			["tornado"] = "rbxassetid://10734985247",
			["toy-brick"] = "rbxassetid://10747361919",
			["train"] = "rbxassetid://10747362105",
			["trash"] = "rbxassetid://10747362393",
			["trash-2"] = "rbxassetid://10747362241",
			["tree-deciduous"] = "rbxassetid://10747362534",
			["tree-pine"] = "rbxassetid://10747362748",
			["trees"] = "rbxassetid://10747363016",
			["trending-down"] = "rbxassetid://10747363205",
			["trending-up"] = "rbxassetid://10747363465",
			["triangle"] = "rbxassetid://10747363621",
			["trophy"] = "rbxassetid://10747363809",
			["truck"] = "rbxassetid://10747364031",
			["tv"] = "rbxassetid://10747364593",
			["tv-2"] = "rbxassetid://10747364302",
			["type"] = "rbxassetid://10747364761",
			["umbrella"] = "rbxassetid://10747364971",
			["underline"] = "rbxassetid://10747365191",
			["undo"] = "rbxassetid://10747365484",
			["undo-2"] = "rbxassetid://10747365359",
			["unlink"] = "rbxassetid://10747365771",
			["unlink-2"] = "rbxassetid://10747397871",
			["unlock"] = "rbxassetid://10747366027",
			["upload"] = "rbxassetid://10747366434",
			["upload-cloud"] = "rbxassetid://10747366266",
			["usb"] = "rbxassetid://10747366606",
			["user"] = "rbxassetid://10747373176",
			["user-check"] = "rbxassetid://10747371901",
			["user-cog"] = "rbxassetid://10747372167",
			["user-minus"] = "rbxassetid://10747372346",
			["user-plus"] = "rbxassetid://10747372702",
			["user-x"] = "rbxassetid://10747372992",
			["users"] = "rbxassetid://10747373426",
			["utensils"] = "rbxassetid://10747373821",
			["utensils-crossed"] = "rbxassetid://10747373629",
			["venetian-mask"] = "rbxassetid://10747374003",
			["verified"] = "rbxassetid://10747374131",
			["vibrate"] = "rbxassetid://10747374489",
			["vibrate-off"] = "rbxassetid://10747374269",
			["video"] = "rbxassetid://10747374938",
			["video-off"] = "rbxassetid://10747374721",
			["view"] = "rbxassetid://10747375132",
			["voicemail"] = "rbxassetid://10747375281",
			["volume"] = "rbxassetid://10747376008",
			["volume-1"] = "rbxassetid://10747375450",
			["volume-2"] = "rbxassetid://10747375679",
			["volume-x"] = "rbxassetid://10747375880",
			["wallet"] = "rbxassetid://10747376205",
			["wand"] = "rbxassetid://10747376565",
			["wand-2"] = "rbxassetid://10747376349",
			["watch"] = "rbxassetid://10747376722",
			["waves"] = "rbxassetid://10747376931",
			["webcam"] = "rbxassetid://10747381992",
			["wifi"] = "rbxassetid://10747382504",
			["wifi-off"] = "rbxassetid://10747382268",
			["wind"] = "rbxassetid://10747382750",
			["wrap-text"] = "rbxassetid://10747383065",
			["wrench"] = "rbxassetid://10747383470",
			["x"] = "rbxassetid://10747384394",
			["x-circle"] = "rbxassetid://10747383819",
			["x-octagon"] = "rbxassetid://10747384037",
			["x-square"] = "rbxassetid://10747384217",
			["zoom-in"] = "rbxassetid://10747384552",
			["zoom-out"] = "rbxassetid://10747384679"
		}

		ImageLabel.Parent = ButtonTap
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Position = UDim2.new(0.172968701, 0, 0.5, 0)
		ImageLabel.Size = UDim2.new(0, 15, 0, 15)
		if assets[options.Icon] then
			ImageLabel.Image = assets[options.Icon]
		elseif type(TapIcon) == 'string' and not TapIcon:find('rbxassetid://') then
			ImageLabel.Image = "rbxassetid://".. TapIcon
		elseif type(TapIcon) == 'number' then
			ImageLabel.Image = "rbxassetid://".. TapIcon
		else
			ImageLabel.Image = TapIcon
		end
		ImageLabel.ImageColor3 = TapC

		TextLabel.Parent = ButtonTap
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Text = "  		  "..TapTitle
		TextLabel.TextColor3 = TapC
		TextLabel.TextSize = 11.000
		TextLabel.TextStrokeTransparency = 0.900
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

		local Page = Instance.new("Frame")
		local LeftMain = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_2 = Instance.new("UIPadding")

		Page.Name = "Page"
		Page.Parent = MainPage
		Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page.BackgroundTransparency = 1.000
		Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Page.BorderSizePixel = 0
		Page.Visible = false
		Page.Size = UDim2.new(1, 0, 1, 0)

		LeftMain.Name = "LeftMain"
		LeftMain.Parent = Page
		LeftMain.Active = true
		LeftMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LeftMain.BackgroundTransparency = 1.000
		LeftMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LeftMain.BorderSizePixel = 0
		LeftMain.Position = UDim2.new(7.19754212e-08, 0, 0, 0)
		LeftMain.Size = UDim2.new(0.473118305, 0, 1, 0)
		LeftMain.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		LeftMain.ScrollBarThickness = 0

		UIListLayout_2.Parent = LeftMain
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

		UIPadding_2.Parent = LeftMain

		local RightMain = Instance.new("ScrollingFrame")
		local UIListLayout_5 = Instance.new("UIListLayout")
		local UIPadding_5 = Instance.new("UIPadding")
		RightMain.Name = "RightMain"
		RightMain.Parent = Page
		RightMain.Active = true
		RightMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		RightMain.BackgroundTransparency = 1.000
		RightMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
		RightMain.BorderSizePixel = 0
		RightMain.Position = UDim2.new(0.489209443, 0, 0, 0)
		RightMain.Size = UDim2.new(0.473118037, 0, 1, 0)
		RightMain.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		RightMain.ScrollBarThickness = 0

		UIListLayout_5.Parent = RightMain
		UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_5.Padding = UDim.new(0, 5)

		UIPadding_5.Parent = RightMain

		UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			LeftMain.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 35)
		end)
		UIListLayout_5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			RightMain.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 35)
		end)

		ButtonTap.MouseButton1Click:Connect(function()
			for _, v in pairs(MainPage:GetChildren()) do
				if v:IsA("Frame") then
					v.Visible = false
				end
			end
			for _, v in pairs(ScrollingFrame:GetChildren()) do
				if v:IsA("TextButton") then
					TweenService:Create(
						v.TextLabel,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{TextColor3 = TapC}
					):Play()
					TweenService:Create(
						v.ImageLabel,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{ImageColor3 = TapC}
					):Play()
				end
			end
			Page.Visible = true
			TweenService:Create(
				TextLabel,
				TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()
			TweenService:Create(
				ImageLabel,
				TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()
			print("Next Tap")
		end)

		delay(1,function() 
			if not library.TapGroup.Value then 
				Page.Visible = true
				library.TapGroup.Value = true 
				TweenService:Create(
					TextLabel,
					TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(255, 255, 255)}
				):Play()
				TweenService:Create(
					ImageLabel,
					TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
					{ImageColor3 = Color3.fromRGB(255, 255, 255)}
				):Play()
			end 
		end)

		local GetType = function(value)
			if value == 1 or value == "Left" then
				return LeftMain
			elseif value == 2 or value == "Right" then
				return RightMain
			else
				return LeftMain
			end
		end

		library.Sections = {}
		library.Sections.CreatePage = function(options)
			local Sections = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local UIListLayout_3 = Instance.new("UIListLayout")
			local UIPadding_3 = Instance.new("UIPadding")

			Sections.Name = "Sections"
			Sections.Parent = GetType(options.Side)
			Sections.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
			Sections.BackgroundTransparency = 0.500
			Sections.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Sections.BorderSizePixel = 0
			Sections.Position = UDim2.new(0, 0, -0.50857532, 0)
			Sections.Size = UDim2.new(1.00000012, 0, 0.562308431, 100)

			UICorner_3.Parent = Sections

			UIListLayout_3.Parent = Sections
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.Padding = UDim.new(0, 5)

			UIPadding_3.Parent = Sections
			UIPadding_3.PaddingLeft = UDim.new(0, 5)
			UIPadding_3.PaddingTop = UDim.new(0, 5)

			UIListLayout_3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Sections.Size = UDim2.new(1, 0, 0, UIListLayout_3.AbsoluteContentSize.Y + 35)
			end)

			library.FuncMain = {}
			library.FuncMain.CreateLable = function(options)
				local Lable = Instance.new("Frame")
				local UICorner_4 = Instance.new("UICorner")
				local TextLabel_2 = Instance.new("TextLabel")

				Lable.Name = "Lable"
				Lable.Parent = Sections
				Lable.BackgroundColor3 = Background2
				Lable.BackgroundTransparency = 0.600
				Lable.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Lable.BorderSizePixel = 0
				Lable.Size = UDim2.new(0.949999988, 0, 0, 30)

				UICorner_4.CornerRadius = UDim.new(0, 2)
				UICorner_4.Parent = Lable

				TextLabel_2.Parent = Lable
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.Position = UDim2.new(0.0441415086, 0, 0, 0)
				TextLabel_2.Size = UDim2.new(0.955858469, 0, 1, 0)
				TextLabel_2.Text = options.Name
				TextLabel_2.TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)
				TextLabel_2.TextSize = 12.000
				TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

				local TextTable = {}
				function TextTable:Set(Value)
					TextLabel_2.Text = Value
				end;function TextTable:SetColor(Color)
					TextLabel_2.TextColor3 = Color or TextColorUI or Color3.fromRGB(142, 144, 150)
				end

				return TextTable
			end
			library.FuncMain.CreateToggle = function(options, Lock)
				local ToggleTable = {}
				local Name = options.Name;wait()
				local default = options.Value
				local Dis = options.Dis
				local callback = options.Callback or function() end
				local ToggleTable = {}
				local Lock = Lock or false

				local Toggle = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local TitleText = Instance.new("TextLabel")
				local TitleDis = Instance.new("TextLabel")
				local ToggleO = Instance.new("Frame")
				local O = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local UICorner_3 = Instance.new("UICorner")
				local TextButton = Instance.new("TextButton")
				local LockToggle = Instance.new("Frame")
				local ToggleLocker = Instance.new("ImageLabel")
				local UICorner_4 = Instance.new("UICorner")
				local UIStroke = Instance.new("UIStroke")
				local UIStroke2 = Instance.new("UIStroke")

				Toggle.Name = "Toggle"
				Toggle.Parent = Sections
				Toggle.BackgroundColor3 = Background2
				Toggle.BackgroundTransparency = 0.600
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Size = UDim2.new(0.949999988, 0, 0, 40)

				UICorner.CornerRadius = UDim.new(0, 2)
				UICorner.Parent = Toggle

				TitleText.Name = "TitleText"
				TitleText.Parent = Toggle
				TitleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TitleText.BackgroundTransparency = 1.000
				TitleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TitleText.BorderSizePixel = 0
				TitleText.Position = UDim2.new(0.0441415198, 0, 0, 0)
				TitleText.Size = UDim2.new(0.955858588, 0, 0.374999851, 0)
				TitleText.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				TitleText.Text = Name
				TitleText.TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)
				TitleText.TextSize = 12.000
				TitleText.TextXAlignment = Enum.TextXAlignment.Left

				if Dis ~= nil and Dis ~= "" then
					TitleDis.Name = "TitleDis"
					TitleDis.Parent = Toggle
					TitleDis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TitleDis.BackgroundTransparency = 1.000
					TitleDis.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TitleDis.BorderSizePixel = 0
					TitleDis.ClipsDescendants = true
					TitleDis.Position = UDim2.new(0.0439999998, 0, 0.449999988, 0)
					TitleDis.Size = UDim2.new(0.728003502, 0, 0.5, 0)
					TitleDis.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
					TitleDis.Text = Dis
					TitleDis.TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)
					TitleDis.TextSize = 10.000
					TitleDis.TextWrapped = true
					TitleDis.TextXAlignment = Enum.TextXAlignment.Left
					TitleDis.TextYAlignment = Enum.TextYAlignment.Top
				end
				if Dis == nil or  Dis == "" then
					TitleText.Text = Name
					TitleText.AnchorPoint = Vector2.new(0, 0.5)
					TitleText.Position = UDim2.new(0.0441415198, 0, .5, 0)
					Toggle.Size = UDim2.new(0.949999988, 0, 0, 30)
					print(Name)
				end

				ToggleO.Name = "ToggleO"
				ToggleO.Parent = Toggle
				ToggleO.AnchorPoint = Vector2.new(0.5, 0.5)
				ToggleO.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
				ToggleO.BackgroundTransparency = 0.200
				ToggleO.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ToggleO.BorderSizePixel = 0
				ToggleO.Position = UDim2.new(0.855000019, 0, 0.5, 0)
				ToggleO.Size = UDim2.new(0, 35, 0, 15)

				UIStroke.Name = "UIStroke"
				UIStroke.Parent = ToggleO
				UIStroke.Color = ToggleOC

				O.Name = "O"
				O.Parent = ToggleO
				O.AnchorPoint = Vector2.new(0, 0.5)
				O.BackgroundColor3 = ToggleOC
				O.BorderColor3 = Color3.fromRGB(0, 0, 0)
				O.BorderSizePixel = 0
				O.Position = UDim2.new(0.1, 0, 0.5, 0)
				O.Size = UDim2.new(0, 10, 0, 10)

				UICorner_2.CornerRadius = UDim.new(1, 0)
				UICorner_2.Parent = O

				UICorner_3.Parent = ToggleO

				UIStroke2.Name = "UIStroke"
				UIStroke2.Parent = O
				UIStroke2.Color = ToggleOC

				TextButton.Parent = Toggle
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Size = UDim2.new(1, 0, 1, 0)
				TextButton.Font = Enum.Font.SourceSans
				TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.TextSize = 14.000
				TextButton.TextTransparency = 1.000

				LockToggle.Name = "LockToggle"
				LockToggle.Parent = Toggle
				LockToggle.BackgroundColor3 = Background2
				LockToggle.BackgroundTransparency = 0.500
				LockToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				LockToggle.BorderSizePixel = 0
				LockToggle.Size = UDim2.new(1, 0, 1, 0)
				LockToggle.Visible = false

				ToggleLocker.Name = "ToggleLocker"
				ToggleLocker.Parent = LockToggle
				ToggleLocker.AnchorPoint = Vector2.new(0.5, 0.5)
				ToggleLocker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleLocker.BackgroundTransparency = 1.000
				ToggleLocker.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ToggleLocker.BorderSizePixel = 0
				ToggleLocker.Position = UDim2.new(0.5, 0, 0.5, 0)
				ToggleLocker.Size = UDim2.new(0, 20, 0, 20)
				ToggleLocker.Image = "http://www.roblox.com/asset/?id=6031082533"

				UICorner_4.CornerRadius = UDim.new(0, 2)
				UICorner_4.Parent = LockToggle

				if default == true then
					callback(default)
					TweenService:Create(
						TitleText,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(198, 200, 209)}
					):Play()
					TweenService:Create(
						TitleDis,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(198, 200, 209)}
					):Play()
					TweenService:Create(
						O,
						TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{Position = UDim2.new(0.6, 0, 0.5, 0)}
					):Play()
					TweenService:Create(
						O,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{BackgroundColor3 = ToggleOC}
					):Play()
				end

				TextButton.MouseButton1Click:Connect(function()
					if not Lock then
						if not default then
							default = true
							TweenService:Create(
								TitleText,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(198, 200, 209)}
							):Play()
							TweenService:Create(
								TitleDis,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(198, 200, 209)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{Position = UDim2.new(0.6, 0, 0.5, 0)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = ToggleOC}
							):Play()
						else
							default = false
							TweenService:Create(
								TitleText,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)}
							):Play()
							TweenService:Create(
								TitleDis,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{Position = UDim2.new(0.1, 0, 0.5, 0)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = ToggleOC}
							):Play()
						end 
						callback(default)
					end
				end)

				function ToggleTable:Update(Value)
					if not Lock then
						if not Value then
							default = true
							TweenService:Create(
								TitleText,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(198, 200, 209)}
							):Play()
							TweenService:Create(
								TitleDis,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(198, 200, 209)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{Position = UDim2.new(0.6, 0, 0.5, 0)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(61, 65, 91)}
							):Play()
						else
							default = false
							TweenService:Create(
								TitleText,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)}
							):Play()
							TweenService:Create(
								TitleDis,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{Position = UDim2.new(0.1, 0, 0.5, 0)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = Background2}
							):Play()
						end 
						callback(default)
					end
				end
				function ToggleTable:UnLocker()
					Lock = false
					LockToggle.Visible = false
				end
				function ToggleTable:Locker()
					Lock = true
					LockToggle.Visible = true
				end
				function ToggleTable:UpdateNameText(Value)
					TitleText.Text = Value
				end
				function ToggleTable:UpdateDis(Value)
					TitleDis.Text = Value
				end
				return ToggleTable
			end
			library.FuncMain.CreateButton = function(options)
				local Name = options.Name or "Button";wait()
				local callback = options.Callback or function() end

				local Button = Instance.new("Frame")
				local UICorner_8 = Instance.new("UICorner")
				local TextLabel_3 = Instance.new("TextLabel")
				local TextButton_2 = Instance.new("TextButton")
				local ImageLabel_2 = Instance.new("ImageLabel")

				Button.Name = "Button"
				Button.Parent = Sections
				Button.BackgroundColor3 = ToggleOC
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0, 0, 0.270586133, 0)
				Button.Size = UDim2.new(0.949999988, 0, 0, 25)

				UICorner_8.CornerRadius = UDim.new(0, 2)
				UICorner_8.Parent = Button

				TextLabel_3.Parent = Button
				TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.BackgroundTransparency = 1.000
				TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_3.BorderSizePixel = 0
				TextLabel_3.Position = UDim2.new(0.0439998619, 0, 0, 0)
				TextLabel_3.Size = UDim2.new(0.956000149, 0, 1, 0)
				TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				TextLabel_3.Text = Name
				TextLabel_3.TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)
				TextLabel_3.TextSize = 12.000
				TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

				TextButton_2.Parent = Button
				TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_2.BackgroundTransparency = 1.000
				TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_2.BorderSizePixel = 0
				TextButton_2.Size = UDim2.new(1, 0, 1, 0)
				TextButton_2.Font = Enum.Font.SourceSans
				TextButton_2.Text = ""
				TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_2.TextSize = 14.000

				ImageLabel_2.Parent = Button
				ImageLabel_2.AnchorPoint = Vector2.new(0, 0.5)
				ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel_2.BackgroundTransparency = 1.000
				ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel_2.BorderSizePixel = 0
				ImageLabel_2.Position = UDim2.new(0.868354499, 0, 0.5, 0)
				ImageLabel_2.Size = UDim2.new(0, 15, 0, 15)
				ImageLabel_2.Image = "http://www.roblox.com/asset/?id=6031094687"
				ImageLabel_2.ImageColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)

				TextButton_2.MouseButton1Click:Connect(function()
					TextLabel_3.TextSize = 0
					TweenService:Create(
						TextLabel_3,
						TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{TextSize = 12.00}
					):Play()
					callback()
				end)
			end
			library.FuncMain.CreateDropdown = function(options)
				local text = options.Name;wait()
				local default = options.Value or ""
				local list = options.List
				local callback = options.Callback

				local Dropdown = Instance.new("Frame")
				local UICorner_9 = Instance.new("UICorner")
				local Main1 = Instance.new("Frame")
				local TextLabel_4 = Instance.new("TextLabel")
				local ImageButton = Instance.new("ImageButton")
				local ImageLabel_3 = Instance.new("ImageLabel")
				local Main2 = Instance.new("Frame")
				local ScrollingFrame_2 = Instance.new("ScrollingFrame")
				local UIListLayout_4 = Instance.new("UIListLayout")
				local UIPadding_4 = Instance.new("UIPadding")


				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Sections
				Dropdown.BackgroundColor3 = Background2
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.ClipsDescendants = true
				Dropdown.Position = UDim2.new(0, 0, 0.236475766, 0)
				Dropdown.Size = UDim2.new(0.949999988, 0, 0, 30)

				UICorner_9.CornerRadius = UDim.new(0, 2)
				UICorner_9.Parent = Dropdown

				Main1.Name = "Main1"
				Main1.Parent = Dropdown
				Main1.BackgroundColor3 = Background2
				Main1.BackgroundTransparency = 0.600
				Main1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main1.BorderSizePixel = 0
				Main1.Size = UDim2.new(1, 0, 0, 27)

				TextLabel_4.Parent = Main1
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_4.BorderSizePixel = 0
				TextLabel_4.Size = UDim2.new(1, 0, 1, 0)
				TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				TextLabel_4.Text = text.." (".. default ..")"
				TextLabel_4.TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)
				TextLabel_4.TextSize = 11.000

				ImageButton.Parent = Main1
				ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageButton.BackgroundTransparency = 1.000
				ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageButton.BorderSizePixel = 0
				ImageButton.Size = UDim2.new(1, 0, 1, 0)
				ImageButton.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
				ImageButton.ImageTransparency = 1.000

				ImageLabel_3.Parent = Main1
				ImageLabel_3.AnchorPoint = Vector2.new(0, 0.5)
				ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel_3.BackgroundTransparency = 1.000
				ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel_3.BorderSizePixel = 0
				ImageLabel_3.Position = UDim2.new(0.868354499, 0, 0.5, 0)
				ImageLabel_3.Size = UDim2.new(0, 15, 0, 15)
				ImageLabel_3.Image = "http://www.roblox.com/asset/?id=6031094687"
				ImageLabel_3.ImageColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)

				Main2.Name = "Main2"
				Main2.Parent = Dropdown
				Main2.BackgroundColor3 = Background2
				Main2.BackgroundTransparency = 0.600
				Main2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main2.BorderSizePixel = 0
				Main2.Position = UDim2.new(0, 0, 0, 30)
				Main2.Size = UDim2.new(1, 0, 0, 92)

				ScrollingFrame_2.Parent = Main2
				ScrollingFrame_2.Active = true
				ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingFrame_2.BackgroundTransparency = 1.000
				ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame_2.BorderSizePixel = 0
				ScrollingFrame_2.Size = UDim2.new(1, 0, 1, 0)
				ScrollingFrame_2.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame_2.ScrollBarThickness = 1

				UIListLayout_4.Parent = ScrollingFrame_2
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

				UIPadding_4.Parent = ScrollingFrame_2
				UIPadding_4.PaddingLeft = UDim.new(0, 5)
				UIPadding_4.PaddingTop = UDim.new(0, 5)

				local DropF = {}
				local DropG = true
				function DropF:Clear()
					for i, v in next, ScrollingFrame_2:GetChildren() do
						if v:IsA("Frame") then 
							v:Destroy()
						end
					end
				end

				TextLabel_4.Text = text.." (".. 'nil' ..")"
				function DropF:Add(Text)
					local Button_2 = Instance.new("Frame")
					local UICorner_10 = Instance.new("UICorner")
					local TextButton_3 = Instance.new("TextButton")
					local TextLabel_5 = Instance.new("TextLabel")

					Button_2.Name = "Button"
					Button_2.Parent = ScrollingFrame_2
					Button_2.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
					Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button_2.BorderSizePixel = 0
					Button_2.Position = UDim2.new(0, 0, 0.270586133, 0)
					Button_2.Size = UDim2.new(0.949999988, 0, 0, 25)

					UICorner_10.CornerRadius = UDim.new(0, 2)
					UICorner_10.Parent = Button_2

					TextButton_3.Parent = Button_2
					TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton_3.BackgroundTransparency = 1.000
					TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextButton_3.BorderSizePixel = 0
					TextButton_3.Size = UDim2.new(1, 0, 1, 0)
					TextButton_3.Font = Enum.Font.SourceSans
					TextButton_3.Text = ""
					TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
					TextButton_3.TextSize = 14.000

					TextLabel_5.Parent = Button_2
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Size = UDim2.new(1, 0, 1, 0)
					TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
					TextLabel_5.Text = Text
					TextLabel_5.TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)
					TextLabel_5.TextSize = 12.000

					if TextLabel_5.Text == default then
						for i, v in next, ScrollingFrame_2:GetChildren() do
							if v:IsA("Frame") then 
								TweenService:Create(
									v,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)}
								):Play()
								TweenService:Create(
									v.TextLabel,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{TextColor3 = Color3.fromRGB(213, 213, 213)}
								):Play()
							end
						end
						TweenService:Create(
							Button_2,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{BackgroundColor3 = DropDownSelect or Color3.fromRGB(61, 65, 90)}
						):Play()
						TweenService:Create(
							TextLabel_5,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255,255,255)}
						):Play()
						TextLabel_4.Text = text.." (".. Text ..")"
						callback(default)
					end

					TextButton_3.MouseButton1Click:Connect(function()
						for i, v in next, ScrollingFrame_2:GetChildren() do
							if v:IsA("Frame") then 
								TweenService:Create(
									v,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)}
								):Play()
								TweenService:Create(
									v.TextLabel,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{TextColor3 = Color3.fromRGB(213, 213, 213)}
								):Play()
							end
						end
						TweenService:Create(
							Button_2,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{BackgroundColor3 = DropDownSelect or Color3.fromRGB(61, 65, 90)}
						):Play()
						TweenService:Create(
							TextLabel_5,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255,255,255)}
						):Play()
						TextLabel_4.Text = text.." (".. Text ..")"
						callback(Text)
					end)
				end
				UIListLayout_4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y + 35)
				end)

				ImageButton.MouseButton1Click:Connect(function()
					if not DropG then
						DropG = true
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{Size = UDim2.new(0.949999988, 0, 0, 30)}
						):Play()
					else
						DropG = false
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{Size = UDim2.new(0.949999988, 0, 0, 130)}
						):Play()
					end
				end)

				for _, v in next,list do
					DropF:Add(v)
				end

				return DropF
			end
			library.FuncMain.CreateMultiDropdown = function(options)
				local text = options.Name;wait()
				local default = options.Value or {""}
				local list = options.List
				local callback = options.Callback

				local Dropdown = Instance.new("Frame")
				local UICorner_9 = Instance.new("UICorner")
				local Main1 = Instance.new("Frame")
				local TextLabel_4 = Instance.new("TextLabel")
				local ImageButton = Instance.new("ImageButton")
				local ImageLabel_3 = Instance.new("ImageLabel")
				local Main2 = Instance.new("Frame")
				local ScrollingFrame_2 = Instance.new("ScrollingFrame")
				local UIListLayout_4 = Instance.new("UIListLayout")
				local UIPadding_4 = Instance.new("UIPadding")
				local DropFF = default

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Sections
				Dropdown.BackgroundColor3 = Background2
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.ClipsDescendants = true
				Dropdown.Position = UDim2.new(0, 0, 0.236475766, 0)
				Dropdown.Size = UDim2.new(0.949999988, 0, 0, 30)

				UICorner_9.CornerRadius = UDim.new(0, 2)
				UICorner_9.Parent = Dropdown

				Main1.Name = "Main1"
				Main1.Parent = Dropdown
				Main1.BackgroundColor3 = Background2
				Main1.BackgroundTransparency = 0.600
				Main1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main1.BorderSizePixel = 0
				Main1.Size = UDim2.new(1, 0, 0, 27)

				TextLabel_4.Parent = Main1
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_4.BorderSizePixel = 0
				TextLabel_4.Size = UDim2.new(1, 0, 1, 0)
				TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				TextLabel_4.TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)
				TextLabel_4.TextSize = 11.000

				local function UpdateTextLabel()
					local maxDisplayCount = 3
					local textLabel_7_text = text .. " ("
					if #DropFF > maxDisplayCount then
						textLabel_7_text = textLabel_7_text .. table.concat(DropFF, ", ", 1, maxDisplayCount) .. ", ..."
					else
						textLabel_7_text = textLabel_7_text .. table.concat(DropFF, ", ")
					end
					textLabel_7_text = textLabel_7_text .. ")"
					TextLabel_4.Text = textLabel_7_text
				end;UpdateTextLabel()

				ImageButton.Parent = Main1
				ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageButton.BackgroundTransparency = 1.000
				ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageButton.BorderSizePixel = 0
				ImageButton.Size = UDim2.new(1, 0, 1, 0)
				ImageButton.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
				ImageButton.ImageTransparency = 1.000

				ImageLabel_3.Parent = Main1
				ImageLabel_3.AnchorPoint = Vector2.new(0, 0.5)
				ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel_3.BackgroundTransparency = 1.000
				ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel_3.BorderSizePixel = 0
				ImageLabel_3.Position = UDim2.new(0.868354499, 0, 0.5, 0)
				ImageLabel_3.Size = UDim2.new(0, 15, 0, 15)
				ImageLabel_3.Image = "http://www.roblox.com/asset/?id=6031094687"
				ImageLabel_3.ImageColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)

				Main2.Name = "Main2"
				Main2.Parent = Dropdown
				Main2.BackgroundColor3 = Background2
				Main2.BackgroundTransparency = 0.600
				Main2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main2.BorderSizePixel = 0
				Main2.Position = UDim2.new(0, 0, 0, 30)
				Main2.Size = UDim2.new(1, 0, 0, 92)

				ScrollingFrame_2.Parent = Main2
				ScrollingFrame_2.Active = true
				ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingFrame_2.BackgroundTransparency = 1.000
				ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame_2.BorderSizePixel = 0
				ScrollingFrame_2.Size = UDim2.new(1, 0, 1, 0)
				ScrollingFrame_2.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame_2.ScrollBarThickness = 1

				UIListLayout_4.Parent = ScrollingFrame_2
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

				UIPadding_4.Parent = ScrollingFrame_2
				UIPadding_4.PaddingLeft = UDim.new(0, 5)
				UIPadding_4.PaddingTop = UDim.new(0, 5)

				local DropF = {}
				local DropG = true
				function DropF:Clear()
					for i, v in next, ScrollingFrame_2:GetChildren() do
						if v:IsA("Frame") then 
							v:Destroy()
						end
					end
				end

				TextLabel_4.Text = text.." (".. 'nil' ..")"
				function DropF:Add(Text)
					local Button_2 = Instance.new("Frame")
					local UICorner_10 = Instance.new("UICorner")
					local TextButton_3 = Instance.new("TextButton")
					local TextLabel_5 = Instance.new("TextLabel")

					Button_2.Name = "Button"
					Button_2.Parent = ScrollingFrame_2
					Button_2.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
					Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button_2.BorderSizePixel = 0
					Button_2.Position = UDim2.new(0, 0, 0.270586133, 0)
					Button_2.Size = UDim2.new(0.949999988, 0, 0, 25)

					UICorner_10.CornerRadius = UDim.new(0, 2)
					UICorner_10.Parent = Button_2

					TextButton_3.Parent = Button_2
					TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton_3.BackgroundTransparency = 1.000
					TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextButton_3.BorderSizePixel = 0
					TextButton_3.Size = UDim2.new(1, 0, 1, 0)
					TextButton_3.Font = Enum.Font.SourceSans
					TextButton_3.Text = ""
					TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
					TextButton_3.TextSize = 14.000

					TextLabel_5.Parent = Button_2
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Size = UDim2.new(1, 0, 1, 0)
					TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
					TextLabel_5.Text = Text
					TextLabel_5.TextColor3 = TextColorUI or Color3.fromRGB(142, 144, 150)
					TextLabel_5.TextSize = 12.000

					if table.find(DropFF, TextLabel_5.Text) then
						for i, v in next, ScrollingFrame_2:GetChildren() do
							if v:IsA("Frame") then 
								TweenService:Create(
									v,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)}
								):Play()
								TweenService:Create(
									v.TextLabel,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{TextColor3 = Color3.fromRGB(213, 213, 213)}
								):Play()
							end
						end
						TweenService:Create(
							Button_2,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{BackgroundColor3 = DropDownSelect or Color3.fromRGB(61, 65, 90)}
						):Play()
						TweenService:Create(
							TextLabel_5,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255,255,255)}
						):Play()
						TextLabel_4.Text = text.." (".. Text ..")"
						callback(default)
					end

					TextButton_3.MouseButton1Click:Connect(function()
						if not table.find(DropFF, Text) then
							table.insert(DropFF, Text)
							callback(DropFF, Text)
							UpdateTextLabel()

							TweenService:Create(
								Button_2,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = DropDownSelect or Color3.fromRGB(61, 65, 90)}
							):Play()
							TweenService:Create(
								TextLabel_5,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
						else
							TweenService:Create(
								Button_2,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)}
							):Play()
							TweenService:Create(
								TextLabel_5,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(213, 213, 213)}
							):Play()
							for i2, v2 in ipairs(DropFF) do
								if v2 == Text then
									table.remove(DropFF, i2)
									callback(DropFF, Text)
									UpdateTextLabel()
									break
								end
							end
						end
					end)
				end
				UIListLayout_4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y + 35)
				end)

				ImageButton.MouseButton1Click:Connect(function()
					if not DropG then
						DropG = true
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{Size = UDim2.new(0.949999988, 0, 0, 30)}
						):Play()
					else
						DropG = false
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{Size = UDim2.new(0.949999988, 0, 0, 130)}
						):Play()
					end
				end)

				for _, v in next,list do
					DropF:Add(v)
				end

				callback(DropFF)
				return DropF
			end
			function library.FuncMain.CreateColorpicker(options)
				local Colorpicker = Instance.new("Frame")
				local UICorner_11 = Instance.new("UICorner")
				local ColorpickerTitel = Instance.new("TextLabel")
				local NowColor = Instance.new("Frame")
				local UICorner_12 = Instance.new("UICorner")
				local ColorSelection = Instance.new("Frame")
				local Color = Instance.new("ImageLabel")
				local ColorSelection_2 = Instance.new("ImageLabel")
				local Hue = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner_13 = Instance.new("UICorner")
				local HueSelection = Instance.new("ImageLabel")
				local UICorner_14 = Instance.new("UICorner")
				local ColorpickerButton = Instance.new("TextButton")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = Sections
				Colorpicker.BackgroundColor3 = Background2
				Colorpicker.BackgroundTransparency = 0.600
				Colorpicker.BorderColor3 = Color3.fromRGB(153, 153, 153)
				Colorpicker.BorderSizePixel = 0
				Colorpicker.Position = UDim2.new(0, 0, 0.553602278, 0)
				Colorpicker.Size = UDim2.new(0.950000107, 0, 0.00862091407, 27)
				Colorpicker.ZIndex = 2

				UICorner_11.CornerRadius = UDim.new(0, 2)
				UICorner_11.Parent = Colorpicker

				ColorpickerTitel.Name = "ColorpickerTitel"
				ColorpickerTitel.Parent = Colorpicker
				ColorpickerTitel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitel.BackgroundTransparency = 1.000
				ColorpickerTitel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorpickerTitel.BorderSizePixel = 0
				ColorpickerTitel.Position = UDim2.new(0.0294061638, 0, 0, 0)
				ColorpickerTitel.Size = UDim2.new(0.808290184, 0, 1, 0)
				ColorpickerTitel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				ColorpickerTitel.Text = options.Title
				ColorpickerTitel.TextColor3 = TextColorUI
				ColorpickerTitel.TextSize = 12.000
				ColorpickerTitel.TextXAlignment = Enum.TextXAlignment.Left

				NowColor.Name = "NowColor"
				NowColor.Parent = Colorpicker
				NowColor.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
				NowColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
				NowColor.BorderSizePixel = 0
				NowColor.Position = UDim2.new(0.779999971, 0, 0.159999996, 0)
				NowColor.Size = UDim2.new(0, 31, 0, 16)

				UICorner_12.CornerRadius = UDim.new(0, 2)
				UICorner_12.Parent = NowColor

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Colorpicker
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
				ColorSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorSelection.BorderSizePixel = 0
				ColorSelection.Position = UDim2.new(0.50000006, 0, 1.67629671, 0)
				ColorSelection.Size = UDim2.new(0, 137, 0, 106)
				ColorSelection.Visible = false
				ColorSelection.ZIndex = 2

				Color.Name = "Color"
				Color.Parent = ColorSelection
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
				Color.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Color.BorderSizePixel = 0
				Color.Position = UDim2.new(0.0656934306, 0, 0.148202568, 0)
				Color.Size = UDim2.new(0, 77, 0, 79)
				Color.ZIndex = 3
				Color.Image = "rbxassetid://4155801252"

				ColorSelection_2.Name = "ColorSelection"
				ColorSelection_2.Parent = Color
				ColorSelection_2.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection_2.BackgroundTransparency = 1.000
				ColorSelection_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorSelection_2.BorderSizePixel = 0
				ColorSelection_2.Size = UDim2.new(0, 10, 0, 10)
				ColorSelection_2.ZIndex = 3
				ColorSelection_2.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection_2.ScaleType = Enum.ScaleType.Fit

				Hue.Name = "Hue"
				Hue.Parent = ColorSelection
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Hue.BorderSizePixel = 0
				Hue.Position = UDim2.new(0.686131358, 0, 0.142243013, 0)
				Hue.Size = UDim2.new(0, 15, 0, 80)
				Hue.ZIndex = 2

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.19, Color3.fromRGB(255, 247, 0)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(34, 255, 0)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(0, 255, 247)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.89, Color3.fromRGB(238, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
				UIGradient.Rotation = 270
				UIGradient.Parent = Hue

				UICorner_13.CornerRadius = UDim.new(0, 2)
				UICorner_13.Parent = Hue

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
				HueSelection.BorderSizePixel = 0
				HueSelection.Position = UDim2.new(0.5, 0, 0.762499988, 0)
				HueSelection.Size = UDim2.new(0, 10, 0, 10)
				HueSelection.ZIndex = 3
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

				UICorner_14.CornerRadius = UDim.new(0, 5)
				UICorner_14.Parent = ColorSelection

				ColorpickerButton.Name = "ColorpickerButton"
				ColorpickerButton.Parent = Colorpicker
				ColorpickerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerButton.BackgroundTransparency = 1.000
				ColorpickerButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorpickerButton.BorderSizePixel = 0
				ColorpickerButton.Size = UDim2.new(1, 0, 1, 0)
				ColorpickerButton.Font = Enum.Font.SourceSans
				ColorpickerButton.Text = ""
				ColorpickerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				ColorpickerButton.TextSize = 14.000

				local HHHHH = false
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = Color3.fromRGB(0, 0, 0)
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil
				local RunService = game:GetService("RunService")

				local function UpdateColorPicker(nope)
					NowColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
					pcall(options.Callback, NowColor.BackgroundColor3)
				end

				ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorSelection_2.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorSelection_2.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

				NowColor.BackgroundColor3 = options.Preset
				Color.BackgroundColor3 = options.Preset
				pcall(options.Callback, NowColor.BackgroundColor3)

				ColorpickerButton.MouseButton1Click:Connect(function()
					ColorSelection.Visible = not HHHHH
					HHHHH = not HHHHH
				end)

				Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput = RunService.RenderStepped:Connect(function()
							local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
							ColorSelection_2.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY

							UpdateColorPicker(true)
						end)
					end
				end)

				Color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				Hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end

						HueInput = RunService.RenderStepped:Connect(function()
							local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
							HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
							ColorH = 1 - HueY

							UpdateColorPicker(true)
						end)
					end
				end)

				Hue.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)
			end

			function library.FuncMain.CreateInput(options)
				local Name = options.Name;wait()
				local default = options.Value or ''
				local Placeholder = options.Placeholder
				local callback = options.Callback

				local Input = Instance.new("Frame")
				local UICorner_15 = Instance.new("UICorner")
				local Main_2 = Instance.new("Frame")
				local TextBox = Instance.new("TextBox")
				local UICorner_16 = Instance.new("UICorner")
				local InputTitle = Instance.new("TextLabel")

				Input.Name = "Input"
				Input.Parent = Sections
				Input.BackgroundColor3 = Background2
				Input.BackgroundTransparency = 0.600
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.ClipsDescendants = true
				Input.Position = UDim2.new(0, 0, 0.638990283, 0)
				Input.Size = UDim2.new(0.950000107, 0, 0.0111752702, 35)

				UICorner_15.CornerRadius = UDim.new(0, 2)
				UICorner_15.Parent = Input

				Main_2.Name = "Main"
				Main_2.Parent = Input
				Main_2.BackgroundColor3 = Background2
				Main_2.BackgroundTransparency = 0.600
				Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main_2.BorderSizePixel = 0
				Main_2.ClipsDescendants = true
				Main_2.Size = UDim2.new(1, 0, 1, 0)

				TextBox.Parent = Main_2
				TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
				TextBox.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0.5, 0, 0.699999988, 0)
				TextBox.Size = UDim2.new(0.800000012, 0, 0.459695935, 0)
				TextBox.Font = Enum.Font.SourceSansBold
				TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
				TextBox.PlaceholderText = Placeholder
				TextBox.Text = default
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 12.000

				UICorner_16.CornerRadius = UDim.new(0, 2)
				UICorner_16.Parent = Main_2

				InputTitle.Name = "InputTitle"
				InputTitle.Parent = Main_2
				InputTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				InputTitle.BackgroundTransparency = 1.000
				InputTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				InputTitle.BorderSizePixel = 0
				InputTitle.Position = UDim2.new(0.0292273257, 0, 0.107466936, 0)
				InputTitle.Size = UDim2.new(0.949801564, 0, 0.340152115, 0)
				InputTitle.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				InputTitle.Text = Name
				InputTitle.TextColor3 = TextColorUI
				InputTitle.TextSize = 10.000
				InputTitle.TextXAlignment = Enum.TextXAlignment.Left

				TextBox.FocusLost:Connect(function(ep)
					if #TextBox.Text > 0 then
						callback(TextBox.Text)
						TextBox.Text = TextBox.Text
					end
				end)
				callback(default)
			end
			function library.FuncMain.CreateSlider(options)
				local text = options.Name;wait()
				local callback = options.Format or function() end

				local Slider = Instance.new("Frame")
				local UICorner_17 = Instance.new("UICorner")
				local ButtonText = Instance.new("TextLabel")
				local TextBox_2 = Instance.new("TextBox")
				local UICorner_18 = Instance.new("UICorner")
				local ValueFrame2 = Instance.new("Frame")
				local UICorner_19 = Instance.new("UICorner")
				local ValueFrame = Instance.new("Frame")
				local UICorner_20 = Instance.new("UICorner")
				local Frame = Instance.new("Frame")
				local UICorner_21 = Instance.new("UICorner")

				Slider.Name = "Slider"
				Slider.Parent = Sections
				Slider.BackgroundColor3 = Background2
				Slider.BackgroundTransparency = 0.600
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0.745725453, 0)
				Slider.Size = UDim2.new(0.950000107, 0, 0.00989808794, 31)

				UICorner_17.CornerRadius = UDim.new(0, 2)
				UICorner_17.Parent = Slider

				ButtonText.Name = "ButtonText"
				ButtonText.Parent = Slider
				ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonText.BackgroundTransparency = 1.000
				ButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ButtonText.BorderSizePixel = 0
				ButtonText.Position = UDim2.new(0.0462909453, 0, 0.191856131, 0)
				ButtonText.Size = UDim2.new(0, 148, 0, 9)
				ButtonText.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				ButtonText.Text = text
				ButtonText.TextColor3 = TextColorUI
				ButtonText.TextSize = 12.000
				ButtonText.TextXAlignment = Enum.TextXAlignment.Left

				TextBox_2.Parent = Slider
				TextBox_2.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
				TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox_2.BorderSizePixel = 0
				TextBox_2.Position = UDim2.new(0.747350395, 0, 0.175377965, 0)
				TextBox_2.Size = UDim2.new(0, 36, 0, 10)
				TextBox_2.Font = Enum.Font.Ubuntu
				TextBox_2.Text = "70"
				TextBox_2.TextColor3 = TextColorUI
				TextBox_2.TextSize = 9.000

				UICorner_18.CornerRadius = UDim.new(0, 2)
				UICorner_18.Parent = TextBox_2

				ValueFrame2.Name = "ValueFrame2"
				ValueFrame2.Parent = Slider
				ValueFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueFrame2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				ValueFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueFrame2.BorderSizePixel = 0
				ValueFrame2.Position = UDim2.new(0.5, 0, 0.800000012, 0)
				ValueFrame2.Size = UDim2.new(0.949999988, 0, 0, 2)

				UICorner_19.CornerRadius = UDim.new(0, 5)
				UICorner_19.Parent = ValueFrame2

				ValueFrame.Name = "ValueFrame"
				ValueFrame.Parent = ValueFrame2
				ValueFrame.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
				ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueFrame.BorderSizePixel = 0
				ValueFrame.Size = UDim2.new(0.827310622, 0, 1, 0)

				UICorner_20.CornerRadius = UDim.new(0, 5)
				UICorner_20.Parent = ValueFrame

				Frame.Parent = ValueFrame
				Frame.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame.BackgroundColor3 = MainBackground or Color3.fromRGB(48, 51, 71)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(1, 0, 0, 0)
				Frame.Size = UDim2.new(0, 10, 0, 10)

				UICorner_21.CornerRadius = UDim.new(1, 8)
				UICorner_21.Parent = Frame

				ValueFrame:TweenSize(UDim2.new((options.Value or 0) / options.Max, 0, 1, 0), "Out", "Back", 0.2, true)
				callback(options.Value)
				TextBox_2.Text = options.Value
				TextBox_2.FocusLost:Connect(function()
					if TextBox_2.Text == "" then
						TextBox_2.Text = options.Value
					end
					if  tonumber(TextBox_2.Text) > options.Max then
						TextBox_2.Text  = options.Max
					end;if  tonumber(TextBox_2.Text) <= options.Min then
						TextBox_2.Text  = options.Min
					end

					ValueFrame:TweenSize(UDim2.new((TextBox_2.Text or 0) / options.Max, 0, 1, 0), "Out", "Back", 0.2, true)
					TextBox_2.Text = tostring(TextBox_2.Text)
					pcall(callback, tonumber(TextBox_2.Text))
				end)
				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							1,
							0
						)

					ValueFrame:TweenSize(pos1, "Out", "Sine", 0.2, true)
					local value = math.floor(((pos.X.Scale * options.Max) / options.Max) * (options.Max - options.Min) + options.Min)
					TextBox_2.Text = tonumber(value)
					callback(tonumber(value))
				end
				local dragging = false
				Frame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				Frame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
						end
					end
				)

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)
			end
			function library.FuncMain.CreateImage(options)
				local TableImg = {}
				local Image = Instance.new("Frame")
				local UICorner_22 = Instance.new("UICorner")
				local ImageIcon = Instance.new("ImageLabel")
				local Title = Instance.new("TextLabel")
				local NameIcon = Instance.new("TextLabel")

				Image.Name = "Image"
				Image.Parent = Sections
				Image.BackgroundColor3 = Background2
				Image.BackgroundTransparency = 0.600
				Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Image.BorderSizePixel = 0
				Image.ClipsDescendants = true
				Image.Position = UDim2.new(0, 0, 0.311646491, 0)
				Image.Size = UDim2.new(0.950000107, 0, 0.152440205, 27)

				UICorner_22.CornerRadius = UDim.new(0, 2)
				UICorner_22.Parent = Image

				ImageIcon.Name = "ImageIcon"
				ImageIcon.Parent = Image
				ImageIcon.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageIcon.BackgroundTransparency = 1.000
				ImageIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageIcon.BorderSizePixel = 0
				ImageIcon.Position = UDim2.new(0.493066698, 0, 0.5, 0)
				ImageIcon.Size = UDim2.new(0, 50, 0, 50)
				ImageIcon.Image = "rbxassetid://"

				if options.AIP then
					local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
					local length = 20
					local randomString = ""

					math.randomseed(os.time())

					local charTable = {}
					for c in chars:gmatch "." do
						table.insert(charTable, c)
					end

					for i = 1, length do
						randomString = randomString .. charTable[math.random(1, #charTable)]
					end
					ImageIcon.Image = GetImage("Image".. randomString, options.Image)
				else
					ImageIcon.Image = "rbxassetid://".. options.Image
				end

				Title.Name = "Title"
				Title.Parent = Image
				Title.AnchorPoint = Vector2.new(0.5, 0.5)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(0.5, 0, 0.100000001, 0)
				Title.Size = UDim2.new(1, 0, 0.151999995, 0)
				Title.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				Title.Text = options.Title
				Title.TextColor3 = Color3.fromRGB(185, 185, 185)
				Title.TextSize = 12.000
				Title.TextWrapped = true

				NameIcon.Name = "NameIcon"
				NameIcon.Parent = Image
				NameIcon.AnchorPoint = Vector2.new(0.5, 0.5)
				NameIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NameIcon.BackgroundTransparency = 1.000
				NameIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				NameIcon.BorderSizePixel = 0
				NameIcon.Position = UDim2.new(0.5, 0, 0.899999976, 0)
				NameIcon.Size = UDim2.new(1, 0, 0.151999995, 0)
				NameIcon.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				NameIcon.Text = options.Dis
				NameIcon.TextColor3 = Color3.fromRGB(185, 185, 185)
				NameIcon.TextSize = 12.000
				NameIcon.TextWrapped = true

				function TableImg:UpdateImage(Value)
					if options.AIP then
						local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
						local length = 20
						local randomString = ""

						math.randomseed(os.time())

						local charTable = {}
						for c in chars:gmatch "." do
							table.insert(charTable, c)
						end

						for i = 1, length do
							randomString = randomString .. charTable[math.random(1, #charTable)]
						end
						ImageIcon.Image = GetImage("Image".. randomString, Value)
					else
						ImageIcon.Image = "rbxassetid://".. Value
					end
				end
				function TableImg:UpdateTitle(Value)
					Title.Text = Value
				end
				function TableImg:UpdateDis(Value)
					NameIcon.Text = Value
				end
				return TableImg
			end
			return library.FuncMain
		end
		return library.Sections
	end
	return library.TapGroup
end


print("Excute")

print("Loading Function")

local placeId = game.PlaceId
World1, World2, World3 = placeId == 2753915549, placeId == 4442272183, placeId == 7449423635  

local LocalPlayer = game:GetService('Players').LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild('Humanoid')
local QuestC = LocalPlayer.PlayerGui:WaitForChild('Main'):WaitForChild('Quest')
local RootPart = Character:WaitForChild('HumanoidRootPart')

local network = game:GetService("ReplicatedStorage").Remotes.CommF_
local WebScrap = game:HttpGet(("https://www.roblox.com/games/2753915549/UPDATE-Blox-Fruits")) or '<meta name="description" content=: 2300/>'
local MaxedLevel = WebScrap:split('<meta name="description" content=')[2]:split("/>")[1]:split(": ")[2]:split("\n")[1]
local MAXLEVEL = tonumber(MaxedLevel)
local Funcs = {}
local Threads = {}
local Module = {}
local SeaIndex = World3 and 3 or World2 and 2 or World1 and 1 or LocalPlayer:Kick("Didn't update this Sea")

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild('Humanoid')
    RootPart = Character:WaitForChild('HumanoidRootPart')
end)

-- local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua"))()


-- task.delay(4, function() Notification.new("success", "Attack Hub | Blox Fruit", "Load Script Success in "..string.format("%.2f",tick() - LoadingTime).." secs",):delete() end)
-- task.delay(4, function() Notification.new("info", "https://discord.gg/PGH8JDuwr4", "you can report bug or request function",):delete() end)

function Getpcall(func, ...)  
	local success, err = pcall(func, ...)  
	if not success then warn("Error:", err) end  
end

function repeats(condition,time, func, custom)
	if not condition then 
		return
	end
	repeat task.wait(time)
		if func then Getpcall(func) end
	until not condition or (custom and custom())
end


_C = function(...)
	local args = {...}
	local data = network:InvokeServer(...)
	if args[1] == "requestEntrance" then
		game:GetService("CollectionService"):AddTag(Character, "Teleporting")
		task.delay(3, function() game:GetService("CollectionService"):RemoveTag(Character, "Teleporting") end)
		task.wait(0.25)
	end
	return data
end
_key = function(key)  
	local Virtual = game:service('VirtualInputManager')
	Virtual:SendKeyEvent(true, key, false, game)
	wait(0.1)
	Virtual:SendKeyEvent(false, key, false, game)
end
cancelQuest = function() _C("AbandonQuest") end


function CheckQuest()
	local lv = LocalPlayer.Data.Level.Value
	if World1 then
		if lv >= 1 and lv <= 9 then
			if tostring(LocalPlayer.Team) == "Marines" then
				return {
					[1] = "Trainee",
					[2] = 1,
					[3] = "MarineQuest",
					[4] = CFrame.new(-2711.635498046875, 24.834863662719727, 2104.212890625),
				}
			elseif tostring(LocalPlayer.Team) == "Pirates" then
				return {
					[1] = "Bandit",
					[2] = 1,
					[3] = "BanditQuest1",
					[4] = CFrame.new(1059.37195, 15.4495068, 1550.4231),
				}
			end
		elseif lv >= 10 and lv <= 14 then
			return {
				[1] = "Monkey",
				[2] = 1,
				[3] = "JungleQuest",
				[4] = CFrame.new(-1598.08911, 35.5501175, 153.377838),
			}
		elseif lv >= 15 and lv <= 29 then
			return {
				[1] = "Gorilla",
				[2] = 2,
				[3] = "JungleQuest",
				[4] = CFrame.new(-1598.08911, 35.5501175, 153.377838),
			}
		elseif lv >= 30 and lv <= 39 then
			return {
				[1] = "Pirate",
				[2] = 1,
				[3] = "BuggyQuest1",
				[4] = CFrame.new(-1141.07483, 4.10001802, 3831.5498),
			}
		elseif lv >= 40 and lv <= 59 then
			return {
				[1] = "Brute",
				[2] = 2,
				[3] = "BuggyQuest1",
				[4] = CFrame.new(-1141.07483, 4.10001802, 3831.5498),
			}
		elseif lv >= 60 and lv <= 74 then
			return {
				[1] = "Desert Bandit",
				[2] = 1,
				[3] = "DesertQuest",
				[4] = CFrame.new(894.488647, 5.14000702, 4392.43359),
			}
		elseif lv >= 75 and lv <= 89 then
			return {
				[1] = "Desert Officer",
				[2] = 2,
				[3] = "DesertQuest",
				[4] = CFrame.new(894.488647, 5.14000702, 4392.43359),
			}
		elseif lv >= 90 and lv <= 99 then
			return {
				[1] = "Snow Bandit",
				[2] = 1,
				[3] = "SnowQuest",
				[4] = CFrame.new(1389.74451, 88.1519318, -1298.90796),
			}
		elseif lv >= 100 and lv <= 119 then
			return {
				[1] = "Snowman",
				[2] = 2,
				[3] = "SnowQuest",
				[4] = CFrame.new(1389.74451, 88.1519318, -1298.90796),
			}
		elseif lv >= 120 and lv <= 149 then
			return {
				[1] = "Chief Petty Officer",
				[2] = 1,
				[3] = "MarineQuest2",
				[4] = CFrame.new(-5039.58643, 27.3500385, 4324.68018),
			}
		elseif lv >= 150 and lv <= 174 then
			return {
				[1] = "Sky Bandit",
				[2] = 1,
				[3] = "SkyQuest",
				[4] = CFrame.new(-4839.53027, 716.368591, -2619.44165),
			}
		elseif lv >= 175 and lv <= 189 then
			return {
				[1] = "Dark Master",
				[2] = 2,
				[3] = "SkyQuest",
				[4] = CFrame.new(-4839.53027, 716.368591, -2619.44165),
			}
		elseif lv >= 190 and lv <= 209 then
			return {
				[1] = "Prisoner",
				[2] = 1,
				[3] = "PrisonerQuest",
				[4] = CFrame.new(5308.93115, 1.65517521, 475.120514),
			}
		elseif lv >= 210 and lv <= 249 then
			return {
				[1] = "Dangerous Prisoner",
				[2] = 2,
				[3] = "PrisonerQuest",
				[4] = CFrame.new(5308.93115, 1.65517521, 475.120514),
			}
		elseif lv >= 250 and lv <= 274 then
			return {
				[1] = "Toga Warrior",
				[2] = 1,
				[3] = "ColosseumQuest",
				[4] = CFrame.new(-1580.04663, 6.35000277, -2986.47534),
			}
		elseif lv >= 275 and lv <= 299 then
			return {
				[1] = "Gladiator",
				[2] = 2,
				[3] = "ColosseumQuest",
				[4] = CFrame.new(-1580.04663, 6.35000277, -2986.47534),
			}
		elseif lv >= 300 and lv <= 324 then
			return {
				[1] = "Military Soldier",
				[2] = 1,
				[3] = "MagmaQuest",
				[4] = CFrame.new(-5313.37012, 10.9500084, 8515.29395),
			}
		elseif lv >= 325 and lv <= 374 then
			return {
				[1] = "Military Spy",
				[2] = 2,
				[3] = "MagmaQuest",
				[4] = CFrame.new(-5313.37012, 10.9500084, 8515.29395),
			}
		elseif lv >= 375 and lv <= 399 then
			return {
				[1] = "Fishman Warrior",
				[2] = 1,
				[3] = "FishmanQuest",
				[4] = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734),
			}
		elseif lv >= 400 and lv <= 449 then
			return {
				[1] = "Fishman Commando",
				[2] = 2,
				[3] = "FishmanQuest",
				[4] = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734),
			}
		elseif lv >= 450 and lv <= 474 then
			return {
				[1] = "God's Guard",
				[2] = 1,
				[3] = "SkyExp1Quest",
				[4] = CFrame.new(-7859.09814, 5544.19043, -381.476196),
			}
		elseif lv >= 475 and lv <= 524 then
			return {
				[1] = "Shanda",
				[2] = 2,
				[3] = "SkyExp1Quest",
				[4] = CFrame.new(-7859.09814, 5544.19043, -381.476196),
			}
		elseif lv >= 525 and lv <= 549 then
			return {
				[1] = "Royal Squad",
				[2] = 1,
				[3] = "SkyExp2Quest",
				[4] = CFrame.new(-7906.81592, 5634.6626, -1411.99194),
			}
		elseif lv >= 550 and lv <= 624 then
			return {
				[1] = "Royal Soldier",
				[2] = 2,
				[3] = "SkyExp2Quest",
				[4] = CFrame.new(-7906.81592, 5634.6626, -1411.99194),
			}
		elseif lv >= 625 and lv <= 649 then
			return {
				[1] = "Galley Pirate",
				[2] = 1,
				[3] = "FountainQuest",
				[4] = CFrame.new(5259.81982, 37.3500175, 4050.0293),
			}
		elseif lv >= 650 then
			return {
				[1] = "Galley Captain",
				[2] = 2,
				[3] = "FountainQuest",
				[4] = CFrame.new(5259.81982, 37.3500175, 4050.0293),
			}
		end
	elseif World2 then
		if lv >= 700 and lv <= 724 then
			return {
				[1] = "Raider",
				[2] = 1,
				[3] = "Area1Quest",
				[4] = CFrame.new(-429.543518, 71.7699966, 1836.18188)
			}
		elseif lv >= 725 and lv <= 774 then
			return {
				[1] = "Mercenary",
				[2] = 2,
				[3] = "Area1Quest",
				[4] = CFrame.new(-429.543518, 71.7699966, 1836.18188)
			}
		elseif lv >= 775 and lv <= 799 then
			return {
				[1] = "Swan Pirate",
				[2] = 1,
				[3] = "Area2Quest",
				[4] = CFrame.new(638.43811, 71.769989, 918.282898)
			}
		elseif lv >= 800 and lv <= 874 then
			return {
				[1] = "Factory Staff",
				[2] = 2,
				[3] = "Area2Quest",
				[4] = CFrame.new(632.698608, 73.1055908, 918.666321)
			}
		elseif lv >= 875 and lv <= 899 then
			return {
				[1] = "Marine Lieutenant",
				[2] = 1,
				[3] = "MarineQuest3",
				[4] = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
			}
		elseif lv >= 900 and lv <= 949 then
			return {
				[1] = "Marine Captain",
				[2] = 2,
				[3] = "MarineQuest3",
				[4] = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
			}
		elseif lv >= 950 and lv <= 974 then
			return {
				[1] = "Zombie",
				[2] = 1,
				[3] = "ZombieQuest",
				[4] = CFrame.new(-5497.06152, 47.5923004, -795.237061)
			}
		elseif lv >= 975 and lv <= 999 then
			return {
				[1] = "Vampire",
				[2] = 2,
				[3] = "ZombieQuest",
				[4] = CFrame.new(-5497.06152, 47.5923004, -795.237061)
			}
		elseif lv >= 1000 and lv <= 1049 then
			return {
				[1] = "Snow Trooper",
				[2] = 1,
				[3] = "SnowMountainQuest",
				[4] = CFrame.new(609.858826, 400.119904, -5372.25928)
			}
		elseif lv >= 1050 and lv <= 1099 then
			return {
				[1] = "Winter Warrior",
				[2] = 2,
				[3] = "SnowMountainQuest",
				[4] = CFrame.new(609.858826, 400.119904, -5372.25928)
			}
		elseif lv >= 1100 and lv <= 1124 then
			return {
				[1] = "Lab Subordinate",
				[2] = 1,
				[3] = "IceSideQuest",
				[4] = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
			}
		elseif lv >= 1125 and lv <= 1174 then
			return {
				[1] = "Horned Warrior",
				[2] = 2,
				[3] = "IceSideQuest",
				[4] = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
			}
		elseif lv >= 1175 and lv <= 1199 then
			return {
				[1] = "Magma Ninja",
				[2] = 1,
				[3] = "FireSideQuest",
				[4] = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
			}
		elseif lv >= 1200 and lv <= 1249 then
			return {
				[1] = "Lava Pirate",
				[2] = 2,
				[3] = "FireSideQuest",
				[4] = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
			}
		elseif lv >= 1250 and lv <= 1274 then
			return {
				[1] = "Ship Deckhand",
				[2] = 1,
				[3] = "ShipQuest1",
				[4] = CFrame.new(1037.80127, 125.092171, 32911.6016)
			}
		elseif lv >= 1275 and lv <= 1299 then
			return {
				[1] = "Ship Engineer",
				[2] = 2,
				[3] = "ShipQuest1",
				[4] = CFrame.new(1037.80127, 125.092171, 32911.6016)
			}
		elseif lv >= 1300 and lv <= 1324 then
			return {
				[1] = "Ship Steward",
				[2] = 1,
				[3] = "ShipQuest2",
				[4] = CFrame.new(968.80957, 125.092171, 33244.125)
			}
		elseif lv >= 1325 and lv <= 1349 then
			return {
				[1] = "Ship Officer",
				[2] = 2,
				[3] = "ShipQuest2",
				[4] = CFrame.new(968.80957, 125.092171, 33244.125)
			}
		elseif lv >= 1350 and lv <= 1374 then
			return {
				[1] = "Arctic Warrior",
				[2] = 1,
				[3] = "FrostQuest",
				[4] = CFrame.new(5667.6582, 26.7997818, -6486.08984)
			}
		elseif lv >= 1375 and lv <= 1424 then
			return {
				[1] = "Snow Lurker",
				[2] = 2,
				[3] = "FrostQuest",
				[4] = CFrame.new(5667.6582, 26.7997818, -6486.08984)
			}
		elseif lv >= 1425 and lv <= 1449 then
			return {
				[1] = "Sea Soldier",
				[2] = 1,
				[3] = "ForgottenQuest",
				[4] = CFrame.new(-3055, 240, -10145)
			}
		elseif lv >= 1450 then
			return {
				[1] = "Water Fighter",
				[2] = 2,
				[3] = "ForgottenQuest",
				[4] = CFrame.new(-3055, 240, -10145)
			}
		end
	elseif World3 then
		if lv >= 1500 and lv <= 1524 then
			return {
				[1] = "Pirate Millionaire",
				[2] = 1,
				[3] = "PiratePortQuest",
				[4] = CFrame.new(-449.1593017578125, 108.6176528930664, 5948.00146484375)
			}
		elseif lv >= 1525 and lv <= 1574 then
			return {
				[1] = "Pistol Billionaire",
				[2] = 2,
				[3] = "PiratePortQuest",
				[4] = CFrame.new(-449.1593017578125, 108.6176528930664, 5948.00146484375)
			}
		elseif lv >= 1575 and lv <= 1599 then
			return {
				[1] = "Dragon Crew Warrior",
				[2] = 1,
				[3] = "DragonCrewQuest",
				[4] = CFrame.new(6737.77685546875, 127.42920684814453, -713.2312622070312)
			}
		elseif lv >= 1600 and lv <= 1624 then 
			return {
				[1] = "Dragon Crew Archer",
				[2] = 2,
				[3] = "DragonCrewQuest",
				[4] = CFrame.new(6737.77685546875, 127.42920684814453, -713.2312622070312)
			}
		elseif lv >= 1625 and lv <= 1649 then
			return {
				[1] = "Hydra Enforcer",
				[2] = 1,
				[3] = "VenomCrewQuest",
				[4] = CFrame.new(5212.94140625, 1004.1171875, 755.6657104492188)
			}
		elseif lv >= 1650 and lv <= 1699 then 
			return {
				[1] = "Venomous Assailant",
				[2] = 2,
				[3] = "VenomCrewQuest",
				[4] = CFrame.new(5212.94140625, 1004.1171875, 755.6657104492188)
			}
		elseif lv >= 1700 and lv <= 1724 then
			return {
				[1] = "Marine Commodore",
				[2] = 1,
				[3] = "MarineTreeIsland",
				[4] = CFrame.new(2484.0673828125, 74.28215026855469, -6786.64453125)
			}
		elseif lv >= 1725 and lv <= 1774 then
			return {
				[1] = "Marine Rear Admiral",
				[2] = 2,
				[3] = "MarineTreeIsland",
				[4] = CFrame.new(2484.0673828125, 74.28215026855469, -6786.64453125)
			}
		elseif lv >= 1775 and lv <= 1799 then
			return {
				[1] = "Fishman Raider",
				[2] = 1,
				[3] = "DeepForestIsland3",
				[4] = CFrame.new(-10581.6563, 330.872955, -8761.18652)
			}
		elseif lv >= 1800 and lv <= 1824 then
			return {
				[1] = "Fishman Captain",
				[2] = 2,
				[3] = "DeepForestIsland3",
				[4] = CFrame.new(-10581.6563, 330.872955, -8761.18652)
			}
		elseif lv >= 1825 and lv <= 1849 then
			return {
				[1] = "Forest Pirate",
				[2] = 1,
				[3] = "DeepForestIsland",
				[4] = CFrame.new(-13234.04, 331.488495, -7625.40137)
			}
		elseif lv >= 1850 and lv <= 1899 then
			return {
				[1] = "Mythological Pirate",
				[2] = 2,
				[3] = "DeepForestIsland",
				[4] = CFrame.new(-13234.04, 331.488495, -7625.40137)
			}
		elseif lv >= 1900 and lv <= 1924 then
			return {
				[1] = "Jungle Pirate",
				[2] = 1,
				[3] = "DeepForestIsland2",
				[4] = CFrame.new(-12680.3818, 389.971039, -9902.01953)
			}
		elseif lv >= 1925 and lv <= 1974 then
			return {
				[1] = "Musketeer Pirate",
				[2] = 2,
				[3] = "DeepForestIsland2",
				[4] = CFrame.new(-12680.3818, 389.971039, -9902.01953)
			}
		elseif lv >= 1975 and lv <= 1999 then
			return {
				[1] = "Reborn Skeleton",
				[2] = 1,
				[3] = "HauntedQuest1",
				[4] = CFrame.new(-9479.2168, 141.215088, 5566.09277)
			}
		elseif lv >= 2000 and lv <= 2024 then
			return {
				[1] = "Living Zombie",
				[2] = 2,
				[3] = "HauntedQuest1",
				[4] = CFrame.new(-9479.2168, 141.215088, 5566.09277)
			}
		elseif lv >= 2025 and lv <= 2049 then
			return {
				[1] = "Demonic Soul",
				[2] = 1,
				[3] = "HauntedQuest2",
				[4] = CFrame.new(-9516.99316, 172.017181, 6078.46533)
			}
		elseif lv >= 2050 and lv <= 2074 then
			return {
				[1] = "Posessed Mummy",
				[2] = 2,
				[3] = "HauntedQuest2",
				[4] = CFrame.new(-9516.99316, 172.017181, 6078.46533)
			}
		elseif lv >= 2075 and lv <= 2099 then
			return {
				[1] = "Peanut Scout",
				[2] = 1,
				[3] = "NutsIslandQuest",
				[4] = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875)
			}
		elseif lv >= 2100 and lv <= 2124 then
			return {
				[1] = "Peanut President",
				[2] = 2,
				[3] = "NutsIslandQuest",
				[4] = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875)
			}
		elseif lv >= 2125 and lv <= 2149 then
			return {
				[1] = "Ice Cream Chef",
				[2] = 1,
				[3] = "IceCreamIslandQuest",
				[4] = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438)
			}
		elseif lv >= 2150 and lv <= 2199 then
			return {
				[1] = "Ice Cream Commander",
				[2] = 2,
				[3] = "IceCreamIslandQuest",
				[4] = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438)
			}
		elseif lv >= 2200 and lv <= 2224 then
			return {
				[1] = "Cookie Crafter",
				[2] = 1,
				[3] = "CakeQuest1",
				[4] = CFrame.new(-2021.32007, 37.7982254, -12028.7295)
			}
		elseif lv >= 2225 and lv <= 2249 then
			return {
				[1] = "Cake Guard",
				[2] = 2,
				[3] = "CakeQuest1",
				[4] = CFrame.new(-2021.32007, 37.7982254, -12028.7295)
			}
		elseif lv >= 2250 and lv <= 2274 then
			return {
				[1] = "Baking Staff",
				[2] = 1,
				[3] = "CakeQuest2",
				[4] = CFrame.new(-1927.91602, 37.7981339, -12842.5391)
			}
		elseif lv >= 2275 and lv <= 2299 then
			return {
				[1] = "Head Baker",
				[2] = 2,
				[3] = "CakeQuest2",
				[4] = CFrame.new(-1927.91602, 37.7981339, -12842.5391)
			}
		elseif lv >= 2300 and lv <= 2324 then
			return {
				[1] = "Cocoa Warrior",
				[2] = 1,
				[3] = "ChocQuest1",
				[4] = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
			}
		elseif lv >= 2325 and lv <= 2349 then
			return {
				[1] = "Chocolate Bar Battler",
				[2] = 2,
				[3] = "ChocQuest1",
				[4] = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
			}
		elseif lv >= 2350 and lv <= 2374 then
			return {
				[1] = "Sweet Thief",
				[2] = 1,
				[3] = "ChocQuest2",
				[4] = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
			}
		elseif lv >= 2375 and lv <= 2399 then
			return {
				[1] = "Candy Rebel",
				[2] = 2,
				[3] = "ChocQuest2",
				[4] = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
			}
		elseif lv >= 2400 and lv <= 2424 then
			return {
				[1] = "Candy Pirate",
				[2] = 1,
				[3] = "CandyQuest1",
				[4] = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
			}
		elseif lv >= 2425 and lv <= 2449 then
			return {
				[1] = "Snow Demon",
				[2] = 2,
				[3] = "CandyQuest1",
				[4] = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
			}
		elseif lv >= 2450 and lv <= 2474 then
			return {
				[1] = "Isle Outlaw",
				[2] = 1,
				[3] = "TikiQuest1",
				[4] = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
			}
		elseif lv >= 2475 and lv <= 2499 then
			return {
				[1] = "Island Boy",
				[2] = 2,
				[3] = "TikiQuest1",
				[4] = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
			}
		elseif lv >= 2500 and lv <= 2524 then
			return {
				[1] = "Sun-kissed Warrior",
				[2] = 1,
				[3] = "TikiQuest1",
				[4] = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
			}
		elseif lv >= 2525 and lv <= 2549 then
			return {
				[1] = "Isle Champion",
				[2] = 2,
				[3] = "TikiQuest2",
				[4] = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
			}
		elseif lv >= 2550 and lv <= 2574 then
			return {
				[1] = "Serpent Hunter",
				[2] = 1,
				[3] = "TikiQuest3",
				[4] = CFrame.new(-16666.5703125, 105.2913818359375, 1576.6925048828125)
			}
		elseif lv >= 2575 then
			return {
				[1] = "Skull Slayer",
				[2] = 2,
				[3] = "TikiQuest3",
				[4] = CFrame.new(-16666.5703125, 105.2913818359375, 1576.6925048828125)
			}
		end
	end
end

function __getEnemiesByName(params)
	if not params or not params.target then
		warn("Invalid parameters passed to _getEnemiesByName")
		return nil, nil
	end
	local targetName = params.target
	local matchedEnemy = nil
	local matchedSpawn = nil
	for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
		if (type(targetName) == "table" and table.find(targetName, enemy.Name)) or enemy.Name == targetName then
			if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and Module.IsAlive(enemy) then
				matchedEnemy = enemy
				break
			end
		end
	end
	for _, spawn in ipairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
		if string.find(spawn.Name, type(targetName) == "table" and targetName[1] or targetName) and spawn:IsA("Part") then
			matchedSpawn = spawn.CFrame
		end
	end
	return matchedEnemy, matchedSpawn
end

Equiptype = function (toolName)
	for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
		if tool:IsA("Tool") and tool.ToolTip == toolName then
			Humanoid:EquipTool(tool)
			break
		end
	end
end

AutoSkills = function(customCondition, expression)
	local actions = {
		Sea = function()
			repeats(not expression(),.2, function()
				wait(.1)
				Equiptype("Melee")
				for _, skill in pairs({"Z", "X", "C"}) do _S(skill) end
				Equiptype("Blox Fruit")
				for _, skill in pairs({"Z", "X", "C", "V"}) do _S(skill) end
				Equiptype("Sword")
				for _, skill in pairs({"Z", "X"}) do _S(skill) end
			end)
		end,

		Fruit = function()
			repeats(not expression(),.2, function()
				for _, skill in pairs({"Z", "X", "C", "V"}) do
					if _G['Skill ' .. skill] then _S(skill) end
				end
			end)
		end,

		Gun = function()
			repeats(not expression(),.2, function()
				for _, skill in pairs({"Z", "X"}) do
					if _G['Skill ' .. skill] then _S(skill) end
				end
			end)
		end
	}

	return actions[customCondition]()
end

function CreateF(options)
	if not options or type(options) ~= "table" then return end
	local method = options.Callmethod or function() return true end
	if type(method) == "function" then
	else
		print("Method is not a function.")
	end

	local result = method()
	if not result then return end
	local _value = result.value
	local _target = result.target
	local _CFrame = result.CFrame
	local Success, Error = pcall(function()
		if _target ~= nil then
			local v, spwan = __getEnemiesByName({ target = _target })
			if v then
				if Module.IsAlive(v) then
					Module.Attack({
						target = v, 
						value = _value,
						function() 
							return not _value or (not RootPart and Character)
						end
					})
				else
					local targetCFrame = _CFrame or (spwan and spwan * CFrame.new(0, 100, 0))
					if targetCFrame then
						tp(targetCFrame, function() return not _value end)
					else
						warn("CFrame is nil")
					end
				end
			else
				warn("Enemy not found")
			end
		else
			local CloseEnemy
			for _, v in pairs(workspace.Enemies:GetChildren()) do
				local distance = (v.HumanoidRootPart.Position - RootPart.Position).Magnitude
				if distance <= 1000 and Module.IsAlive(v) then
					CloseEnemy = v
				end
			end
			if CloseEnemy then
				Module.Attack({ 
					target = CloseEnemy, 
					value = _value,
				})
			end
		end
	end)
	if not Success then 
		warn(" Attack Function Error : ", Error) 
	end
	if not Success then 
		warn("Attack Function Error : ", Error) 
	end
end

function dist(a,b,noHeight)
	if not b then
		b = RootPart.Position
	end
	return (Vector3.new(a.X,not noHeight and a.Y,a.Z) - Vector3.new(b.X,not noHeight and b.Y,b.Z)).magnitude
end

tp = function(Target, customCondition)

    local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')
    local Humanoid = Character:FindFirstChild('Humanoid')
    local ValueFrame = RootPart or HumanoidRootPart

    if not ValueFrame then return end


    local Distance = (Target.Position - ValueFrame.Position).Magnitude
    local SpeedX, SpeedZ = Target.Position.X - ValueFrame.Position.X, Target.Position.Z - ValueFrame.Position.Z
    local Percent, Factor = 60, 1.5
    local MoveX = SpeedX / (math.abs(SpeedZ) >= 5 * Percent and Factor or 1)
    local MoveZ = SpeedZ / (math.abs(SpeedX) >= 5 * Percent and Factor or 1)
    local condition = customCondition or function() return true end

    if not Character:FindFirstChild("PartTele") then
        local Root = Instance.new("Part", Character)
        Root.Size = Vector3.new(10, 1, 10)
        Root.Name = "PartTele"
        Root.Anchored = true
        Root.Transparency = 1
        Root.CanCollide = false
        Root.CFrame = ValueFrame.CFrame
        Root:GetPropertyChangedSignal("CFrame"):Connect(function()
            task.wait(0.01)
            ValueFrame.CFrame = Root.CFrame
        end)
    end
    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false    
        end
    end
    if not ValueFrame:FindFirstChild("BodyClip") then
        local Noclip = Instance.new("BodyVelocity")
        Noclip.Name = "BodyClip"
        Noclip.Parent = ValueFrame
        Noclip.MaxForce = Vector3.new(100000,100000,100000)
        Noclip.Velocity = Vector3.new(0,0,0)
    end

    if not Character:FindFirstChild("Highlight") then
        local Highlight = Instance.new("Highlight")
        Highlight.FillColor = Color3.new(171, 89, 161)
        Highlight.OutlineColor = Color3.new(255, 192, 203)
        Highlight.FillTransparency = 0.99999
        Highlight.Parent = Character
    end
    if Distance <= 10 then
        if Character:FindFirstChild('Highlight') then
            Character:FindFirstChild('Highlight'):Destroy()
        end
    end

	local recentlySpawn = 0
	local Dista,distm,middle = dist(Target.Position,nil,true),1/0,nil
	local CanTeleport = {
		{
			["Sky3"] = Vector3.new(-7894, 5547, -380),
			["Sky3Exit"] = Vector3.new(-4607, 874, -1667),
			["UnderWater"] = Vector3.new(61163, 11, 1819),
			["UnderwaterExit"] = Vector3.new(4050, -1, -1814),
		},
		{
			["Swan Mansion"] = Vector3.new(-390, 332, 673),
			["Swan Room"] = Vector3.new(2285, 15, 905),
			["Cursed Ship"] = Vector3.new(923, 126, 32852),
		},
		{
			["Floating Turtle"] = Vector3.new(-12462, 375, -7552),
			["Hydra Island"] = Vector3.new(5745, 610, -267),
			["Mansion"] = Vector3.new(-12462, 375, -7552),
			["Castle"] = Vector3.new(-5036, 315, -3179),
		}
	}
	if Character and ValueFrame and Dista >= 2000 and tick() - recentlySpawn > 5 then
		for i, v in pairs(CanTeleport[SeaIndex]) do
			local distance = dist(v, Target, true)
			if distance < dist(Target, nil, true) and distance < distm then
				distm, middle = distance, v
			end
		end
	end
    local partTele = Character.PartTele
    partTele.CFrame = CFrame.new(ValueFrame.Position.X, Target.Position.Y, ValueFrame.Position.Z)
    ValueFrame.CFrame = CFrame.new(ValueFrame.Position.X, Target.Position.Y, ValueFrame.Position.Z)
    local tween = game:GetService("TweenService"):Create(partTele, TweenInfo.new(Distance / 270, Enum.EasingStyle.Linear), {
        Position = Vector3.new(ValueFrame.Position.X + MoveX, Target.Position.Y, ValueFrame.Position.Z + MoveZ)
    })
    tween:Play()

    Humanoid:ChangeState(11)

    if _G['Bypass Tp'] and middle then
        if tween then tween:Cancel() wait(.2) end
        _C("requestEntrance", middle)
    end
end

function StopTween(Expression)
	if not Expression then
		_G['Stop Tween'] = true
		wait()
		tp(RootPart.CFrame)
		wait()
		Humanoid:ChangeState(14)
		if RootPart:FindFirstChild("BodyClip") then
			RootPart:FindFirstChild("BodyClip"):Destroy()
		end
		if Character:FindFirstChild("PartTele") then
			Character:FindFirstChild("PartTele"):Destroy()
		end
		_G['Stop Tween'] = false
	end
end


function Module.IsAlive(model)
	if not model then return false end
	local Humanoid = model:FindFirstChild("Humanoid")
	return Humanoid and Humanoid.Health > 0
end

function Equip(ToolSe)
	if not ToolSe then return end
	if not Character then return end
	if LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		wait(.4)
		Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild(ToolSe))
	end
end

function Module.Attack(params, customCondition)
	local targetProperties = {
		target = params.target,
		value = params.value or false,
		condition = customCondition or function() return true end
	}

	local v = targetProperties.target
	local value = targetProperties.value
	local condition = targetProperties.condition
	local Human = v:FindFirstChild("Humanoid")

	if not Human or Human.Health <= 0 then return end
	if not (RootPart or Humanoid) then return end

	repeats(value,0.02, function()
		local Tool = Character:FindFirstChildOfClass("Tool")
		if Tool then
			local toolProperties = {
				BlackLegLevel = Tool.Name == "Black Leg" and Tool.Level and Tool.Level.Value >= 150,
				DeathStepLevel = Tool.Name == "Death Step" and Tool.Level and Tool.Level.Value >= 400
			}
			if toolProperties.BlackLegLevel or toolProperties.DeathStepLevel then
				_key("V")
			end
		end
		PosMon = v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.CFrame
		tp(PosMon * CFrame.new(0, 30, 0), function() return not value end)
		if v then
			Human.JumpPower = 0
			Human.WalkSpeed = 0
			Human.Sit = true
			Human.RootPart.CanCollide = false
		end
		if _G['Bring Monster'] then
			BringMonster(_G['Bring Monster'], v)
		end
		Equip(_G.Select_Weapon)
	end,function() return not v.Parent or Human.Health <= 0 or condition() end)
end

function BringMonster(condition,Mob)
	for _, someone in pairs(game.Players:GetPlayers()) do
		if someone ~= LocalPlayer and someone.Character and someone.Character:FindFirstChild("HumanoidRootPart") then
			if (someone.Character.HumanoidRootPart.Position - RootPart.Position).Magnitude <= 225 then
				return
			end
		end
	end
	local count = 0
	for _, v in pairs(workspace.Enemies:GetChildren()) do
		if count >= 2 then break end
		if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Name == Mob.Name and Module.IsAlive(v) then
			local dists = (v.HumanoidRootPart.Position - RootPart.Position).Magnitude
			if dists <= 225 then
				v.HumanoidRootPart.CanCollide = false
				v.HumanoidRootPart.CFrame = PosMon
				if v:FindFirstChild("Head") then 
					v.Head.CanCollide = false 
				end
				v.Humanoid:ChangeState(11)
				sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
				count = count + 1
			end
		end
	end
end

-- [ Select Weapon ] 
task.spawn(function()
	repeats(true,.2, function()
		if _G.Select_Weapon == "Melee" then
			for i ,v in pairs(LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == "Melee" then
					if LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.Select_Weapon = v.Name
					end
				end
			end
		elseif _G.Select_Weapon == "Sword" then
			for i ,v in pairs(LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == "Sword" then
					if LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.Select_Weapon = v.Name
					end
				end
			end
		elseif _G.Select_Weapon == "Gun" then
			for i ,v in pairs(LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == "Gun" then
					if LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.Select_Weapon = v.Name
					end
				end
			end
		elseif _G.Select_Weapon == "Fruit" then
			for i ,v in pairs(LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == "Blox Fruit" then
					if LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.Select_Weapon = v.Name
					end
				end
			end
		elseif _G.Select_Weapon == nil then
			for i ,v in pairs(LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == "Melee" then
					if LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.Select_Weapon = v.Name
					end
				end
			end
		end
	end)
end)

for world, tasks in pairs({
	[World1] = {
		["Auto Pole V1"] = { 
			"Thunder God", 
			CFrame.new(-7748, 5606, -2305) 
		},
		["Auto Cannon"] = { 
			"Wysper", 
			CFrame.new(-7860, 5545, -380) 
		},
		["Auto Bizento V2"] = { 
			"Greybeard", 
			CFrame.new(-4914, 50, 4281) 
		}
	},
	[World2] = {
		["Auto Factory"] = { 
			"Core", 
			CFrame.new(448, 199, -441) 
		},
		["Auto Dragon Trident"] = { 
			"Tide Keeper", 
			CFrame.new(-3914, 123, -11516) 
		},
		["Auto Rengoku"] = { 
			{
				"Snow Lurker", 
				"Arctic Warrior", 
				"Awakened Ice Admiral"
			}, 
			CFrame.new(5439, 84, -6715) 
		},
		["Auto Dark Coat"] = { 
			"Darkbeard", 
			CFrame.new(3677, 62, -3144) 
		},
		["Auto Swan Glasses"] = { 
			"Don Swan", 
			"Swan Glasses" 
		},
		["Auto Ectoplasm"] = { 
			{
				"Ship Deckhand", 
				"Ship Engineer", 
				"Ship Steward", 
				"Ship Officer", 
				"Arctic Warrior"
			}, 
			nil 
		}
	},
	[World3] = {
		['Auto Pirate Raid'] = {
			nil,
			CFrame.new(-5545, 313, -2976),
		},
		["Auto Bone"] = { 
			{
				"Reborn Skeleton", 
				"Living Zombie", 
				"Demonic Soul", 
				"Posessed Mummy"
			}, 
			CFrame.new(-9504, 172, 6057) 
		},
		["Auto Dark Dagger"] = { 
			"rip_indra True Form", 
			CFrame.new(-5344, 423, -2725) 
		},
		["Auto Buddy"] = { 
			"Cake Queen", 
			CFrame.new(-776, 381, -11046) 
		},
		["Auto Cavander"] = { 
			"Beautiful Pirate", 
			nil 
		},
		["Auto Hallow Scythe"] = { 
			"Soul Reaper", 
			CFrame.new(-8932, 146, 6062) 
		},
		["Auto Twin hook"] = { 
			"Captain Elephant", 
			CFrame.new(-13348, 405, -8570) 
		},
		["Island Empress"] = {
			"Hydra Leader",
			CFrame.new(5801, 1079, -61)
		}
	}
	}) do
	for funcName, data in pairs(tasks) do
		Funcs[funcName] = function(Value)
			repeats(Value, .1, function()
				local target, CFrame = data[1], data[2]
				if type(target) == "table" then 
					target = table.concat(target, ", ")
				end
				CreateF({Callmethod = function()
					return CFrame and { 
						value = Value, 
						target = target, 
						CFrame = CFrame 
					} or { 
						value = Value, 
						target = target 
					}
				end})
			end, function() return not Value end)
		end
	end
end

task.spawn(function()
	repeats(true,.2,function() _C("SetSpawnPoint") end)
end)

task.spawn(function()
	repeats(true,.2,function()
		if not LocalPlayer.Character:FindFirstChild("HasBuso") then _C("Buso") end
	end)
end)

InSafeZone = function(player)
	local v = player.Character
	if v and v:FindFirstChild("Humanoid") then
		if v.Humanoid.Health > 0 and v.Humanoid.RootPart then
			for _,SafeZone in pairs(workspace._WorldOrigin.SafeZones:GetChildren()) do
				if (v.HumanoidRootPart.Position - SafeZone.Position).magnitude <= SafeZone.Mesh.Scale.X/2 then
					return true
				end
			end
		end
	end
end

do
	local LevelQuest = CheckQuest()[2]
	Funcs['Auto Farm Level'] = function(Value)
		repeats(Value,.2,function()
			local Level = LocalPlayer.Data.Level.Value
			local PlayerHuntCooldown = 0
			local PlayerHuntQuestCooldown = 0
			if _G['Auto Farm Fast'] and (Level >= 10 and Level <= 60) then
				CreateF({Callmethod = function ()
					return {value = Value, target = "God's Guard", CFrame = CFrame.new(-4837, 850, -1840), }
				end})
			else
				local LQuest = CheckQuest()
				local mon = string.gsub(string.gsub(string.gsub(QuestC.Container.QuestTitle.Title.Text, "^Defeat %d+ ", ""), " %(.-%)$", ""), "s$", "")
				if QuestC.Visible and string.find(QuestC.Container.QuestTitle.Title.Text, mon) then
					CreateF({Callmethod = function ()
						return {value = Value, target = mon, CFrame = nil, }
					end})
				else
					if dist(LQuest[4].Position, nil, true) < 5 then
						_C("StartQuest", LQuest[3], LevelQuest)
						if _G['Double Quest'] and LevelQuest == 2 then
							LevelQuest = 1
						elseif LevelQuest == 1 and LQuest[2] == 2 then
							LevelQuest = 2
						else
							LevelQuest = LQuest[2]
						end
					else
						tp(LQuest[4], function() return QuestC.Visible or not Value end)
					end
				end
				
			end
		end, function() return not Value end)
	end

	Funcs['Auto Farm Fast'] = function(Value)
		repeats(Value,.2,function()

		end,function() return not Value end)
	end

	Funcs['Auto Second Sea'] = function(Value)
		if not World1 then return end
		if LocalPlayer.Data.Level.Value < 700 or not World1 then return end
		repeats(Value,.2,function()
			if _G['Auto Farm Level'] then
				_G['Auto Farm Level'] = false
			end
			local IceDoor = game:GetService("Workspace").Map.Ice.Door
			if IceDoor.CanCollide and IceDoor.Transparency == 1 then
				if LocalPlayer.Backpack:FindFirstChild("Key") or Character:FindFirstChild("Key") then
					Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Key"))
					tp(CFrame.new(1347, 37, -1325), function() return not Value end)
				else
					tp(CFrame.new(4849, 5, 719), function() return not Value end)
				end
			else
				CreateF({Callmethod = function ()
					return {value = Value, target = "Ice Admiral", CFrame = CFrame.new(1347, 37, -1325), }
				end})
				repeats(Value,.2,function()
					_C("TravelDressrosa")
				end, function() return not game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") end)
			end
		end, function() return not Value end)
	end
	

	Funcs['Auto Third Sea'] = function(Value)
		if not World2 then return end
		repeats(Value,.2,function()
			local Level = LocalPlayer.Data.Level.Value
			if Level >= 1500 and World2 then
				if _C("BartiloQuestProgress", "Bartilo") == 3 then
					if _C("GetUnlockables").FlamingoAccess ~= nil then
						if _C("ZQuestProgress", "Check") == 0 then
							CreateF({Callmethod = function ()
								return {value = Value, target = "rip_indra", CFrame = nil, }
							end})
						elseif _C("ZQuestProgress", "Check") == 1 then
							_G['Auto Third Sea'] = false
						else
							_C("TravelZou")
							CreateF({Callmethod = function ()
								return {value = Value, target = "Don Swan", CFrame = CFrame.new(2207, 15, 883), }
							end})
						end
					else
						local FruitPrice, FruitStore = {}, {}
						for _,v in next, _C("GetFruits") do
							if v.Price >= 1000000 then  
								table.insert(FruitPrice, v.Name)
							end
						end
						-- ดึงผล
						for i,v in pairs(_C:InvokeServer("getInventoryFruits")) do
							for _,x in pairs(v) do
								if _ == "Name" then 
									table.insert(FruitStore, x) 
								end
							end
						end

						for _,y in pairs(FruitPrice) do
							for _,z in pairs(FruitStore) do
								if y == z and not _C("GetUnlockables").FlamingoAccess then
									_C("LoadFruit", y)
								end
							end
						end
						local player = LocalPlayer
						for _, tool in pairs(player.Backpack:GetDescendants()) do
							if tool:FindFirstChild("Fruit") then 
								if tool then
									Humanoid:EquipTool(tool.Name)
									wait(0.5)
									_C("TalkTrevor", "1")
									wait(0.5)
									_C("TalkTrevor", "2")
									wait(0.5)
									_C("TalkTrevor", "1")
									wait(0.5)
									_C("TalkTrevor", "3")
								end	
							end
						end
					end
				else
					if _C("BartiloQuestProgress","Bartilo") == 0 then
						if QuestC.Visible == true then
							CreateF({Callmethod = function ()
								return {value = Value, target = "Swan Pirate", CFrame = nil, }
							end})
						else
							tp(CFrame.new(-461, 72, 300),function() return not Value or QuestC.Visible == false end)
							if (CFrame.new(-461, 72, 300).Position - RootPart.Position).Magnitude <= 1 then _C("StartQuest", "BartiloQuest", 1) end
						end
					elseif  _C("BartiloQuestProgress","Bartilo") == 1 then
						CreateF({Callmethod = function ()
							return {value = Value, target = "Jeremy", CFrame = game:GetService("ReplicatedStorage")["Jeremy"].HumanoidRootPart.CFrame, }
						end})
					elseif  _C("BartiloQuestProgress","Bartilo") == 2 then
						tp(CFrame.new(-1830, 10, 1680),function() return not Value end)
						wait(0.7)
						RootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame
						wait(0.7)
						RootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame
						wait(0.7)
						RootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame
						wait(0.7)
						RootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame
						wait(0.7)
						RootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame
						wait(0.7)
						RootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame
						wait(0.7)
						RootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame
						wait(0.7)
						RootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame
						wait(0.7)
					end
				end
			end
		end, function() return not Value end)
	end

	Funcs['Auto Saber'] = function(Value)
		repeats(Value,.2,function()
			if LocalPlayer.Data.Level.Value >= 200 and workspace.Map.Jungle.Final.Part.Transparency == 0 then
				if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
					if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
						for i,v in next,game:GetService("Workspace").Map.Jungle.QuestPlates:GetChildren() do
							if v:IsA("Model") then
								if v.Button:FindFirstChild("TouchInterest") then
									firetouchinterest(RootPart, v.Button, 0)
								end
							end
						end
					else
						if not _C("ProQuestProgress")["UsedTorch"] then
							_C("ProQuestProgress","GetTorch")
							if LocalPlayer.Backpack:FindFirstChild("Torch") or Character:FindFirstChild("Torch") then
								Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Torch"))
							end
							_C("ProQuestProgress","DestroyTorch")
						elseif not _C("ProQuestProgress")["UsedCup"] then
							_C("ProQuestProgress","GetCup")
							if LocalPlayer.Backpack:FindFirstChild("Cup") or Character:FindFirstChild("Cup") then
								Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Cup"))
							end
							_C("ProQuestProgress","FillCup",Character.Cup)
							_C("ProQuestProgress","SickMan")
						elseif not _C("ProQuestProgress")["KilledMob"] then
							_C("ProQuestProgress","RichSon")
							CreateF({Callmethod = function ()
								return {value = Value, target = "Mob Leader", CFrame = nil, }
							end})
						elseif not _C("ProQuestProgress")["UsedRelic"] then
							_C("ProQuestProgress","RichSon")
							if LocalPlayer.Backpack:FindFirstChild("Relic") or Character:FindFirstChild("Relic") then
								Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Relic"))
							end
							_C("ProQuestProgress","PlaceRelic")
						end
					end
				else
					CreateF({Callmethod = function ()
						return {value = Value, target = "Saber Expert", CFrame = CFrame.new(-1459, 30, -50), }
					end})
				end
			end
		end, function() return not Value end)
	end

	Funcs['Auto Mob Aura'] = function(Value)
		repeats(Value,.2,function()
			CreateF({Callmethod = function ()
				return {value = Value, target = nil, CFrame = nil, }
			end})
		end, function() return not Value end)
	end

	Funcs['Auto Collection Berry'] = function(Value)
		repeats(Value, .1, function()
			local CollectionService = game:GetService('CollectionService')
			local BerryBush = CollectionService:GetTagged("BerryBush")
			for i = 1, #BerryBush do
				local Bush = BerryBush[i]
				tp(Bush:GetPivot())
			end
		end, function() return not Value end)
	end


	Funcs['Auto Cake Prince'] = function(Value)
		if not World3 then return end
		repeats(Value, .1, function()
			if string.find(_C("CakePrinceSpawner"), "Do you want to open the portal now?") then _C("CakePrinceSpawner") end
			if not game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
				if not game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
					CreateF({Callmethod = function ()
						return {
							value = Value, 
							target = {
								"Cookie Crafter",
								"Cake Guard",
								"Baking Staff",
								"Head Baker"
							}, 
							CFrame = CFrame.new(-2077, 252, -12373),
						}
					end})
				else
					tp(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2), function() return not Value end)
				end
			else
				CreateF({Callmethod = function ()
					return {value = Value, target = "Cake Prince", CFrame = game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame, }
				end})
			end
		end, function() return not Value end)
	end


	Funcs['Auto Elite Hunter'] = function(Value)
		if not World3 then return end
		repeats(Value, .1, function()
			local questTitle = QuestC.Container.QuestTitle.Title.Text
			local eliteCFrame = CFrame.new(-5418, 313, -2826)
			if QuestC.Visible then
				if not (LocalPlayer.Backpack:FindFirstChild("God's Chalice") and _G['Auto Stop WhenUntil GodChalice']) then
					if string.find(questTitle,"Diablo") or string.find(questTitle,"Deandre") or string.find(questTitle,"Urban") then
						local enemiesC
						if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
							enemiesC = game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame
						elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
							enemiesC = game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame
						elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
							enemiesC = game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame
						end
						CreateF({Callmethod = function ()
							return {
								value = Value, 
								target = {
									"Diablo",
									"Deandre",
									"Urban",
								}, 
								CFrame = enemiesC,
							}
						end})
					else
						if dist(eliteCFrame.Position, nil, false) < 2 then
							_C("EliteHunter")
						else
							tp(eliteCFrame, function() return not Value or QuestC.Visible end) 
						end
					end
				else
					tp(CFrame.new(-5074, 314, -2991), function() return not Value end) 
					_G['Auto Elite Hunter'] = false
				end
			else
				if dist(eliteCFrame.Position, nil, false) < 2 then
					_C("EliteHunter")
				else
					tp(eliteCFrame, function() return not Value or QuestC.Visible end) 
				end
			end
		end, function() return not Value end)
	end

	Funcs['Auto Musketeer Hat'] = function(Value)
		if not World3 then return end
		repeats(Value, .1, function()
			if LocalPlayer.Data.Level.Value >= 1800 then return end
			if _C("CitizenQuestProgress").KilledBandits == false then
				if QuestC.Visible == true then
					if string.find(QuestC.Container.QuestTitle.Title.Text, "Forest Pirate") then
						CreateF({Callmethod = function ()
							return {
								value = Value, 
								target = "Forest Pirate", 
								CFrame = nil,
							}
						end})
					else
						tp(CFrame.new(-12443, 332, -7675),function() return not Value end)
						if dist(CFrame.new(-12443, 332, -7675).Position, nil, true) <= 5 then 
							_C("StartQuest","CitizenQuest",1) 
						end
					end
				end
			elseif _C("CitizenQuestProgress").KilledBoss == false then
				if QuestC.Visible == true then
					if string.find(QuestC.Container.QuestTitle.Title.Text, "Captain Elephant") then
						CreateF({Callmethod = function ()
							return {
								value = Value, 
								target = "Captain Elephant",
								CFrame = CFrame.new(-13374, 421, -8225),
							}
						end})
					end
				else
					tp(CFrame.new(-12443, 332, -7675),function() return not Value end)
					if dist(CFrame.new(-12443, 332, -7675).Position, nil, true) <= 5 then 
						wait(1.5)_C("CitizenQuestProgress","Citizen") 
					end
				end
			elseif _C("CitizenQuestProgress","Citizen") == 2 then
				tp(CFrame.new(-12512, 340, -9872),function() return not Value end)
			end
		end, function() return not Value end)
	end


	Funcs['Auto Rainbow Haki'] = function(Value)
		if not World3 then return end
		repeats(Value, .1, function()
			local NameBoss
			local ListBossRainBow = {
				[1] = "Stone",
				[2] = "Hydra Island",
				[3] = "Kilo Admiral",
				[4] = "Captain Elephant",
				[5] = "Beautiful Pirate"
			}
			if QuestC.Visible == false then
				tp(CFrame.new(-11892, 930, -8760),function() return not Value end)
				if (CFrame.new(-11892, 930, -8760).Position - RootPart.Position).Magnitude <= 10 then wait(1.5)
					_C("HornedMan","Bet")
				end
			else
				if string.find(QuestC.Container.QuestTitle.Title.Text,'Stone') then
					NameBoss = ListBossRainBow[1]
				elseif string.find(QuestC.Container.QuestTitle.Title.Text,'Hydra Island') then
					NameBoss = ListBossRainBow[2]
				elseif string.find(QuestC.Container.QuestTitle.Title.Text,'Kilo Admiral') then
					NameBoss = ListBossRainBow[3]
				elseif string.find(QuestC.Container.QuestTitle.Title.Text,'Captain Elephant') then
					NameBoss = ListBossRainBow[4]
				elseif string.find(QuestC.Container.QuestTitle.Title.Text,'Beautiful Pirate') then
					NameBoss = ListBossRainBow[5]
				end
			end
			if QuestC.Visible then
				CreateF({Callmethod = function ()
					return {
						value = Value, 
						target = NameBoss, 
						game:GetService("ReplicatedStorage")[NameBoss].HumanoidRootPart.CFrame,
					}
				end})
			end
		end, function() return not Value end)
	end

	Funcs['Auto Farm Mirror Fractal'] = function(Value)
		if not World3 then return end
		repeats(Value, .1, function()
			if game:GetService("Workspace").Map.CakeLoaf:FindFirstChild("RedDoor") then
				if Character:FindFirstChild("Red Key") or LocalPlayer.Backpack:FindFirstChild("Red Key") then
					tp(CFrame.new(-2681, 64, -12853), function() return not Value end)
					wait(0.5)
					if LocalPlayer.Backpack:FindFirstChild("Red Key") then
						Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Red Key"))
					end
					wait(0.5)
				elseif game.Workspace:FindFirstChild("Enemies"):FindFirstChild("Dough King") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
					CreateF({Callmethod = function ()
						return {
							value = Value, 
							target = "Dough King",
							CFrame.new(-2151, 149, -12404),
						}
					end})
				elseif Character:FindFirstChild("Sweet Chalice") or LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") then
					if string.find(_C("CakePrinceSpawner"),"Do you want to open the portal now?") then
						_C("CakePrinceSpawner", true)
						_C("CakePrinceSpawner")
					else
						CreateF({Callmethod = function ()
							return {
								value = Value, 
								target = {
									"Cookie Crafter",
									"Cake Guard",
									"Baking Staff",
									"Head Baker",
								}, 
								CFrame.new(-2077, 252, -12373),
							}
						end})
					end
				elseif (LocalPlayer.Backpack:FindFirstChild("God's Chalice") or Character:FindFirstChild("God's Chalice")) and l.__GetMaterial("Conjured Cocoa") >= 10 then
					_C("SweetChaliceNpc")
				elseif not LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not Character:FindFirstChild("God's Chalice") then
					_G['Auto Elite Hunter'] = true
				else
					CreateF({Callmethod = function ()
						return {
							value = Value, 
							target = {
								"Candy Rebel",
								"Sweet Thief",
								"Chocolate Bar Battler",
								"Cocoa Warrior",
							}, 
							CFrame.new(620, 78, -12581),
						}
					end})
				end
			end
		end, function() return not Value end)
	end

	function CheckPirateBoat()
		local checkmmpb = {"PirateGrandBrigade", "PirateBrigade"}
		for r, v in next, game:GetService("Workspace").Enemies:GetChildren() do
			if table.find(checkmmpb, v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
				return v
			end
		end
	end

	Funcs['Auto Farm Sea Events'] = function(Value)
		repeats(Value, .1, function()
			if game:GetService("Workspace").Boats:FindFirstChild('PirateGrandBrigade') then
				if game:GetService("Workspace").Enemies:FindFirstChild("Shark") or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
					if Humanoid.Sit then Humanoid.Sit = false end
					CreateF({Callmethod = function ()
						return {
							value = Value, 
							target = {
								"Shark",
								"Terrorshark",
								"Piranha",
								"Fish Crew Member",
							}, 
							nil,
						}
					end})
				elseif CheckPirateBoat() then
					if Humanoid.Sit then Humanoid.Sit = false end
					game:GetService("VirtualInputManager"):SendKeyEvent(true,32,false,game)
					wait(.5)
					game:GetService("VirtualInputManager"):SendKeyEvent(false,32,false,game)
					local v = CheckPirateBoat()
					if v then
						tp(v.Engine.CFrame * CFrame.new(0, -20, 0))
						if dist(v.Engine.CFrame.Position,nil,true) < 30 then
							AutoSkills("Sea",function()
								return not v or not v.Parent or v.Health.Value <= 0 or not CheckPirateBoat()
							end)
						end
					end
				elseif game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
					for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
						if v:FindFirstChild("HumanoidRootPart") then
							repeats(Value, .5, function()
								tp(v.HumanoidRootPart.CFrame * CFrame.new(0,300,0),function()
									return not Value
								end)
								AutoSkills("Sea",function()
									return not v:FindFirstChild("HumanoidRootPart") or not Value
								end)
							end , function() return not Value or v:FindFirstChild("HumanoidRootPart") end)
						end
					end
				else
					local zones = { 
						[1] = CFrame.new(-21227, 22, 4047),
						[2] = CFrame.new(-24237, 22, 6381),
						[3] = CFrame.new(-27105, 22, 8959),
						[4] = CFrame.new(-29350, 22, 11744),
						[5] = CFrame.new(-32404, 22, 16208),
						[6] = CFrame.new(-35611, 22, 20548),
					}
					local selectedZone = zones[tonumber(_G['Select Zones'])]
					if selectedZone then
						game:GetService("Workspace").Boats['PirateGrandBrigade'].VehicleSeat.CFrame = selectedZone
						if Character:WaitForChild("Humanoid").Sit == false then
							tp(game:GetService("Workspace").Boats['PirateGrandBrigade'].VehicleSeat.CFrame * CFrame.new(0, 3, 0), function() 
								return not Value or game:GetService("Workspace").Enemies:FindFirstChild("Shark") or 
									game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or 
									game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or 
									game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
							end)
						end
					end
				end
			elseif not game:GetService("Workspace").Boats:FindFirstChild('PirateGrandBrigade') then
				local distance = (CFrame.new(-16205, 12, 473).Position - RootPart.Position).Magnitude
				if distance <= 10 then
					local args = {
						[1] = "BuyBoat",
						[2] = "PirateGrandBrigade"
					}
					local success, err = pcall(function()
						_C(unpack(args))
					end)
					task.wait(4)
				end
				tp(CFrame.new(-16205, 12, 473), function() return (CFrame.new(-16205, 12, 473).Position - RootPart.Position).Magnitude <= 10 end)
			end
		end, function() return not Value end)
	end

	local WorldInfo = {
		World1 = {"Galley Captain", CFrame.new(5658, 38, 4928)},
		World2 = {"Lava Pirate", CFrame.new(-5431, 15, -5296)},
		World3 = {"Ice Cream Chef", CFrame.new(-872.25, 65.82, -10919.96)}
	}

	local Mon_Observation, CFrame_Mon_Observation

	if World1 or World2 or World3 then
		local worldKey = World1 and "World1" or (World2 and "World2" or "World3")
		Mon_Observation, CFrame_Mon_Observation = unpack(WorldInfo[worldKey])
	else
		Mon_Observation, CFrame_Mon_Observation = "Unknown", CFrame.new(0, 0, 0)
	end

	Funcs['Auto Observation'] = function(Value)
		repeats(Value, .1, function()
			local enemy = game:GetService('Workspace').Enemies:FindFirstChild(Mon_Observation)
			if enemy then
				local v, spwan = __getEnemiesByName({ target = Mon_Observation })
				repeats(Value, .1, function()
					local targetCFrame = enemy.HumanoidRootPart.CFrame * (LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and CFrame.new(3, 0, 0) or CFrame.new(0, 50, 0))
					tp(targetCFrame, function() return not Value end)
					if not LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
						game:GetService('VirtualUser'):CaptureController()
						game:GetService('VirtualUser'):SetKeyDown('0x65')
						wait(5)
						game:GetService('VirtualUser'):SetKeyUp('0x65')
					end
				end, function() return not Value or not enemy.Parent end)
			else
				tp(CFrame_Mon_Observation, function() return not Value end)
			end
		end, function() return not Value end)
	end

	Funcs['Teleport To Island'] = function(Value)
		repeats(Value, .1, function()
			local TargetTeleport
			for i,v in pairs(workspace.Map:GetChildren()) do
				if v.Name == _G['Select Island'] then
					TargetTeleport = v.WorldPivot
					break
				end
			end
			tp(TargetTeleport * CFrame.new(0, 200, 0), function() return not Value end)
		end, function() return not Value end)
	end

	Funcs['Use Fruit Buy'] = function(Value)
		repeats(Value, .1, function()
			local FruitPrice = {}
			local FruitStore = {}
			for i,v in next,_C("GetFruits") do
				if v.Price <= 500000 then  
					table.insert(FruitPrice,v.Name)
				end
			end
			for i,v in pairs(_C("getInventoryFruits")) do
				for _,x in pairs(v) do
					if _ == "Name" then 
						table.insert(FruitStore,x)
					end
				end
			end
			for _,y in pairs(FruitPrice) do
				for _,z in pairs(FruitStore) do
					if y == z then
						for _, tool in pairs(LocalPlayer.Backpack:GetDescendants()) do
							if tool:FindFirstChild("Fruit") then
							else
								_C("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
								_C("LoadFruit",tostring(y))
							end
						end
					end
				end 
			end
		end, function() return not Value end)
	end
	
	Funcs['Auto Clear Raid'] = function(Value)
		repeats(Value, .1, function()
			if _G['Join Raid'] then
				local locations = game:GetService("Workspace")["_WorldOrigin"].Locations
				for i,enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if (enemy.HumanoidRootPart.Position - RootPart.Position).Magnitude <= 1000 then
						if Module.IsAlive(enemy) then
							local v = enemy
							tp(v.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0),function() return not Value end)
							local Human = v:FindFirstChildOfClass("Humanoid")
							local distance = (v.HumanoidRootPart.CFrame.Position - RootPart.Position).Magnitude
							if Human.Health > 0 and distance <= 40 then 
								Human.Health = 1
								Human.Health = 0
							end
						else
							for islands = 5, 1, -1 do
								local island = locations:FindFirstChild("Island " .. islands)
								if island then 
									tp(island.CFrame * CFrame.new(0, 100, 0), function() return not Value end) break 
								end
							end
						end
					end
				end
			end
		end, function() return not Value end)
	end
	
	Funcs['Auto Start Raid'] = function(Value)
		repeats(Value, .1, function()
			local locations = game:GetService("Workspace")["_WorldOrigin"].Locations
			if not locations:FindFirstChild("Island 1")  then
				if LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
					if not _G['Join Raid'] then
						if World2 then
							wait(1.5)
							fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
							wait(5)
							_G['Join Raid'] = true
							wait(1.2)
							if _G['Join Raid'] then _G['Join Raid'] = false end
						elseif World3 then
							wait(1.5)
							fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
							wait(5)
							_G['Join Raid'] = true
							wait(1.2)
							if _G['Join Raid'] then _G['Join Raid'] = false end
						end
					end
				end
			end
		end, function() return not Value end)
	end
	
	Funcs['Auto Awaken'] = function(Value)
		repeats(Value, .1, function()
			_C("Awakener","Check")
			_C("Awakener","Awaken")
		end, function() return not Value end)
	end

	Funcs['Auto Lock To Full Moon'] = function(value)
		repeats(value, .1, function()
			local moonDir = game.Lighting:GetMoonDirection()
			local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
			game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
		end, function() return not value end)
	end
	
	Funcs['Auto Teleport To Mirage Island'] = function(value)
		repeats(value, .1, function()
			if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
				tp(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position))
			end
		end, function() return not value end)
	end

	Funcs['Auto Mirage Island'] = function(value)
		if not World3 then return end
		repeats(value, .1, function()
			if game:GetService("Workspace").Boats:FindFirstChild('PirateGrandBrigade') then
				game:GetService("Workspace").Boats['PirateGrandBrigade'].VehicleSeat.CFrame = CFrame.new(-5100, 29, -6792)
				if Humanoid.Sit then
					if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
						if Humanoid.Sit then Humanoid.Sit = false end
						tp(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z))
					else
						repeats(value, .1, function()
							_key("W")
							wait(10)
							_key("S")
							wait(1.5)
						end, function() return not value or game:GetService("Workspace").Map:FindFirstChild("MysticIsland") end)
					end
				else
					tp(game:GetService("Workspace").Boats['PirateGrandBrigade'].VehicleSeat.CFrame * CFrame.new(0, 1, 0), function() 
						return not value or Humanoid.Sit
					end)
				end
			elseif not game:GetService("Workspace").Boats:FindFirstChild('PirateGrandBrigade') then
				local distance = (CFrame.new(-16205, 12, 473).Position - RootPart.Position).Magnitude
				if distance <= 10 then
					local success, err = pcall(function()
						_C("BuyBoat","PirateGrandBrigade")
					end)
					task.wait(4)
				end
				tp(CFrame.new(-16205, 12, 473), function() return (CFrame.new(-16205, 12, 473).Position - RootPart.Position).Magnitude <= 10 end)
			end
		end, function() return not value end)
	end

	Funcs['Auto AncientOne Quest'] = function(value)
		if not World3 then return end
		repeats(value, .1, function()
			local raceUpgradeResult = _C("UpgradeRace", "Buy")
			if raceUpgradeResult ~= true then
				local raceEnergy = Character:FindFirstChild("RaceEnergy")
				local raceTransformed = Character:FindFirstChild("RaceTransformed")
				if raceEnergy.Value < 1 and not raceTransformed.Value then
					if _G['Auto Active Ability'] then
						_G['Auto Active Ability'] = false
					end
					CreateF({Callmethod = function ()
						return {
							value = value, 
							target = {
								"Reborn Skeleton",
								"Living Zombie",
								"Demonic Soul",
								"Posessed Mummy",
							}, 
							CFrame.new(-9479, 200, 5577),
						}
					end})
				else
					game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
					task.wait()
					game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
					_C("UpgradeRace", "Check")
					_C("UpgradeRace", "Buy")
				end
			end
		end, function() return not value end)
	end

	Funcs['Auto Complete Trial'] = function(value)
		repeats(value, .1, function()
			if LocalPlayer.Data.Race.Value == "Mink" then	
				if game:GetService("Workspace").Map:FindFirstChild("MinkTrial") then
					if (game:GetService("Workspace").Map.MinkTrial.Ceiling.CFrame - RootPart.Position).Magnitude <= 200 then
						tp(game:GetService("Workspace").Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-20,0), function() return not value end)
					end
				end
			elseif LocalPlayer.Data.Race.Value == "Human" then
				if game:GetService("Workspace").Map:FindFirstChild("HumanTrial") then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if (v.HumanoidRootPart.Position - RootPart.Position).magnitude <= 400 then
							if Module.IsAlive(v) then
								Module.Attack({ target = v, value = value,function() return not value end})
							end
						end
					end
				end
			elseif LocalPlayer.Data.Race.Value == "Cyborg" then
				if game:GetService("Workspace").Map:FindFirstChild("CybrogTrial") then
					tp(game:GetService("Workspace").Map.CyborgTrial.Floor.CFrame*CFrame.new(0,500,0), function() return not value end)
				end
			elseif LocalPlayer.Data.Race.Value == "Skypiea" then
				if game:GetService("Workspace").Map:FindFirstChild("SkyTrial") then
					if (game:GetService("Workspace").Map.SkyTrial.Model.FinishPart.CFrame-RootPart.Position).Magnitude <= 750 then
						tp(game:GetService("Workspace").Map.SkyTrial.Model.FinishPart.CFrame, function() return not value end)
					end
				end
			elseif LocalPlayer.Data.Race.Value == "Ghoul" then
				if game:GetService("Workspace").Map:FindFirstChild("GhoulTrial") then 
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if (v.HumanoidRootPart.Position-game:GetService("Players").RootPart.Position).magnitude <= 400 then
							if Module.IsAlive(v) then
								Module.Attack({ target = v, value = value,function() return not value end})
							end
						end
					end
				end
			elseif LocalPlayer.Data.Race.Value == "Fishman" then
				if game:GetService("Workspace").Map:FindFirstChild("FishTrial") then
					if (game:GetService("Workspace").Map:FindFirstChild("FishTrial").Part.Position-RootPart.Position).Magnitude <= 500 then
						tp(CFrame.new(25032.043, 75.04647064, 12619.5967), function() return not value end)
						AutoSkills("Sea",function()
							return not game:GetService("Workspace").Map:FindFirstChild("FishTrial").Part
						end)
					end
				end
			end
		end, function() return not value end)
	end

	Funcs['Teleport To Gear'] = function(value)
		if not World3 then return end
		repeats(value, .1, function()
			for i,v in pairs(game:GetService("Workspace").Map:FindFirstChild('MysticIsland'):GetChildren()) do
				if v.Name == 'Part' then
					if v.ClassName == 'MeshPart' then
						tp(v.CFrame , function() 
							return not value
						end)
						v.Transparency = 0
					end
				end
			end
		end, function() return not value end)
	end

	function Check_Race_Skypiea()
		for i,v in pairs(game.Players:GetChildren()) do
			if v.Name ~= LocalPlayer.Name and tostring(v.Data.Race.Value) == "Skypiea" then
				print(v.Name)
				_G.Select_Player = v.Name
				return
			end
		end
	end

	Funcs['Teleport To Trial Door'] = function(value)
		if not World3 then return end
		repeats(value, .1, function()
			if LocalPlayer.Data.Race.Value == "Mink" then
				tp(game:GetService("Workspace").Map["Temple of Time"].MinkCorridor.Door.Entrance.CFrame , function() 
					return not value
				end)
			elseif LocalPlayer.Data.Race.Value == "Fishman" then
				tp(game:GetService("Workspace").Map["Temple of Time"].FishmanCorridor.Door.Entrance.CFrame , function() 
					return not value
				end)
			elseif LocalPlayer.Data.Race.Value == "Skypiea" then
				tp(game:GetService("Workspace").Map["Temple of Time"].SkyCorridor.Door.Entrance.CFrame , function() 
					return not value
				end)
			elseif LocalPlayer.Data.Race.Value == "Human" then
				tp(game:GetService("Workspace").Map["Temple of Time"].HumanCorridor.Door.Entrance.CFrame , function() 
					return not value
				end)
			elseif LocalPlayer.Data.Race.Value == "Ghoul" then
				tp(game:GetService("Workspace").Map["Temple of Time"].GhoulCorridor.Door.Entrance.CFrame , function() 
					return not value
				end)
			elseif LocalPlayer.Data.Race.Value == "Cybrog" then
				tp(game:GetService("Workspace").Map["Temple of Time"].CybrogCorridor.Door.Entrance.CFrame , function() 
					return not value
				end)
			end
		end, function() return not value end)
	end
	
	Funcs['Auto Pull Lever'] = function(value)
		repeats(value, .1, function()
			if _C("CheckTempleDoor") then
				fireproximityprompt(game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt.ProximityPrompt, math.huge)
			end
		end, function() return not value end)
	end
	
	Funcs['Auto Evolution Race V2'] = function(value)
		if not World2 then return end
		repeats(value, .1, function()
			if not LocalPlayer.Data.Race:FindFirstChild("Evolved") then
				_C("Alchemist", "1")
				local step = _C("Alchemist", "1")
				if step == 0 then
					local targetPos = CFrame.new(-2779, 72, -3574)
					tp(targetPos, function() return not value end)
					if (targetPos - RootPart.Position).Magnitude <= 2 then 
						_C("Alchemist","2")
					end
				elseif step == 1 then
					local flowers = {"Flower 1", "Flower 2", "Flower 3"}
					for i, flower in ipairs(flowers) do
						if not (LocalPlayer.Backpack:FindFirstChild(flower) and Character:FindFirstChild(flower)) then
							if i < 3 then 
								tp(game:GetService("Workspace")["Flower" .. i].CFrame, function() return not value end) 
							elseif i == 3 then 
								CreateF({Callmethod = function ()
									return {value = value, target = "Zombie", CFrame.new(-5685, 48, -853),}
								end})
							end
							break
						end
					end
				elseif step == 2 then _C("Alchemist", "3") end
			end
		end, function() return not value end)
	end

	Funcs['Spectator Player'] = function(value)
		if value then
			if game:GetService('Players'):FindFirstChild(_G['Select Player']) then
				game:GetService('Workspace').Camera.CameraSubject = game:GetService('Players'):FindFirstChild(_G['Select Player']).Character.Humanoid
			end
		else
			game:GetService('Workspace').Camera.CameraSubject = Humanoid
		end
	end

	Funcs['Teleport To Player'] = function(value)
		repeats(value, .1, function()
			tp(game.Players:FindFirstChild(_G['Select Player']).Character.HumanoidRootPart.CFrame,function() return not value end)
		end, function() return not value end)
	end
	
	Funcs['Auto Evolution Race V3'] = function(value)
		repeats(value, .1, function()
			if _C("TalkTrevor","1") == 0 then
				local step = _C('Wenlocktoad','1')
				if step == 0 then
					_C('Wenlocktoad','1')
				elseif step == 1 then
					if LocalPlayer.Data.Race.Value == "Mink" then	
						for _, v in pairs(workspace.ChestModels:GetChildren()) do
							if v:IsA("Model") then
								local cframe = v:GetBoundingBox()
								repeat
									task.wait(0.1)
									tp(cframe, function() return not value end)
								until dist(cframe, nil, true) < 1
							end
						end
						repeat wait(5) until _C("Wenlocktoad", "1") == -2
						_C("Wenlocktoad", "3")
					elseif LocalPlayer.Data.Race.Value == "Human" then
						local Bosses = {
							{ name = "Diamond", position = CFrame.new(-1636, 198, -16) },
							{ name = "Jeremy", position = CFrame.new(-3352, 324, -10534) },
							{ name = "Fajite", position = CFrame.new(-3352, 324, -10534) }
						}
						local Boss = 1
						local enemyFound = false
						local bossesKilled = 0
						for _, boss in ipairs(Bosses) do
							local enemy = __getEnemiesByName({ target = boss.name })
							if Module.IsAlive(enemy) then
								Module.Attack({ target = enemy, value = value, function() return not value end })
								enemyFound = true
							end
							if not enemyFound then
								tp(boss.position, function() return not value end)
							else
								bossesKilled = bossesKilled + 1
							end
						end
						repeat wait(5)
							_C("Wenlocktoad", "3")
						until _C("Wenlocktoad","1") == -2
					elseif LocalPlayer.Data.Race.Value == "Cyborg" then
						return
					elseif LocalPlayer.Data.Race.Value == "Skypiea" then
						return
					elseif LocalPlayer.Data.Race.Value == "Ghoul" then
						return
					elseif LocalPlayer.Data.Race.Value == "Fishman" then
						return
					end
				elseif step == 2 then
					_C('Wenlocktoad','2')
				end
			end
		end, function() return not value end)
	end
	
	Funcs['Auto Collect Fire Flowers'] = function(condition)
		if not World3 then return end
		repeats(condition,.2,function()
			local Net = game:GetService("ReplicatedStorage")
			local result = Net.Modules.Net["RF/InteractDragonQuest"]:InvokeServer({ 
				NPC = "Dragon Wizard", Command = "Speak" 
			})
			if type(result) == "table" then
				CreateF({Callmethod = function ()
					return {value = condition, target = "Forest Pirate", nil}
				end})
			else
				if dist(CFrame.new(5771, 1208, 804), nil, true) <= 5 then 
					Net.Modules.Net["RF/InteractDragonQuest"]:InvokeServer({ NPC = "Dragon Wizard", Command = "Speak" })
				end
				tp(CFrame.new(5771, 1208, 804), function() return not condition end)
			end
		end, function() return not condition end)
	end

	Funcs['Auto Superhuman'] = function(value)
		repeats(value,.2,function()
			if LocalPlayer.Backpack:FindFirstChild("Combat") or Character:FindFirstChild("Combat") then
				_C("BuyElectro")
			end
			if LocalPlayer.Backpack:FindFirstChild("Electro") and LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
				_C("BuyBlackLeg")
			end
			if Character:FindFirstChild("Electro") and Character:FindFirstChild("Electro").Level.Value >= 300 then
				_C("BuyBlackLeg")
			end
			if LocalPlayer.Backpack:FindFirstChild("Black Leg") and LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
				_C("BuyFishmanKarate")
			end
			if Character:FindFirstChild("Black Leg") and Character:FindFirstChild("Black Leg").Level.Value >= 300 then
				_C("BuyFishmanKarate")
			end
			if Character:FindFirstChild("Fishman Karate") and Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
				if LocalPlayer.Data.Fragments.Value <= 1500 then
					if LocalPlayer.Data.Level.Value >= 1100 then
						_G['Auto Farm Level'] = false
						if not _G['Auto Farm Level'] then
							if not _G['Use Fruit Buy'] then
								_G['Use Fruit Buy'] = true
							end
							if not _G['Auto Start Raid'] then
								_G['Auto Start Raid'] = true
							end
							wait(5)
							if not _G['Auto Clear Raid'] then
								_G['Auto Clear Raid'] = true
							end
						end
					end
				else
					if _G['Use Fruit Buy'] then
						_G['Use Fruit Buy'] = false
					end
					if _G['Auto Start Raid'] then 
						_G['Auto Start Raid'] = false
					end
					if _G['Auto Clear Raid'] then
						_G['Auto Clear Raid'] = false
					end
				end
			end
			if Character:FindFirstChild("Fishman Karate") and Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
				_C("BlackbeardReward","DragonClaw","1")
				_C("BlackbeardReward","DragonClaw","2")
			end
			if Character:FindFirstChild("Dragon Claw") and Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
				_C("BuySuperhuman")
			end
			if _C("BuySuperhuman",true) == 1 then
				_G['Auto Superhuman'] = false
			end
		end, function() return not value end)
	end

	Funcs['Auto DeathStep'] = function(value)
		repeats(value,.2,function()
            local UsedKey = _C("OpenLibrary")
			if not UsedKey and LocalPlayer.Backpack:FindFirstChild("Black Leg") and LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
				UsedKey = _C("OpenLibrary")
				CreateF({Callmethod = function ()
					return {value = value, target = {
						"Snow Lurker", 
						"Arctic Warrior", 
						"Awakened Ice Admiral"
					}, CFrame.new(5439, 84, -6715) }
				end})
				if _hasItem("Library Key") then
					UsedKey = _C("OpenLibrary")
				end
			elseif UsedKey then 
				if LocalPlayer.Data.Beli.Value >= 2500000 then
					if LocalPlayer.Data.Fragments.Value >= 5000 then
						_C("BuyDeathStep")
					end
				end
			elseif LocalPlayer.Backpack:FindFirstChild("Black Leg") and LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value < 400 then
				if not _G['Auto Farm Level'] then
					CreateF({Callmethod = function ()
						return {value = value, target = {
							"Snow Lurker", 
							"Arctic Warrior", 
							"Awakened Ice Admiral"
						}, CFrame.new(5439, 84, -6715) }
					end})
				end
			else
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
			end
		end, function() return not value end)
	end

	Funcs['Auto SharkmanKarate'] = function(value)
		repeats(value,.2,function() 
			if Character:FindFirstChild("Fishman Karate") and Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
				if string.find(_C("BuySharkmanKarate"), "keys") then
					if _hasItem("Water Key") then
						tp(CFrame.new(-2604.6958, 239.432526, -10315), function() return not value end)
						if LocalPlayer.Backpack:FindFirstChild("Water Key") or Character:FindFirstChild("Water Key") then
							Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Water Key"))
						end
					end
					if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper") or game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
						CreateF({Callmethod = function ()
							return {value = value, target = "Tide Keeper", CFrame.new(-3570, 123, -11555) }
						end})
					end
				else 
					if LocalPlayer.Data.Beli.Value >= 2500000 then
						if LocalPlayer.Data.Fragments.Value >= 5000 then
							_C("BuySharkmanKarate")
						end
					end
				end
			elseif Character:FindFirstChild("Fishman Karate") and Character:FindFirstChild("Fishman Karate").Level.Value < 400 then
				CreateF({Callmethod = function ()
					return {value = value, target = {"Water Fighter", "Sea Soldier", }, nil}
				end})
			else
				_C("BuyFishmanKarate")
			end
		end, function() return not value end)
	end

	Funcs['Auto Electric Claw'] = function(value)
		repeats(value,.2,function() 
			if Character:FindFirstChild("Electro") and Character:FindFirstChild("Electro").Level.Value >= 400 then
				if _C("BuyElectricClaw",true) ~= 4 then
					if LocalPlayer.Data.Fragments.Value >= 5000 and not _G['Join Raid'] then
						if LocalPlayer.Data.Beli.Value >= tonumber("3e+6") then
							_C("BuyElectricClaw")
							wait(.3)
							_G['Auto Electric Claw'] = false
						end
					end
				else
					_C("BuyElectricClaw","Start")
					_C("requestEntrance",Vector3.new(-12462, 375, -7552))
				end
			elseif Character:FindFirstChild("Electro") and Character:FindFirstChild("Electro").Level.Value < 400 then
				CreateF({Callmethod = function ()
					return {value = value, target = {"Forest Pirate", "Mythological Pirate", }, nil}
				end})
			else
				_C("BuyElectro")
			end
		end, function() return not value end)
	end
	
end

local UIS = game:GetService("UserInputService")
local platform = UIS.TouchEnabled and "Mobile" or UIS.KeyboardEnabled and "PC" or UIS.GamepadEnabled and "Console" or "Unknown"

local Windown = library.Create({
	Title = "Aqua Hub | Blox Fruit",
	Logo = 76541647954251,
	CornerRadius = 5,
	UISize = { X = 600, Y = 400 },
	UIColor = {
		['Shadow'] = Color3.fromRGB(0, 40, 60),
		['MainBackground'] = Color3.fromRGB(10, 60, 80),
		['Background2'] = Color3.fromRGB(20, 90, 110),
		['ToggleO'] = Color3.fromRGB(0, 200, 180),
		['TapButtonColor'] = Color3.fromRGB(200, 255, 255),
		['DropDownSelect'] = Color3.fromRGB(0, 170, 200),
		['TextColor'] = Color3.fromRGB(220, 255, 255)
	}
})

local Tap_Home = Windown.CreateTap({Title = "General",Icon = 15169955786})
local Tap_Automatic = Windown.CreateTap({Title = "Farm",Icon = "code"})

function Page(Section,side)
	if side == 1 then
		side = "Left"
	elseif side == 2 then
		side = "Right"	
	end
	return Section.CreatePage({ Side = side, })
end

function Label(options, side)
	local Section = options.Section
	local Title = options.Title
	return Section.CreateLable({ Name = Title })
end

function Toggle(Section, side, options, CallBack, SettingName)
	local Title, Description = options.Title, options.Description
	local tasks
	if type(CallBack) == "string" then
		if not SettingName then SettingName = CallBack end
		CallBack = nil
	end
	if not SettingName then SettingName = Title end
	return Section.CreateToggle({Name = Title,Dis = Description,Value = _G[SettingName] or false,Callback = function(Value)
		_G[SettingName] = Value
        if Value then
            tasks = task.spawn(function()
                if Funcs[SettingName] then
                    Funcs[SettingName](_G[SettingName])
                end
            end)
        end
		if not Value then 
			StopTween(_G[SettingName])
			task.cancel(tasks)
		end
	end,})
end

function Dropdown(Section, Multi, options, setting)
	local Title,Description = options.Title, options.Description
	local Value , Callback = setting.Values or {} , setting.Callback
	return Section.CreateDropdown({Name = Title,Value = Value and Value[1] or nil,List = Value,Callback = Callback or function() 
		return true 
	end,})
end

function Slider(Section, options, setting)
	local Title,Description = options.Title, options.Description
	local Max, Min , Value = setting.Max , setting.Min , setting.Rounding or 1
	local Callback = setting.Callback
	return Section.CreateSlider({Name = Title,Max = Max,Min = Min, Value = Value,Format = Callback or function() 
		return true 
	end,})
end

function Button(Section,side, Title, params, CallBack)
	local callback = CallBack or function() return true end
	local description, content = params.Description or "Very important button" ,  params.Content or "Are you sure you want to proceed?"
	return Section.CreateButton({Name = Title,Callback = callback or function() 
		return true
	end,})
end

local Page_General = Page(Tap_Home,1) do
	Label({ Section = Page_General, Title = "Main" },1)

	Toggle(Page_General,.2, {Title = "Auto Farm [Level]",Description = "ฟาร์มเลเวลจน ถึง 1-2600 Max"}, "Auto Farm Level")

	Toggle(Page_General,.2, {Title = "Auto Mob Aura",Description = "ตีมอนรอบเกาะ"}, "Auto Mob Aura")	

	Label({ Section = Page_General, Title = "Fighting Style" },1)
	Toggle(Page_General,.2, {Title = "Auto Superhuman",Description = "ออโต้ทำหมัด ซุป"}, "Auto Superhuman")
	Toggle(Page_General,.2, {Title = "Auto Death Step",Description = "ออโต้ทำขาไฟ วีสอง"}, "Auto DeathStep")

	Label({ Section = Page_General, Title = "Unlock World" },1)
	Toggle(Page_General,.2, {Title = "Auto Second Sea",Description = "ออโต้ ปลดล็อคโลก 2 "}, "Auto Second Sea")
	Toggle(Page_General,.2, {Title = "Auto Third Sea",Description = "ออโต้ ปลดล็อคโลก 3 "}, "Auto Third Sea")

	Label({ Section = Page_General, Title = "Boss" })
	local bossNames = {"The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader", "Vice Admiral", "Warden",
	"Chief Warden", "Swan", "Saber Expert", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God",
	"Cyborg", "Greybeard", "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral",
	"Awakened Ice Admiral", "Tide Keeper", "Order", "Darkbeard", "Cursed Captain", "Stone",
	"Island Empress", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Longma", "Cake Queen",
	"Soul Reaper", "Rip_Indra", "Cake Prince", "Dough King"}

	local BossTable = {}

	local function UpdateBossTable()
		table.clear(BossTable)
		for _, bossName in pairs(bossNames) do
			if game:GetService("ReplicatedStorage"):FindFirstChild(bossName) then
				table.insert(BossTable, bossName)
			end
		end
	end

	UpdateBossTable()

	local Select_Boss = Dropdown(Page_General, false, {
		Title = "Select Boss",
		Description = "เลือกบอส",
	}, {
		Values = BossTable,
		Default = BossTable[1],
		Callback = function(Value)
			_G['Select Boss'] = Value
		end,
	})

	task.spawn(function()
		local previousTable = {}
		repeat
			UpdateBossTable()
			if #BossTable ~= #previousTable then
				previousTable = {unpack(BossTable)}
				Select_Boss:SetValues(BossTable)
			end
			task.wait(1)
		until false
	end)


	Toggle(Page_General,.2, {Title = "Auto Farm Boss",Description = "ออโต้ ฟาร์มบอส"}, "Auto Farm Boss")
	Funcs['Auto Farm Boss'] = function(condition) 
		repeats(condition, .1, function()
			local v, spwan = __getEnemiesByName({ target = _G['Select Boss'] })
			if Module.IsAlive(v) then
				Module.Attack({
					target = v, 
					value = condition,
					function() 
						return not condition or (not RootPart and Character)
					end
				})
			else
				tp(game:GetService("ReplicatedStorage")[_G['Select Boss']].HumanoidRootPart.CFrame, function() return not condition end)
			end
		end, function() return not condition end)
	end
end

local Page_Setting = Page(Tap_Home,2) do
	Label({ Section = Page_Setting, Title = "Setting" },1)
	Dropdown(Page_Setting,false, {
		Title = "Select Weapon",
		Description = "เลือกอาวุธ",
	}, {
		Values = {"Melee", "Sword", "Gun", "Fruit"},
		Default = "Melee",
		Callback = function(Value)
			_G.Select_Weapon = Value
		end,
	})
	_G['Fast Attack'] = true
	Toggle(Page_Setting,2, {Title = "Fast Attack ",Description = "ตีเร็ว"}, "Fast Attack")
	_G['Double Quest'] = true
	Toggle(Page_Setting,2, {Title = "Double Quest",Description = "รับเควสคู่"}, "Double Quest")
	_G['Bypass Tp'] = true
	Toggle(Page_Setting,2, {Title = "Bypass Tp",Description = "บายพาส"}, "Bypass Tp")

	Label({ Section = Page_Setting, Title = "Stats" },2) 

	Button(Page_Setting,2, "Redeem X2 EXP Code", { Description = "ใช้โค้ด คูณ 2", }, function()
		for i,v in pairs({"GAMERROBOT_YT","EXP_5B","kittgaming","Enyu_is_Pro","Sub2Fer999","THEGREATACE","SUB2GAMERROBOT_EXP1","Sub2OfficialNoobie",
			"StrawHatMaine","SUB2NOOBMASTER123","Sub2Daigrock","Axiore","TantaiGaming","STRAWHATMAINE","JCWK","Magicbus","Starcodeheo","Bluxxy",
			}) do
			task.spawn(game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v))
		end
	end)

	Toggle(Page_Setting,2, {Title = "Auto Stats Melee",Description = "ออโต้ อัพหมัด"}, "Auto Stats Melee")
	Toggle(Page_Setting,2, {Title = "Auto Stats Defense",Description = "ออโต้ อัพเลือด"}, "Auto Stats Defense")
	Toggle(Page_Setting,2, {Title = "Auto Stats Sword",Description = "ออโต้ อัพดาบ"}, "Auto Stats Sword")
	Toggle(Page_Setting,2, {Title = "Auto Stats Gun",Description = "ออโต้ อัพปืน"}, "Auto Stats Gun")
	Toggle(Page_Setting,2, {Title = "Auto Stats Fruit",Description = "ออโต้ อัพผล"}, "Auto Stats Fruit")

	task.spawn(function()
		repeats(true,.2,function()
			local stats = {
				["Melee"] = _G['Auto Stats Melee'], ["Defense"] = _G['Auto Stats Defense'],
				["Sword"] = _G['Auto Stats Sword'], ["Gun"] = _G['Auto Stats Gun'], ["Demon Fruit"] = _G['Auto Stats Fruit']
			}

			for stat, enabled in pairs(stats) do
				if enabled then _C("AddPoint",stat,_G['Point']) end
			end
		end)
	end)

	Slider(Page_Setting, { 
		Title = "Select Point", 
		Description = "เลือกจำนวนที่จะอัพ" 
	}, { 
		Default = 100,
		Max = 1000, 
		Min = 0, 
		Rounding = 1, 
		Callback = function(Value)
			_G['Point'] = Value 
		end 
	})


end

local Page_Quest = Page(Tap_Automatic,1) do
	local TotalMob = Label({ Section = Page_Quest, Title = "Cake Prince" },1)

	task.spawn(function()
		repeats(true,.2,function()
			if World3 then
				local caketotal = string.match(_C("CakePrinceSpawner"),"%d+")
				if caketotal then
					TotalMob:Set("Total : "..tostring(caketotal))
				else
					TotalMob:Set("Boss : Spawned")
				end
			else
				TotalMob:Set("World 3 Only")
			end
		end)
	end)
	Toggle(Page_Quest,.2, {Title = "Auto Cake Prince",Description = "ออโต้ฟาร์มเกาะเค้ก"}, "Auto Cake Prince")


	local EliteHunterCount = Label({ Section = Page_Quest, Title = "Total : ..." },1)
	local EliteHunterSpawn = Label({ Section = Page_Quest, Title = "Spwan Now?" },1)

	task.spawn(function()
		repeats(true,.2,function()
			local Data = _C("EliteHunter","Progress")
			EliteHunterCount:Set("Total : "..tostring(Data))
			if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
				EliteHunterSpawn:Set('🟢: บอสเกิดแล้ว : Diablo')
			elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
				EliteHunterSpawn:Set('🟢: บอสเกิดแล้ว : Deandre')
			elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
				EliteHunterSpawn:Set('🟢: บอสเกิดแล้ว : Urban')
			else
				EliteHunterSpawn:Set('❌: บอสยังไม่เกิด')
			end
		end)
	end)

	Toggle(Page_Quest,.2, {Title = "Auto Elite Hunter",Description = "ฟาร์ม อีลิต"}, "Auto Elite Hunter")
	Toggle(Page_Quest,.2, {Title = "Auto Elite Hunter [Hop]",Description = "ถ้าแม่งไม่มีให้รีเซิฟ"}, "Auto Elite Hunter [Hop]")
	_G['Auto Stop WhenUntil GodChalice'] = true
	Toggle(Page_Quest,.2, {Title = "Stop Until Have God Chalice",Description = "จะหยุกถ้าได้ที่ เสกแอดมิน"}, "Auto Stop WhenUntil GodChalice")

	Label({ Section = Page_Quest, Title = "Bone" },1)

	local BoneCount = Label({ Section = Page_Quest, Title = "Bone : 0" },1)

	task.spawn(function()
		repeats(true,.2,function()
			for i, v in pairs(_C("getInventory")) do
				if v.Type == "Material" then
					if v.Name == "Bones" then
						BoneCount:Set("🦴 Bones : "..v.Count)
					end
				end
			end
		end)
	end)

	Toggle(Page_Quest,.2, {Title = "Auto Bones",Description = "ออโต้ฟาร์ม กระดูก"}, "Auto Bone")
	Toggle(Page_Quest,.2, {Title = "Auto Random Bone",Description = "ออโต้สุ่มกระดูก"}, "Auto Random Bone")
	
	Funcs['Auto Random Bone'] = function(value)
		repeats(value,.2,function()
			_C("Bones","Buy",.2,1)
		end, function() return not value end)
	end
end

local Page_item = Page(Tap_Automatic,2) do
	Label({ Section = Page_item, Title = "Misc World 1" },1)
	Toggle(Page_item,.2, {Title = "Auto Pole V1",Description = "ทำ โพ V1"}, "Auto Pole V1")
	Toggle(Page_item,.2, {Title = "Auto Cannon",Description = "หา ปืน"}, "Auto Cannon")
	Toggle(Page_item,.2, {Title = "Auto Bizento V2",Description = "ทำบิเซนโต วี2"}, "Auto Bizento V2")
	Label({ Section = Page_item, Title = "Misc World 2" },1)
	Toggle(Page_item,.2, {Title = "Auto True Triple Katana",Description = "หา3กาบ และฟาร์ม"}, "Auto True Triple Katana")
	Toggle(Page_item,.2, {Title = "Auto Rengoku",Description = "ทำดาบ เรนโกคุ หรือ เรนโงคุ"}, "Auto Rengoku")
	Toggle(Page_item,.2, {Title = "Auto Dragon Trident",Description = "ทำ ตรีศูลมังกร"}, "Auto Dragon Trident")
	Label({ Section = Page_item, Title = "Misc World 3" },1)
	Toggle(Page_item,2, {Title = "Auto Soul Guitar",Description = "ทำ กีตาร์"}, "Auto Soul Guitar")
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/XenoMaHub/FastAttack/refs/heads/main/README.md"))()

local CurrentHash = ""
local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    if tostring(self) == "RE/RegisterHit" and method == "FireServer" then
        if args[4] then
            CurrentHash = args[4]
        end
    end
    return old(self, ...)
end)
