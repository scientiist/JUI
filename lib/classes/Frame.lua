local UIRect = require("lib.classes.UIRect")

local Frame = UIRect:subclass("Frame")

function Frame:init()
    self.super:init()
end

function Frame:render()
    self.super:render()
    self:renderChildren()

end

return Frame