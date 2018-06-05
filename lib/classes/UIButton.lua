local UIRect = require("lib.classes.UIRect")
local Event = require("lib.classes.Event")

local UIButton = UIRect:subclass("UIButton")

function UIButton:init()
    self.super:init()
    self.mouseDown = true

    self.mouseClick = Event:new()
    self.mouseClickReleaseInvalid = Event:new()
    self.mouseClickRelease = Event:new()
end

function UIButton:mouseEnterCall()
    self.super:mouseEnterCall()
end

function UIButton:mouseExitCall()
    self.super:mouseExitCall()
end

function UIButton:update(delta)
    self.super:update(delta)

    if self.mouseOver and love.mouse.isDown(1) then
        self.mouseDown = true
        self.mouseClickRelease:call()
    end

    if self.mouseDown == true then
        if love.mouse.isDown(1) then
            self.mouseDown = false

            if self.mouseOver then
                self.mouseClick:call()
            end
        end
    end
end

function UIButton:render()
    self.super:render()
end

return UIButton