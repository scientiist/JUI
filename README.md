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

## API

#### UIBase class

*This class is abstracted and exists only for inheritance.*

Constructor(s):
```lua
UIBase:new()  -- Unless otherwise specified, all UIBase object constructors take no arguments.
```

Methods:
```lua
render()
update(number deltatime)                 -- deltatime should be passed from love.update function
```

### UIContainer class

*Inherits UIBase*

Methods:
```lua
Vector2D getAbsolutePosition()           -- Always returns a Vector2D with 0, 0
Vector2D getAbsoluteSize()               -- Always returns a Vector2D with the viewport pixel size
```

### UIRect class
*Inherits UIBase*

*This class is abstracted and exists only for inheritance.*

Methods:
```lua
RGBColor getBackgroundColor()
RGBColor getBorderColor()
number getCornerRounding()
number getBackgroundTransparency()
number getBorderTransparency()
Dimension getPosition()
Dimension getSize()
Vector2D getAbsolutePosition()           -- returns the real position of the object, in pixels
Vector2D getAbsoluteSize()               -- returns the real size of the object, in pixels
boolean isMouseInside()
setBackgroundColor(RGBColor color)
setBorderColor(RGBColor color)
setCornerRounding(number rounding)
setPosition(Dimension pos)
setSize(Dimension size)
setBackgroundTransparency(number alpha)
setBorderTransparency(number alpha)
```

Events:
```lua
mouseEnter()
mouseExit()
```

### Frame class

*Inherits UIRect*

### TextBox class

*Inherits UIRect*

Methods:
```lua
string getFontFace()
number getTextSize()
setFontFace(string fontFile)
setTextSize(number size)
```

### Event class
Events provide a way for *listeners*, user-defined functions, to be called when certain things happen with JUI objects.
When an event is "connected", the function given will be called whenever this event is fired by JUI.

Methods:
```lua
number connect(function newConnection) -- returns a listenerID which can be used to disconnect the listener later
disconnect(number listenerID) -- disconnect the listener using the listenerID, so that it is no longer called
```

### Dimension datatype

Constructor:
```lua
Dimension:new(number xScale, number yScale, number xPixel, number yPixel)
```

Methods:
```lua
number, number getScaleXY()
number, number getPixelXY()
number, number, number, number getComponents()
```

Operators:
```lua
Dimension + Dimension
Dimension - Dimension
```

### Vector2D datatype

### RGBColor datatype

## Other Information

### Credits:
This project utilizes the YACI library. https://github.com/jpatte/yaci.lua