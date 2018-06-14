local UIButton = require("lib.classes.UIButton")
local Color = require("lib.datatypes.Color")

local Button = UIButton:subclass("Button")

function Button:init()
    self.super:init()
    self.text = "Button"
    self.textColor = Color:new(0, 0, 0)
    self.textXAlignment = "left"
    self.textYAlignment = "top"
    self.textSize = 12
    self.font = love.graphics.newFont(12)
    self.fontFace = nil
end

function Button:recalculateInternalFont()
    if self.fontFace then
        self.font = love.graphics.newFont(self.fontFace, self.textSize)
    else
        self.font = love.graphics.newFont(self.textSize)
    end
end

function Button:getText()
    return self.text
end

function Button:getTextAlignment()
    return self.textXAlignment, self.textYAlignment
end

function Button:getFontFace()
    return self.fontFace
end

function Button:getTextSize()
    return self.textSize
end

function Button:setText(text)
    self.text = text
end

function Button:setTextAlignment(xAlignment, yAlignment)
    self.textXAlignment = xAlignment
    self.textYAlignment = yAlignment
end

function Button:setFontFace(fontface)
    self.fontFace = fontface
    self:recalculateInternalFont()
end

function Button:setTextSize(size)
    self.textSize = (size >= 1) and size or 1
    self:recalculateInternalFont()
end

function Button:render()
    self.super:render()

    local absPos = self:getAbsolutePosition()
    local absSize = self:getAbsoluteSize()

    love.graphics.setFont(self.font)
    love.graphics.setColor(self.textColor:out())

    local drawYPos = absPos.y
    local textHeight = self.font:getHeight()

    if self.textYAlignment == "center" then drawYPos = drawYPos + (absSize.y/2) - (textHeight/2) end
    if self.textYAlignment == "bottom" then drawYPos = drawYPos + absSize.y - textHeight end


    love.graphics.printf(self.text, absPos.x, absPos.y, absSize.x, self.textXAlignment)
    love.graphics.setFont(self.baseReturnFont)

    self:renderChildren()
end

return Button