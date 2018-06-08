local UIButton = require("lib.classes.UIButton")
local Event = require("lib.classes.Event")

local Slider = UIButton:subclass("Slider")

function Slider:init()
    self.super:init()

    self.valueRange = {0, 100}
    self.valueIncrement = 5
    self.defaultValue = 50
    self.value = self.defaultValue
    self.smooth = false
    self.orientation = "vertical"

    self.valueChange = Event:new()
end

function Slider:update(delta)
    self.super:update(delta)

    if self.mouseDown then
        self:setPosition()
    end

end

return slider