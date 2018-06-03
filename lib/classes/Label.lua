local UIRect = require("lib.classes.UIRect")
local RGBColor = require("lib.datatypes.RGBColor")

local Label = UIRect:subclass("Label")

function Label:init()
    self.super:init()

    self.text = "Label"
    self.textColor = RGBColor:new(0, 0, 0)
    self.textAlignment = "left"
    self.textSize = 12
    self.font = love.graphics.newFont(12)
    self.fontFace = nil
end

function Label:recalculateInternalFont()
    if self.fontFace then
        self.font = love.graphics.newFont(self.font, self.textSize)
    else
        self.font = love.graphics.newFont(self.textSize)
    end
end

function Label:getText()
    return self.text
end

function Label:getFontFace()
    return self.fontFace
end

function Label:getTextSize()
    return self.textSize
end

function Label:setText(text)
    self.text = text
end

function Label:setFontFace(fontface)
    self.fontFace = fontface
    self:recalculateInternalFont()
end

function Label:setTextSize(size)
    self.textSize = (size >= 1) and size or 1
    self:recalculateInternalFont()
end

function Label:render()
    

    local absPos = self:getAbsolutePosition()
    local absSize = self:getAbsoluteSize()

    self.super:render()

    love.graphics.setFont(self.font)
    love.graphics.setColor(self.textColor:out())
    love.graphics.printf(self.text, absPos.x, absPos.y, absSize.x, self.textAlignment)

    love.graphics.setFont(love.graphics.newFont(12))
    self:renderChildren()
end

return Label