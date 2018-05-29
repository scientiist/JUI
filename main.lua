_G.stringList = {}

local JUI = require("JUIlib")

local bigboy = JUI.Dimension:new(0.3, 0.2)

local mainmenu = JUI.UIContainer:new()

local background = JUI.Frame:new()
background:setSize(bigboy)
background:setPosition(bigboy)
background:setCornerRounding(0)

local emptyColor = JUI.TextBox:new()
emptyColor:setSize(JUI.Dimension:new(0.7, 0.4))
emptyColor:setBackgroundColor(JUI.RGBColor:new(200, 69, 128))
emptyColor:setTextSize(36)

JUI.parent(mainmenu, background)
JUI.parent(background, emptyColor)

local windowCreationSuccess = nil
local tickTimer = 0

function love.load()
    windowCreationSuccess = love.window.setMode(1024, 600, {
        resizable = true,
        fullscreen = false,
        msaa = 0,
        minwidth = 640,
        minheight = 480,
    })
end

local secondsPassing = 0

local function updateLimiter(delta)
    tickTimer = tickTimer + delta
    

    if not (tickTimer > 1/60) then return false end
    tickTimer = 0
end

function love.update(delta)
    updateLimiter(delta)
    secondsPassing = secondsPassing + delta
    mainmenu:update(delta)
end


function love.draw()
    love.graphics.setColor(JUI.RGBColor:new(100, 100, 100):dump())
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())


    mainmenu:render() 

    love.graphics.setColor(255, 255, 255)
    for index, str in pairs(_G.stringList) do
        love.graphics.print(str, 500, (index*20))
    end

    love.graphics.print("fps: "..tostring(love.timer.getFPS( )), 4, 4)
end