local UIBase = require("lib.classes.UIBase")
local Dimension = require("lib.datatypes.Dimension")
local Vector2D = require("lib.datatypes.Vector2D")
local Color = require("lib.datatypes.Color")
local Event = require("lib.classes.Event")

--[[
    UIRect class
        Inherits UIBase
    
        Internal properties:
            Color backgroundColor
            Color borderColor
            number backgroundTransparency
            number borderTransparency
            number borderWidth
            number cornerRounding
            boolean mouseOver
            boolean mouseExit

        Hidden methods:

        Public methods:
            Color getBackgroundColor()
            Color getBorderColor()
            number getBackgroundTransparency()
            number getBorderTransparency()
            number getBorderWidth()
            number getCornerRounding()
            Dimension getPosition()
            Dimension getSize()
            boolean isMouseInside()
            setBackgroundColor(Color bg)
            setBorderColor(Color border)
            setBackgroundTransparency(number alpha)
            setBorderTransparency(number alpha)
            setCornerRounding(number amount)
            setPosition(Dimension pos)
            setSize(Dimension size)

        Events:
            mouseEnter()
            mouseExit()
            
]]
local UIRect = UIBase:subclass("UIRect")

function UIRect:init()
    self.super:init()
    self.backgroundColor = Color:new(1, 1, 1)
    self.borderColor = Color:new(0, 0, 0)
    self.borderWidth = 2
    self.cornerRounding = 0
    self.size = Dimension:new(0.2, 0.12)
    self.position = Dimension:new(0, 0)
    self.mouseOver = false
    self.renders = 0

    -- events
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

function UIRect:getBorderWidth()
    return self.borderWidth
end

function UIRect:setBorderWidth(width)
	self.borderWidth = width
	
end

function UIRect:setBorderColor(color)
	self.borderColor = color
	
end

function UIRect:getCornerRounding()
    return self.cornerRounding
end

function UIRect:isMouseInside()
    return self.mouseOver
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

function UIRect:mouseEnterCall()
    self.mouseEnter:call()
end

function UIRect:mouseExitCall()
    self.mouseExit:call()
end

function UIRect:update(delta)
    
    self.super:update(delta)
    
    local mousePos = Vector2D:new(love.mouse.getX(), love.mouse.getY())

    local pos = self:getAbsolutePosition()

    local size = self:getAbsoluteSize()

    local mouseWithin = true
    if not (mousePos.x > pos.x) then mouseWithin = false end
    if not (mousePos.x < (pos.x + size.x)) then mouseWithin = false end

    if not (mousePos.y > pos.y) then mouseWithin = false end
    if not (mousePos.y < (pos.y + size.y)) then mouseWithin = false end

    if mouseWithin then

        if (self.mouseOver == false) then
            self.mouseOver = true
            self:mouseEnterCall() 
           
        end
    else
        if (self.mouseOver == true) then
            self.mouseOver = false
            self:mouseExitCall()
        end
    end
end

function UIRect:getAbsoluteSize()

    local pos = self:getPosition()
    local size = self:getSize()

    local parent = self:getParent()

    local parentAbsSize = parent:getAbsoluteSize()
    local parentAbsPos = parent:getAbsolutePosition()

    local absoluteSizeX = size.x.pixel + (parentAbsSize.x * size.x.scale)
    local absoluteSizeY = size.y.pixel + (parentAbsSize.y * size.y.scale)

    --return Vector2D:new(absoluteSizeX, absoluteSizeY)
    return {x = absoluteSizeX, y = absoluteSizeY}
end

function UIRect:getAbsolutePosition()
    local pos = self:getPosition()
    local size = self:getSize()

    local parent = self:getParent()

    local parentAbsSize = parent:getAbsoluteSize()
    local parentAbsPos = parent:getAbsolutePosition()

    local absolutePosX = parentAbsPos.x + pos.x.pixel + (parentAbsSize.x * pos.x.scale)
    local absolutePosY = parentAbsPos.y + pos.y.pixel + (parentAbsSize.y * pos.y.scale)

    --return Vector2D:new(absolutePosX, absolutePosY)
    return {x = absolutePosX, y = absolutePosY}
end

function UIRect:render()
    self.super:render()

    local pos = self:getAbsolutePosition()
    local size = self:getAbsoluteSize()
    
    love.graphics.setColor(self.backgroundColor:out())
    -- background
    love.graphics.rectangle("fill", pos.x, pos.y, size.x, size.y, self.cornerRounding, self.cornerRounding, 25)

    love.graphics.setColor(self.borderColor:out())
    love.graphics.setLineWidth(self.borderWidth)
    -- border
    love.graphics.rectangle("line", pos.x-(self.borderWidth/2), pos.y-(self.borderWidth/2), size.x+self.borderWidth, size.y+self.borderWidth, self.cornerRounding, self.cornerRounding)
end

return UIRect