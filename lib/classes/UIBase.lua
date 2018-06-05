local newclass = require("lib.YACI")
local Dimension = require("lib.datatypes.Dimension")
local Vector2D = require("lib.datatypes.Vector2D")

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

function UIBase:init()
    self.isUIObject = true
    self.active = true
    self.children = {}
    self.parent = nil
    self.baseReturnFont = love.graphics.newFont(12)
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
end


function UIBase:getChildren()
    return self.children
end

function UIBase:addChild(instance)
    self.children[#self.children+1] = instance
end

function UIBase:getParent()
    return self.parent
end

function UIBase:setParent(instance)
    self.parent = instance
end

return UIBase