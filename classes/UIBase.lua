local newclass = require("classes/YACI")
local Dimension = require("classes/Dimension")
local Vector2D = require("classes/Vector2D")
-- Class --
local UIBase = newclass("UIBase")

function UIBase:init()
    self.isUIObject = true
    self.active = true
    self.children = {}
    self.parent = nil

end

-- Hidden methods --
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

-- Shown API methods --
function UIBase:render()
    --if not self.active then return end

   --self:renderChildren()
end

function UIBase:update(delta)
    --if not self.active then return end

   --self:updateChildren(delta)
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