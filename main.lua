--[[
    This is an example project, demonstrating how to use JUI,
    and what can be done with it.

]]--

local JUI = require("JUIlib")

local mainmenu = JUI.JUIScene:new()


local testSlider = JUI.Slider:new()
    testSlider:setPosition(JUI.Dimension:new(0.3, 0.2))
    testSlider:setSize(JUI.Dimension:new(0.4, 0.1))


JUI:parent(mainmenu, testSlider)

local windowCreationSuccess
local debugInfoString = ""
local luaEngineMemory = 0
local luaHighestMem = 0

local ticktock = 0

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

    luaEngineMemory = JUI.Utils.RoundNumber(collectgarbage('count'), 0)
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