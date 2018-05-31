local UIBase = require("lib.classes.UIBase")
local Dimension = require("lib.datatypes.Dimension")
local Vector2D = require("lib.datatypes.Vector2D")
local RGBColor = require("lib.datatypes.RGBColor")
local Event = require("lib.classes.Event")

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

    self.mouseOver = false
    self.mouseEnter = Event:new()
    self.mouseExit = Event:new()
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

function UIRect:isMouseInside()
    return self.mouseOver
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

function UIRect:update(delta)
    self.super:update(delta)

    local mousePos = Vector2D:new(love.mouse.getX(), love.mouse.getY())

    local pos = self:getAbsolutePosition()

    local size = self:getAbsolutePosition()

    local mouseWithin = true
    if not (mousePos.x > pos.x) then mouseWithin = false end
    if not (mousePos.x < (pos.x + size.x)) then mouseWithin = false end

    if not (mousePos.y > pos.y) then mouseWithin = false end
    if not (mousePos.y < (pos.y + size.y)) then mouseWithin = false end

    if mouseWithin then

        if (self.mouseOver == false) then
            self.mouseOver = true
            self.mouseEnter:call()
           
        end
    else
        if (self.mouseOver == true) then
            self.mouseOver = false
            self.mouseExit:call()
        end
    end
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

    love.graphics.setColor(self.borderColor:out())
    -- border
    love.graphics.rectangle("fill", pos.x-self.borderWidth, pos.y-self.borderWidth, size.x+(self.borderWidth*2), size.y+(self.borderWidth*2), self.cornerRounding, self.cornerRounding)

    love.graphics.setColor(self.backgroundColor:out())
    -- background
    love.graphics.rectangle("fill", pos.x, pos.y, size.x, size.y, self.cornerRounding*(11/12), self.cornerRounding*(11/12))

    --self.super:render()
   -- self:renderChildren()
end

return UIRect