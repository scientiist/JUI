local UIButton = require("lib.classes.UIButton")
local Event = require("lib.classes.Event")
local Color = require("lib.datatypes.Color")
local JUtils = require("lib.utils.JUtils")

local Slider = UIButton:subclass("Slider")

function Slider:init()
    self.super:init()

    self.valueRange = {0, 100}
    self.valueIncrement = 5
    self.defaultValue = 50
    self.value = self.defaultValue
    self.smooth = true
    self.orientation = "vertical"

    self.valueChange = Event:new()

    self.valuePercent = 0

    self.scrubDrawPosition = 0

    self.scrubXSize = 20
    self.scrubColor = Color:new(0.5, 0.5, 0.5)
end

function Slider:doMouseActionCalculations()

    -- how much length the slider can actually work with
    local effectiveSize = self:getAbsoluteSize().x-self.scrubXSize

    -- where the mouse is, inside of the slider
    local mousePosition = (love.mouse.getX() - self:getAbsolutePosition().x)

    -- so that the mouse is in the middle
    local scrubPos = mousePosition-(self.scrubXSize/2)

    -- clamp the value so it never leaves the slider
    local positionClamped = JUtils.ClampNumber(scrubPos, 0, effectiveSize)

    -- let's make a percentage value for where the slider should be placed
    local floatPos = (positionClamped / effectiveSize)

    -- now let's calculate where to draw the scrub
    local drawPos = (positionClamped / self:getAbsoluteSize().x)

    self.valuePercent = floatPos
    self.scrubDrawPosition = drawPos
end

function Slider:lockValues()
    local range = self.valueRange[2]-self.valueRange[1]

    local increments = range/self.valueIncrement

    print(increments)

    self.valuePercent = math.floor(self.valuePercent*increments)/increments
    self.scrubDrawPosition = math.floor(self.scrubDrawPosition*increments)/increments

    local thing = self.valuePercent*(range+self.valueRange[2])

    print(thing)
end

function Slider:update(delta)
    self.super:update(delta)


    if self.mouseDown then
        self:doMouseActionCalculations()

        self:lockValues()

        --print(self.scrubDrawPosition, self.valuePercent)
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