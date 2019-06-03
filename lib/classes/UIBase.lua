local newclass = require("lib.YACI")
local Dimension = require("lib.datatypes.Dimension")
local Vector2D = require("lib.datatypes.Vector2D")
local Event = require("lib.classes.Event")
--[[
    UIBase class
    
        Internal properties:
            boolean isUIObject
            boolean active
            table<UIBase> children
            UIBase parent

        Hidden methods:
            renderChildren()
            updateChildren(number delta)
            addChild(UIBase child)
            setParent(UIBase parent)

        Public methods:
            table<UIBase> getChildren()
            UIBase getParent()
            render()
            update(number delta)
        
        Events:
            
]]
local UIBase = newclass("UIBase")

local charset = {}  do -- [0-9a-zA-Z]
    for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
end

local function randomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.clock()^5)
    return randomString(length - 1) .. charset[math.random(1, #charset)]
end

function UIBase:init()
    self.name = randomString(16)
    self.isUIObject = true
    self.active = true
    self.children = {}
	self.parent = nil
	self.textInput = false
	self.baseReturnFont = love.graphics.newFont(12)
	
	self.onupdate = Event:new()
end

function UIBase:keypressPass(key)
	for _, child in pairs(self.children) do
		if child.isFocused and child.isFocused == true then
			child:keypressed(key)
			return true
		end
		child:keypressPass(key)
	end
end

function UIBase:textinputPass(t)
	for _, child in pairs(self.children) do
		if child.isFocused and child.isFocused == true then
			child:textinput(t)
			return true
		end
		child:textinputPass(t)
	end
end

function UIBase:renderChildren()
    for _, child in pairs(self.children) do
        if child.isUIObject then
            child:render()
        end
    end
end

function UIBase:updateChildren(delta)
    for _, child in pairs(self.children) do
        if child.isUIObject then
            child:update(delta)
        end
    end
end

function UIBase:render()

end

function UIBase:update(delta)
	self:updateChildren(delta)
	self.onupdate:call(delta)
end

function UIBase:getName()
    return self.name
end

function UIBase:setName(name)
	self.name = name
end

function UIBase:getChild(name)
    for _, obj in pairs(self:getChildren()) do
        if obj:getName() == name then
            return obj
        end
    end
end

function UIBase:getFirstChildOfType(type)
    for _, obj in pairs(self:getChildren()) do
        if obj.class == type then
            return obj
        end
    end
end

function UIBase:getChildren()
    return self.children
end

function UIBase:addChild(instance)
    self.children[#self.children+1] = instance
end

function UIBase:removeChild(instName)
    for index, obj in pairs(self:getChildren()) do
        if obj:getName() == instName then
            local object = obj
            self.children[index] = nil

            return obj
        end
    end
end

function UIBase:getParent()
    return self.parent
end

function UIBase:setParent(instance)
	self.parent = instance
end

return UIBase