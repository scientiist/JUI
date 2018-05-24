local newclass = require("YACI")

-- Class --
local UIBase = newclass("UIBase")

function UIBase:init()
    self.isUIObject = true
    self.active = true
    self.children = {}

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
    if not self.active then return end

    self:renderChildren()
end

function UIBase:update(delta)
    if not self.active then return end

    self:updateChildren(delta)
end

function UIBase:getChildren()
    return self.children
end

function UIBase:addChild(instance)
    table.insert(self.children, instance)
    instance.parent = self
end

function UIBase:setParent(instance)
    table.insert(instance.children, self)
    self.parent = instance
end

return UIBase