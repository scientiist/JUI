--[[
    This is an example project, demonstrating the ways that JUI can be utilized.

]]--

local JUI = require("JUIlib")

local bigboy = JUI.Dimension:new(0.3, 0.2)

local mainmenu = JUI.UIContainer:new()

local background = JUI.Frame:new()
background:setSize(bigboy)
background:setPosition(bigboy)
background:setCornerRounding(0)

local emptyColor = JUI.TextBox:new()
emptyColor:setSize(JUI.Dimension:new(0.3, 0.1))
emptyColor:setPosition(JUI.Dimension:new(0.2, 0.8))
emptyColor:setBackgroundColor(JUI.RGBColor:new(200, 69, 128))
emptyColor:setTextSize(36)
emptyColor:setText("Bottom Text")
emptyColor.mouseEnter:connect(function()
    emptyColor:setText("Inside")
end)
emptyColor.mouseExit:connect(function()
    emptyColor:setText("Outside")
end)

JUI.parent(mainmenu, background)
JUI.parent(mainmenu, emptyColor)

local windowCreationSuccess

function love.load()
    windowCreationSuccess = love.window.setMode(1024, 600, {
        resizable = true,
        fullscreen = false,
        msaa = 0,
        minwidth = 640,
        minheight = 480,
    })
end

function love.update(delta)
    mainmenu:update(delta)
end

function love.draw()

    mainmenu:render()
    
    love.graphics.setColor((JUI.RGBColor:new(255, 255, 255)):dump())
    love.graphics.print("fps: "..tostring(love.timer.getFPS()), 4, 4)
end