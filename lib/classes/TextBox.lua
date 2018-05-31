local UIRect = require("lib.classes.UIRect")
local RGBColor = require("lib.datatypes.RGBColor")

local TextBox = UIRect:subclass("TextBox")

function TextBox:init()
    self.super:init()

    self.text = "TextBox"
    self.textColor = RGBColor:new(0, 0, 0)
    self.textAlignment = "left"
    self.textSize = 12
    self.font = love.graphics.newFont(12)
    self.fontFace = nil
end

function TextBox:recalculateInternalFont()
    if self.fontFace then
        self.font = love.graphics.newFont(self.font, self.textSize)
    else
        self.font = love.graphics.newFont(self.textSize)
    end
end

function TextBox:getText()
    return self.text
end

function TextBox:getFontFace()
    return self.fontFace
end

function TextBox:getTextSize()
    return self.textSize
end

function TextBox:setText(text)
    self.text = text
end

function TextBox:setFontFace(fontface)
    self.fontFace = fontface
    self:recalculateInternalFont()
end

function TextBox:setTextSize(size)
    self.textSize = (size >= 1) and size or 1
    self:recalculateInternalFont()
end

function TextBox:render()
    

    local absPos = self:getAbsolutePosition()
    local absSize = self:getAbsoluteSize()

    self.super:render()

    love.graphics.setFont(self.font)
    love.graphics.setColor(self.textColor:dump())
    love.graphics.printf(self.text, absPos.x, absPos.y, absSize.x, self.textAlignment)

    love.graphics.setFont(love.graphics.newFont(12))
    self:renderChildren()
end

return TextBox