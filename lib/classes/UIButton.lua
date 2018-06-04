local UIRect = require("lib.classes.UIRect")

local UIButton = UIRect:subclass("UIButton")

function UIButton:init()

end

function UIButton:update(delta)
    self.super:update()
end

function UIButton:render()

end

return UIButton