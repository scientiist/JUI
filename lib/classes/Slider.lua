local UIButton = require("lib.classes.UIButton")
local Event = require("lib.classes.Event")
local Color = require("lib.datatypes.Color")
local JUtils = require("lib.utils.JUtils")

local Slider = UIButton:subclass("Slider")

function Slider:init()
    self.super:init()

    self.valueRange = {2, 32}
    self.valueIncrement = 2
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

    -- so that the scrub is put in the middle of the mouse
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

    --self.valuePercent = math.floor(self.valuePercent*increments)/increments
    --self.scrubDrawPosition = math.floor(self.scrubDrawPosition*increments)/increments

    self.valuePercent = (math.floor((self.valuePercent*range)/self.valueIncrement)*self.valueIncrement)/range
    self.scrubDrawPosition = (math.floor((self.scrubDrawPosition*range)/self.valueIncrement)*self.valueIncrement)/range

    local thing = (self.valuePercent*range)+self.valueRange[1]

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
    love.graphics.rectangle("fill", self:getAbsolutePosition().x+(self.getAbsoluteSize().x*self.scrubDrawPosition), self.getAbsolutePosition().y, self.scrubXSize+1, self.getAbsoluteSize().y)

    self:renderChildren()
end

return Slider