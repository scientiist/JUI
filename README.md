# JUI Library
A library that adds simple GUI elements for you to utilize in your Love2D games.

## Basic Setup

Download the library and place the JUI folder in your project, the library can be required with:

```lua
local JUI = require("JUI/JUIlib") -- I recommend calling the required variable "JUI"
-- that's what I'll be using in all docs and examples

```
The JUIlib script returns the following objects for you to use:

- UIContainer
- Frame
- TextBox
- Dimension
- Vector2D
- RGBColor
- parent() function

To set up a basic UI scene, a UIContainer is created and objects to be rendered are parented to it. The UIContainer must be rendered and updated inside the appropriate Love2D functions.

```lua
-- creates a UIContainer and a Frame object, and renders them.
local scene = JUI.UIContainer:new()

local frame = JUI.Frame:new()
frame:setBackgroundColor(JUI.RGBColor:new(255, 128, 128))

-- connect a new event listener
frame.mouseEnter:connect(function()

end)

JUI.parent(scene, frame) -- the current method of setting the parent of an object
-- first object is the new parent of the second object
-- I don't particularly like this method, and am looking for an alternative

function love.update(delta)
    scene:update(delta) -- the UIContainer will recursively call update(delta) on all descendants
end

function love.draw()
    scene:render() -- same thing with render()
end
```


## Other Information

### Credits:
This project utilizes the YACI library. https://github.com/jpatte/yaci.lua