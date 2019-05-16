local Label = require("lib.classes.Label")
local Event = require("lib.classes.Event")

local InputForm = Label:subclass("InputForm")

function InputForm:init()
	self.super:init()
	
	self.focusGrabbed = Event:new()
	self.focusDropped = Event:new()
	self.inputEvent   = Event:new()

	self.isFocused = false
	self.defaultText = ""

	self.text = ""
	self.internalText = ""
	self.defaultText = ""
	self.hasBeenModified = false
	self.clearOnReturn = false
	self.overrideDefaultTextOnFocus = true
	self.time = 0.0
	self.cursor = "|"
	self.cursorPos = 0
	self.shift = false
end

function InputForm:reset()
	self.cursorPos = 0
	self.time = 0.0
	self.internalText = ""
	self.hasBeenModified = false
end

function InputForm:keypressed(key)

	if key == "backspace" and self.cursorPos > 0 then
		
		self.internalText = string.sub(self.internalText, 1, self.cursorPos-1)..string.sub(self.internalText, self.cursorPos+1)

		self.cursorPos = self.cursorPos - 1
		
	elseif key == "left" then
		self.cursorPos = math.max(0, self.cursorPos-1)
	elseif key == "right" then
		self.cursorPos = math.min(self.internalText:len(), self.cursorPos+1)
	elseif key == "delete" then
		-- omitted for now
	elseif key == "return" then
		--print(self.internalText)
		self.inputEvent:call(self.internalText)
		self:dropFocus(true)
		if self.clearOnReturnKey then
			self:reset()
		end
	end
end

function InputForm:textinput(t)
	self.internalText = string.sub(self.internalText, 1, self.cursorPos)..t..string.sub(self.internalText, self.cursorPos+1)
	self.cursorPos = self.cursorPos + 1
	self.hasBeenModified = true
end

function InputForm:setDefaultText(text)
	self.defaultText = text
end


function InputForm:grabFocus()
	self.isFocused = true
	self.focusGrabbed:call()

	if self.overrideDefaultTextOnFocus then
		self.hasBeenModified = true
	end
end

function InputForm:dropFocus(enter)
	self.isFocused = false
	self.focusDropped:call(enter)
end

function InputForm:update(dt)
	self.super:update(dt)


	-- invert the cursor every second
	self.time = self.time + dt
	if self.time > 0.25 then
		self.cursor = (self.cursor == "|") and "" or "|"
	
		self.time = 0.0
	end

	if self.hasBeenModified == true then
		if self.isFocused then
			self.text = string.sub(self.internalText, 1, self.cursorPos)..self.cursor..string.sub(self.internalText, self.cursorPos+1)
		else
			self.text = self.internalText
		end
	else
		self.text = self.defaultText
	end


	if love.mouse.isDown(1) then
		if self.mouseOver then
			self:grabFocus()
		else
			self:dropFocus(false)
		end
	end
end

function InputForm:render()
	self.super:render()


	self:renderChildren()
end

return InputForm