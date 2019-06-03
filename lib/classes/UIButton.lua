local Label = require("lib.classes.Label")
local Event = require("lib.classes.Event")

local UIButton = Label:subclass("UIButton")

function UIButton:init()
    self.super:init()
    self.mouseDown = false
    self.buttonActivationAnimation = ""
    self.buttonDeactivationAnimation = ""

    self.mouseClickDown = Event:new()
    self.mouseClickUp = Event:new()

    self.keyboardActivated = Event:new()

    self.pressed = Event:new()
    self.released = Event:new()
    self.cancelled = Event:new()
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
        self.pressed:call()
    end

    if self.mouseDown == true then
        if not love.mouse.isDown(1) then
            self.mouseDown = false
            self.mouseClickUp:call()
            self.released:call()
            if not self.mouseOver then
                self.cancelled:call()
            end
        end
    end
end

function UIButton:render()
    self.super:render()
end

return UIButton