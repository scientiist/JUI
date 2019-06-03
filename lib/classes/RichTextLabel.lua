local UIRect = require("lib.classes.UIRect")

local RichTextLabel = UIRect:subclass("RichTextLabel")

function RichTextLabel:init()
	self.super:init()

	self.font = love.graphics.newFont(12)
	self.fontFace = nil
	
	self.textTable = love.graphics.newText()
end

function RichTextLabel:internalRefreshText()

end

function RichTextLabel:update(dt)
	self.super:update(dt)


	self:renderChildren()
end

function RichTextLabel:render()
	self.super:render()


	self:renderChildren()
end


return RichTextLabel