local UIBase = require("classes/UIBase")
local Dimension = require("classes/Dimension")
local Vector2D = require("classes/Vector2D")
local RGBColor = require("classes/RGBColor")

local UIRect = UIBase:subclass("UIRect")

function UIRect:init()
    self.super:init()
    self.backgroundColor = RGBColor:new(255, 255, 255)
    self.borderColor = RGBColor:new(0, 0, 0)
    self.borderWidth = 2
    self.backgroundTransparency = 0
    self.borderTransparency = 0
    self.cornerRounding = 1
    self.size = Dimension:new(0.2, 0.12)
    self.position = Dimension:new(0, 0)
end

function UIRect:getBackgroundColor()
    return self.backgroundColor
end

function UIRect:setBackgroundColor(color)
    self.backgroundColor = color
end

function UIRect:getBorderColor()
    return self.borderColor
end

function UIRect:setBorderColor(color)
    self.borderColor = color
end

function UIRect:getCornerRounding()
    return self.cornerRounding
end

function UIRect:getBorderTransparency()
    return self.borderTransparency
end

function UIRect:getBackgroundTransparency()
    return self.backgroundTransparency
end

function UIRect:setBackgroundTransparency(alpha)
    self.backgroundTransparency = alpha
end

function UIRect:setCornerRounding(rounding)
    self.cornerRounding = rounding
end

function UIRect:setPosition(newPosition)
    self.position = newPosition
end

function UIRect:setSize(newSize)
    self.size = newSize
end

function UIRect:getPosition()
    return self.position
end

function UIRect:getSize()
    return self.size
end

function UIRect:getAbsoluteSize()
    local pos = self:getPosition()
    local size = self:getSize()

    local parent = self:getParent()

    local parentAbsSize = parent:getAbsoluteSize()
    local parentAbsPos = parent:getAbsolutePosition()

    local absoluteSizeX = size.x.pixel + parentAbsSize.x * size.x.scale
    local absoluteSizeY = size.y.pixel + parentAbsSize.y * size.y.scale

    return Vector2D:new(absoluteSizeX, absoluteSizeY)
end

function UIRect:getAbsolutePosition()
    local pos = self:getPosition()
    local size = self:getSize()

    local parent = self:getParent()

    local parentAbsSize = parent:getAbsoluteSize()
    local parentAbsPos = parent:getAbsolutePosition()

    local absolutePosX = parentAbsPos.x + pos.x.pixel + parentAbsSize.x * pos.x.scale
    local absolutePosY = parentAbsPos.y + pos.y.pixel + parentAbsSize.y * pos.y.scale

    return Vector2D:new(absolutePosX, absolutePosY)
end

function UIRect:render()

    local pos = self:getAbsolutePosition()
    local size = self:getAbsoluteSize()

    love.graphics.setColor(self.borderColor:dump())
    -- border
    love.graphics.rectangle("fill", pos.x-self.borderWidth, pos.y-self.borderWidth, size.x+(self.borderWidth*2), size.y+(self.borderWidth*2), self.cornerRounding, self.cornerRounding)

    love.graphics.setColor(self.backgroundColor:dump())
    -- background
    love.graphics.rectangle("fill", pos.x, pos.y, size.x, size.y, self.cornerRounding*(11/12), self.cornerRounding*(11/12))

    --self.super:render()
   -- self:renderChildren()
end

return UIRect