local UIButton = require("lib.classes.UIButton")
local Event = require("lib.classes.Event")
local Color = require("lib.datatypes.Color")
local JUtils = require("lib.utils.JUtils")

local Slider = UIButton:subclass("Slider")

function Slider:init()
    self.super:init()

    self.valueRange = {-50, 50}
    self.valueIncrement = 5
    self.defaultValue = 0
    self.value = self.defaultValue
    self.smooth = true
    self.orientation = "vertical"

    self.valueChange = Event:new()

    self.valuePercent = 0
    self.scrubDrawPosition = 0

    self.scrubXSize = 20
    self.scrubColor = Color:new(0.5, 0.5, 0.5)
    
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

    local range = self.valueRange[2]-self.valueRange[1]

    local val = JUtils.NearestMultiple(percent*range, self.valueIncrement)--+self.valueRange[1]

   -- self.valuePercent = val/range

    val = val + self.valueRange[1]

    self.value = val

    

end

function Slider:updateScrubPos()
    local range = self.valueRange[2]-self.valueRange[1]
    self.valuePercent = (self.value-self.valueRange[1])/range
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