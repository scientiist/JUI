local UIButton = require("lib.classes.UIButton")
local Color = require("lib.datatypes.Color")

local Button = UIButton:subclass("Button")

function Button:init()
    self.super:init()
    self.text = "Button"
    self.textColor = Color:new(0, 0, 0)
    self.textAlignment = "left"
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
    return self.textAlignment
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

function Button:setTextAlignment(alignment)
    self.textAlignment = alignment
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
    love.graphics.printf(self.text, absPos.x, absPos.y, absSize.x, self.textAlignment)
    love.graphics.setFont(self.baseReturnFont)

    self:renderChildren()
end

return Button