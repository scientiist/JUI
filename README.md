# JUI Library
A library that adds simple GUI elements for you to utilize in your Love2D games.

## Features

* Lightweight and object-oriented GUI elements
* Helpful objects such as sliders and buttons
* FOSS, designed to be easily extended to fit your game's needs
* Automatic element scaling

## Planned Features

* Text Scaling
* List and Grid elements
* Scrollbar element


The full API docs can be found in the API.md file.

## Basic Setup

Download the library and place the JUI folder in your project, the library can be required with:

```lua
local JUI = require("JUI/JUIlib") -- I recommend calling the required variable "JUI"
-- that's what I'll be using in all docs and examples

```

To set up a basic UI scene, a JUIScene is created and objects to be rendered are parented to it. The JUIScene must be rendered and updated inside the appropriate Love2D functions.

Object size and position is controlled through the Dimension datatype.
The first two arguments are numbers representing the percentage of the parent's size, or the Dimension's scale.
For example, setting an object's Size to `Dimension:new(0.5, 0.5)` will make it 50% the size of it's parent.
The third and fourth arguments are pixel sizes, which are added to the size afterwards.

```lua
-- creates a UIContainer and a Frame object, and renders them.
local scene = JUI.JUIScene:new()

local frame = JUI.Frame:new()
    frame:setName("BackgroundFrame")
    frame:setBackgroundColor(JUI.Color:new(1, 0.5, 0.5)) -- transparency is an optional fourth argument
    frame:setSize(JUI.Dimension:new(0.3, 0.3, 64, 64)) -- 30% the parent's size, plus 64 pixels on each axis

-- JUI objects also may have events you can connect your own functions to listen to.
-- connect a new event listener
frame.mouseEnter:connect(function()
    print("Mouse inside!")
end)

JUI:parent(scene, frame) -- the current method of setting the parent of an object
-- first object is the new parent of the second object
-- I don't particularly like this method, and am looking for an alternative

function love.update(delta)
    scene:update(delta) -- the JUIScene will recursively call update(delta) on all descendants
end

function love.draw()
    scene:render() -- same thing with render()
end
```

## Other Information

### Help
If you have any issues or questions about JUI, feel free to contact me on Discord: **Josh Mad Scientist#6360**


### Credits:
This project utilizes the YACI library. https://github.com/jpatte/yaci.lua