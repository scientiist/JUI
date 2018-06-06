local UIRect = require("lib.classes.UIRect")
local Event = require("lib.classes.Event")

local UIButton = UIRect:subclass("UIButton")

function UIButton:init()
    self.super:init()
    self.mouseDown = true

    self.mouseClickDown = Event:new()
    self.mouseClickUp = Event:new()
    self.mouseClickUpOutside = Event:new()
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
        self.mouseClickDown:call()
    end

    if self.mouseDown == true then
        if not love.mouse.isDown(1) then
            self.mouseDown = false

            if self.mouseOver then
                self.mouseClickUp:call()
            else
                self.mouseClickUpOutside:call()
            end
        end
    end
end

function UIButton:render()
    self.super:render()
end

return UIButton