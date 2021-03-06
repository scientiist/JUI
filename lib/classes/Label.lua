local UIRect = require("lib.classes.UIRect")
local Color = require("lib.datatypes.Color")

local Label = UIRect:subclass("Label")
--[[
    Label class
        Inherits UIRect
    
        Internal properties:
            string text
            Color textColor
            string textAlignment
            number textSize
            Love2DFont font
            string fontFace

        Hidden methods:
            recalculateInternalFont()

        Public methods:
            string getText()
            string getFontFace()
            number getTextSize()
            setFontFace(String fontFile)
            setText(string text)
            setTextSize(number size)

        Events:
              
]]
function Label:init()
    self.super:init()

    self.text = "Label"
    self.textColor = Color:new(0, 0, 0)
    self.textXAlignment = "left"
    self.textYAlignment = "top"
    self.textSize = 12
    self.font = love.graphics.newFont(12)
    self.fontFace = nil
end

function Label:recalculateInternalFont()
    if self.fontFace then
        self.font = love.graphics.newFont(self.fontFace, self.textSize)
    else
        self.font = love.graphics.newFont(self.textSize)
    end
end

function Label:getText()
    return self.text
end

function Label:getTextAlignment()
    return self.textXAlignment, self.textYAlignment
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

function Label:setTextAlignment(xAlignment, yAlignment)
    self.textXAlignment = xAlignment
    self.textYAlignment = yAlignment
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
    self.super:render()

    local absPos = self:getAbsolutePosition()
    local absSize = self:getAbsoluteSize()

    love.graphics.setFont(self.font)
    love.graphics.setColor(self.textColor:out())

    local drawYPos = absPos.y
    local textHeight = self.font:getHeight()

    if self.textYAlignment == "center" then drawYPos = drawYPos + (absSize.y/2) - (textHeight/2) end
    if self.textYAlignment == "bottom" then drawYPos = drawYPos + absSize.y - textHeight end


    love.graphics.printf(self.text, absPos.x, drawYPos, absSize.x, self.textXAlignment)
    love.graphics.setFont(self.baseReturnFont)
    self:renderChildren()
end

return Label