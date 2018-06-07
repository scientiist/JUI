--[[
    This is an example project, demonstrating the ways that JUI can be utilized.

]]--

local JUI = require("JUIlib")

local bigboy = JUI.Dimension:new(0.6, 0.6)

local mainmenu = JUI.JUIScene:new()

local background = JUI.Frame:new()
    background:setSize(bigboy)

local emptyColor = JUI.Label:new()
    emptyColor:setSize(JUI.Dimension:new(0.3, 0.1))
    emptyColor:setPosition(JUI.Dimension:new(0.2, 0.8))
    emptyColor:setBorderColor(JUI.Color:new(0.5, 0.5, 0.5))
    emptyColor:setTextSize(22)
    emptyColor:setBackgroundColor(JUI.Color:fromRGB(200, 69, 128, 128))
    emptyColor:setTextAlignment("center")
    emptyColor:setText("Bottom Text")

    

local button = JUI.Button:new()
    button:setSize(JUI.Dimension:new(0.3, 0.5))
    button:setPosition(JUI.Dimension:new(0.2, 0.2))
    button:setBackgroundColor(JUI.Color:fromHSL(1, 128, 196))

    button.mouseClickDown:connect(function()
        button:setText("Thug")
    end)

    button.mouseClickUp:connect(function()
        button:setText("not Thug")
    end)
    
    button.mouseEnter:connect(function()
        button:setText("Inside")
    end)
    button.mouseExit:connect(function()
        button:setText("Outside")
    end)


JUI:parent(mainmenu, background)
JUI:parent(mainmenu, emptyColor)
JUI:parent(background, button)


print((JUI.Color:fromHex("#FFF")):out())
print((JUI.Color:fromHex("#ADFAAD")):out())
print((JUI.Color:fromHSL(1, 128, 196)):out())

local function round(number, decimalPlaces)
    local placer = 10^(-decimalPlaces)
    return (math.floor(number)/placer)*placer
end

local windowCreationSuccess
local debugInfoString = ""
local luaEngineMemory = 0
local luaHighestMem = 0

function love.load()
    windowCreationSuccess = love.window.setMode(1024, 600, {
        resizable = true,
        fullscreen = false,
        msaa = 0,
        minwidth = 640,
        minheight = 480,
    })
    love.graphics.setBackgroundColor(0.7, 0.8, 1)
    
end

function love.update(delta)
    mainmenu:update(delta)

    luaEngineMemory = round(collectgarbage('count'), 0)
    luaHighestMem = (luaEngineMemory > luaHighestMem) and luaEngineMemory or luaHighestMem

    do
        local fps = "fps: "..tostring(love.timer.getFPS())
        local os = "\tos: "..love.system.getOS()
        local coreCount = "\tcores: "..love.system.getProcessorCount()
        local displayCount = "\tdisplays: "..love.window.getDisplayCount()
        local hasFocus = "\tfocus: "..tostring(love.window.hasFocus())
        local luaMem = "\tluamem: "..luaEngineMemory.."kB"
        local luaMemHigh = "\tluamemhigh: "..luaHighestMem.."kb"

        debugInfoString = fps..os..coreCount..displayCount..hasFocus..luaMem..luaMemHigh
    end
end

function love.draw()

    mainmenu:render()
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 22)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(debugInfoString, 4, 4)
end