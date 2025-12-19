----------------------------------------------------------------------------------------------------------------------------

if not game:IsLoaded() then game["Loaded"]:Wait() end

-------------------------------------------------------------------------------------------------------------------------------

local players = game:GetService("Players")
local localplayer = players["LocalPlayer"]
local marketplaceservice = game:GetService("MarketplaceService")
local httpservice = game:GetService("HttpService")

-------------------------------------------------------------------------------------------------------------------------------

local function clik()
	local s = Instance.new("Sound") 
	s["SoundId"] = "rbxassetid://87152549167464"
	s["Parent"] = game["Workspace"]
	s["Volume"] = 1.2
	s["TimePosition"] = 0.1
	s:Play()
end

-------------------------------------------------------------------------------------------------------------------------------

local gui = Instance.new("ScreenGui")
gui["Name"] = "AnimationPlayer"
if game["Run Service"]:IsStudio() then gui["Parent"] = localplayer:WaitForChild("PlayerGui") else gui["Parent"] = gethui and gethui() or game:GetService("CoreGui") end
gui["ResetOnSpawn"] = false

local function repos(ui, w, h)
	local sw, sh = workspace["CurrentCamera"]["ViewportSize"]["X"], workspace["CurrentCamera"]["ViewportSize"]["Y"]
	local cx, cy = (sw - w) / 2, (sh - h) / 2 - 56
	ui["Position"] = UDim2.new(0, cx, 0, cy)
end

local frame = Instance.new("Frame")
frame["Size"] = UDim2.new(0, 399, 0, 300)
frame["Position"] = UDim2.new(0.35, 0, 0.3, 0)
repos(frame, 399, 300)
frame["BackgroundColor3"] = Color3.fromRGB(30, 30, 30)
frame["BorderSizePixel"] = 0
frame["Parent"] = gui
frame["Active"] = true
frame["Draggable"] = true

-------------------------------------------------------------------------------------------------------------------------------

local topbar = Instance.new("Frame")
topbar["Size"] = UDim2.new(0, 399, 0, 30)
topbar["BackgroundColor3"] = Color3.fromRGB(50, 50, 50)
topbar["BorderSizePixel"] = 0
topbar["Parent"] = frame

local titlelabel = Instance.new("TextLabel")
titlelabel["Size"] = UDim2.new(1, -140, 1, 0)
titlelabel["Position"] = UDim2.new(0, 0, 0, 0)
titlelabel["BackgroundTransparency"] = 1
titlelabel["Text"] = "※风御 X FE R15动画"
titlelabel["Font"] = Enum.Font.RobotoMono
titlelabel["TextXAlignment"] = Enum.TextXAlignment.Left
titlelabel["TextColor3"] = Color3.new(1, 1, 1)
titlelabel["TextSize"] = 18
titlelabel["Parent"] = topbar

local searchbar = Instance.new("Frame")
searchbar["Size"] = UDim2.new(0, 399, 0, 30)
searchbar["Position"] = UDim2.new(0, 0, 0, 30)
searchbar["BackgroundColor3"] = Color3.fromRGB(40, 40, 40)
searchbar["BorderSizePixel"] = 0
searchbar["Parent"] = frame

local searchbox = Instance.new("TextBox")
searchbox["Size"] = UDim2.new(1, -10, 0, 20)
searchbox["Position"] = UDim2.new(0, 5, 0, 5)
searchbox["BackgroundColor3"] = Color3.fromRGB(30, 30, 30)
searchbox["TextColor3"] = Color3.new(1, 1, 1)
searchbox["PlaceholderText"] = "搜索动画"
searchbox["PlaceholderColor3"] = Color3.fromRGB(150, 150, 150)
searchbox["Text"] = ""
searchbox["TextSize"] = 14
searchbox["Font"] = Enum.Font.RobotoMono
searchbox["BorderSizePixel"] = 0
searchbox["Parent"] = searchbar

local function createbutton(name, position, size, color, text)
	local button = Instance.new("TextButton")
	button["Name"] = name
	button["Size"] = size
	button["Position"] = position
	button["BackgroundColor3"] = color
	button["Text"] = text
	button["TextColor3"] = Color3.new(1, 1, 1)
	button["TextSize"] = 16
	button["Font"] = Enum.Font.RobotoMono
	button["BorderSizePixel"] = 0
	button["BackgroundTransparency"] = 0.7
	button["Parent"] = topbar
	return button
end

local stopallbutton = createbutton("StopAllButton", UDim2.new(1, -147, 0, 5), UDim2.new(0, 90, 0, 20), Color3.fromRGB(200, 50, 50), "停止动画")
local minimizebutton = createbutton("MinimizeButton", UDim2.new(1, -51, 0, 5), UDim2.new(0, 20, 0, 20), Color3.fromRGB(50, 50, 200), "–")
local xbutton = createbutton("CloseButton", UDim2.new(1, -25, 0, 5), UDim2.new(0, 20, 0, 20), Color3.fromRGB(200, 50, 50), "X")

-------------------------------------------------------------------------------------------------------------------------------

local scrollframe = Instance.new("ScrollingFrame")
scrollframe["Size"] = UDim2.new(1, 0, 0, 230)
scrollframe["Position"] = UDim2.new(0, 0, 0, 65)
scrollframe["CanvasSize"] = UDim2.new(0, 0, 0, 0)
scrollframe["ScrollBarThickness"] = 0
scrollframe["BorderSizePixel"] = 0
scrollframe["BackgroundTransparency"] = 1
scrollframe["BackgroundColor3"] = Color3.fromRGB(20, 20, 20)
scrollframe["Parent"] = frame

local buttoncontainer = Instance.new("Frame")
buttoncontainer["Size"] = UDim2.new(1, 0, 1, 0)
buttoncontainer["Position"] = UDim2.new(0, 5, 0, 0)
buttoncontainer["BackgroundTransparency"] = 1
buttoncontainer["Parent"] = scrollframe

local buttonlayout = Instance.new("UIGridLayout")
buttonlayout["CellPadding"] = UDim2.new(0, 5, 0, 5)
buttonlayout["CellSize"] = UDim2.new(0, 126.2, 0, 60)
buttonlayout["SortOrder"] = Enum.SortOrder.LayoutOrder
buttonlayout["Parent"] = buttoncontainer

-------------------------------------------------------------------------------------------------------------------------------

local oldbuttons = {}

local animations = {
	{name = "加利福尼亚\n女孩", id = 124982597491660, speed = 1, timepos = 0},
	{name = "直升机", id = 95301257497525, speed = 1, timepos = 0},
	{name = "直升机2", id = 122951149300674, speed = 1, timepos = 0},
	{name = "直升机3", id = 91257498644328, speed = 1, timepos = 0},
	{name = "大胡德舞", id = 108171959207138, speed = 1, timepos = 0},
	{name = "达胡德跺脚", id = 115048845533448, speed = 1.4, timepos = 0},
	{name = "搁浅的鱼", id = 79075971527754, speed = 1, timepos = 0},
	{name = "江南Style", id = 100531289776679, speed = 1, timepos = 0},
	{name = "卡拉梅尔丹森", id = 88315693621494, speed = 1, timepos = 0},
	{name = "拉直转圈", id = 94324173536622, speed = 1, timepos = 0},
	{name = "伸懒腰（左）", id = 110936682778213, speed = 0, timepos = 0},
	{name = "伸懒腰（右）", id = 84671941093489, speed = 0, timepos = 0},
	{name = "传奇俄罗斯方块1+2", id = 115439144505157, speed = 1, timepos = 0},
	{name = "1方块抽象", id = 115439144505157, speed = 0, timepos = 0.2},
	{name = "2方块抽象", id = 115439144505157, speed = 0, timepos = 1.2},
	{name = "布鲁斯", id = 78195344190486, speed = 1, timepos = 0},
	{name = "修仙", id = 86872878957632, speed = 1, timepos = 0},
	{name = "默认舞蹈", id = 88455578674030, speed = 1, timepos = 0},
	{name = "坐", id = 97185364700038, speed = 1, timepos = 0},
	{name = "经典舞蹈", id = 119264600441310, speed = 1, timepos = 0},
	{name = "战斗姿势", id = 116763940575803, speed = 1, timepos = 0},
	{name = "不是哥们", id = 81389876138766, speed = 1, timepos = 0},
	{name = "最骚的坐", id = 130995344283026, speed = 1, timepos = 0},
	{name = "摇摆坐", id = 131836270858895, speed = 1, timepos = 0},
	{name = "蠕虫", id = 90333292347820, speed = 1, timepos = 0},
	{name = "蛇", id = 98476854035224, speed = 1, timepos = 0},
	{name = "经典背手摔", id = 129787664584610, speed = 1, timepos = 0},
	{name = "被手铐铐上", id = 113475147402830, speed = 1, timepos = 0},
	{name = "躺着+摆腿", id = 80754582835479, speed = 1, timepos = 0},
	{name = "姿势", id = 92266904563270, speed = 1, timepos = 0},
	{name = "指人", id = 122120443600865, speed = 1, timepos = 0},
	{name = "姿势2", id = 120629563851640, speed = 1, timepos = 0},
	{name = "浮层", id = 77840765435893, speed = 1, timepos = 0},
	{name = "身体抽象化", id = 109873544976020, speed = 1, timepos = 0},
	{name = "无头", id = 78837807518622, speed = 1, timepos = 0},
	{name = "ME-ME经典动画", id = 103235915424832, speed = 1, timepos = 0},
	{name = "飞机", id = 82135680487389, speed = 1, timepos = 0},
	{name = "摇摆舞", id = 90802740360125, speed = 1, timepos = 0},
	{name = "科目三", id = 131758838511368, speed = 1, timepos = 0},
	{name = "光滑的背部", id = 74288964113793, speed = 1, timepos = 0},
	{name = "车", id = 108747312576405, speed = 1, timepos = 0},
	{name = "烂尾蛇", id = 93497729736287, speed = 1, timepos = 0},
	{name = "坦克", id = 94915612757079, speed = 1, timepos = 0},
	{name = "经典走路动画", id = 107806791584829, speed = 1, timepos = 0},
	{name = "奇怪的生物", id = 87025086742503, speed = 1, timepos = 0},
	{name = "不要慌张", id = 127154705636043, speed = 1, timepos = 0},
	{name = "翻滚（谁家熊孩子）", id = 129699431093711, speed = 1, timepos = 0},
	{name = "思考", id = 127088545449493, speed = 1, timepos = 0},
	{name = "身体散架", id = 88130117312312, speed = 1, timepos = 0},
	{name = "摇头（疯了）", id = 135611169366768, speed = 1, timepos = 0},
	{name = "配合检查", id = 81176957565811, speed = 1, timepos = 0},
	{name = "投降", id = 100537772865440, speed = 1, timepos = 0},
	{name = "假设", id = 91294374426630, speed = 1, timepos = 0},
	{name = "格里迪", id = 121966805049108, speed = 1, timepos = 0},
	{name = "走L", id = 78653596566468, speed = 1, timepos = 0},
	{name = "篮球头旋", id = 92854797386719, speed = 1, timepos = 0},
	{name = "鹦鹉舞", id = 101810746304426, speed = 1, timepos = 0},
	{name = "射击（倒下）", id = 102691551292124, speed = 1, timepos = 0},
	{name = "倒下", id = 136224735234038, speed = 1, timepos = 0},
	{name = "悲伤的坐", id = 100798804992348, speed = 1, timepos = 0},
	{name = "汽水", id = 105459130960429, speed = 1, timepos = 0},
	{name = "比利·鲍恩斯", id = 137501135905857, speed = 1, timepos = 0},
	{name = "拿自己的头当篮球玩", id = 119242308765484, speed = 1, timepos = 0},
	{name = "手提钻", id = 91423662648449, speed = 1, timepos = 0},
	{name = "抽象这一块", id = 137883764619555, speed = 1, timepos = 0},
	{name = "坐地旋转", id = 107217181254431, speed = 1, timepos = 0},
	{name = "里兹后空翻", id = 131205329995035, speed = 1, timepos = 0},
	{name = "漂浮", id = 89523370947906, speed = 1, timepos = 0},
	{name = "无法评价", id = 103041144411206, speed = 1, timepos = 0},
	{name = "人物经典抽象", id = 90708290447388, speed = 1, timepos = 0},
	{name = "Fuck You!", id = 98289978017308, speed = 1, timepos = 0},
	{name = "拍脑袋", id = 85422671683973, speed = 1, timepos = 0},
}

local active = {}

local function makebutton(data)
	local button = Instance.new("TextButton")
	button["Name"] = data.name
	button["Size"] = UDim2.new(1, 0, 1, 0)
	button["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
	button["Text"] = data.name
	button["TextColor3"] = Color3.new(1, 1, 1)
	button["TextSize"] = 16
	button["TextWrapped"] = true
	button["Font"] = Enum.Font.RobotoMono
	button["BorderSizePixel"] = 0
	button["Parent"] = buttoncontainer

	table.insert(oldbuttons, button)

	button["MouseButton1Click"]:Connect(function()
		clik()
		if localplayer.Character then
			local humanoid = localplayer.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				for id, track in pairs(active) do
					if track then
						track:Stop()
					end
				end
				active = {}

				local animation = Instance.new("Animation")
				animation.AnimationId = "rbxassetid://" .. data.id

				local track = humanoid:LoadAnimation(animation)
				track.Looped = true
				track:Play()
				track.TimePosition = data.timepos
				track:AdjustSpeed(data.speed)
				track:AdjustWeight(999)

				active[data.id] = track
			end
		end
	end)
end

for _, anim in ipairs(animations) do
	makebutton(anim)
end

local function filteranims(input)
	input = string.lower(input)

	for _, button in pairs(oldbuttons) do
		button.Visible = false
	end

	for _, button in pairs(oldbuttons) do
		if string.find(string.lower(button.Text), input, 1, true) then
			button.Visible = true
		end
	end

	buttonlayout:GetPropertyChangedSignal("AbsoluteContentSize"):Wait()
	scrollframe["CanvasSize"] = UDim2.new(0, 0, 0, buttonlayout["AbsoluteContentSize"]["Y"])
end

searchbox:GetPropertyChangedSignal("Text"):Connect(function()
	filteranims(searchbox.Text)
end)

-------------------------------------------------------------------------------------------------------------------------------

stopallbutton["MouseButton1Click"]:Connect(function()
	clik()
	for id, track in pairs(active) do
		if track then
			track:Stop()
		end
	end
	active = {}
end)

xbutton["MouseButton1Click"]:Connect(function()
	clik()
	gui:Destroy()
end)

local isminimized = false
local originalsize = frame["Size"]

minimizebutton["MouseButton1Click"]:Connect(function()
	clik()
	isminimized = not isminimized
	if isminimized then
		minimizebutton["Text"] = "+"
		frame["Size"] = UDim2.new(originalsize["X"]["Scale"], originalsize["X"]["Offset"], 0, 30)
		scrollframe["Visible"] = false
	else
		minimizebutton["Text"] = "–"
		frame["Size"] = originalsize
		scrollframe["Visible"] = true
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

buttonlayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	buttoncontainer["Size"] = UDim2.new(1, -10, 0, buttonlayout["AbsoluteContentSize"]["Y"])
	scrollframe["CanvasSize"] = UDim2.new(0, 0, 0, buttonlayout["AbsoluteContentSize"]["Y"])
end)

-------------------------------------------------------------------------------------------------------------------------------
