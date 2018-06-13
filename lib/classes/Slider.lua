local UIButton = require("lib.classes.UIButton")
local Event = require("lib.classes.Event")
local Color = require("lib.datatypes.Color")
local JUtils = require("lib.utils.JUtils")

local Slider = UIButton:subclass("Slider")

function Slider:init()
    self.super:init()

    self.minValue = 0
    self.maxValue = 100
    self.valueIncrement = 10
    self.value = 10
    self.smooth = false
    self.orientation = "vertical"

    self.valueChanged = Event:new()

    self.valuePercent = 0
    self.scrubDrawPosition = 0

    self.scrubXSize = 20
    self.scrubColor = Color:new(0.5, 0.5, 0.5) 
end

function Slider:getValueIncrement()
    return self.valueIncrement
end

function Slider:getValue()
    return self.value
end

function Slider:getOrientation()
    return self.orientation
end

function Slider:getValueRange()
    return self.minValue, self.maxValue
end

function Slider:setValueRange(min, max)
    self.minValue = min
    self.maxValue = max
end

function Slider:setValueIncrement(inc)
    self.valueIncrement = inc
end

function Slider:setValue(val)
    self.value = val
end

function Slider:doMouseMoveCalculations()

    -- how much length the slider can actually work with
    local effectiveSize = self:getAbsoluteSize().x-self.scrubXSize

    -- where the mouse is, inside of the slider
    local mousePosition = math.floor(love.mouse.getX() - self:getAbsolutePosition().x)

    -- so that the scrub is put in the middle of the mouse
    local scrubPos = mousePosition-(self.scrubXSize/2)

    -- clamp the value so it never leaves the slider
    local positionClamped = JUtils.ClampNumber(scrubPos, 0, effectiveSize)

    local percent = (positionClamped/effectiveSize)

    local range = self.maxValue-self.minValue

    local val = JUtils.NearestMultiple(percent*range, self.valueIncrement)

   -- self.valuePercent = val/range

    val = val + self.minValue
    if val ~= self.value then
        self.value = val
        self.valueChanged:call()
    end
end

function Slider:updateScrubPos()
    local range = self.maxValue-self.minValue
    self.valuePercent = (self.value-self.minValue)/range
    self.scrubDrawPosition = (self.valuePercent*(self:getAbsoluteSize().x-self.scrubXSize))/self:getAbsoluteSize().x
end

function Slider:update(delta)
    self.super:update(delta)

    if self.parent then
        self:updateScrubPos()
    end
    

    if self.mouseDown then
        self:doMouseMoveCalculations()
    end

end

function Slider:render()
    self.super:render()

    -- render the thing object idk

    love.graphics.setColor(self.scrubColor:out())
    love.graphics.rectangle("fill", self:getAbsolutePosition().x+(self.getAbsoluteSize().x*self.scrubDrawPosition), self.getAbsolutePosition().y, self.scrubXSize, self.getAbsoluteSize().y)

    self:renderChildren()
end

return Slider