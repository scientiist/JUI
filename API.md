## API

JUI methods:
```lua
parent(UIBase parent, UIBase child)
unparent(UIBase parent, UIBase child)
```

JUI enums:

TextAlignment
```lua
LEFT
RIGHT
CENTER
```

### UIBase class

*This class is abstracted and exists only for inheritance.*

Constructor(s):
```lua
UIBase:new()  -- Unless otherwise specified, all UIBase object constructors take no arguments.
```

Methods:
```lua
render()
update(number deltatime) -- deltatime should be passed from love.update function
table<UIBase> getChildren()
UIBase getChild(string childName)
UIBase getParent()
string getName() -- name defaults to 16-character random string
setName(string name)
```

### JUIScene class

*Inherits UIBase*

Methods:
```lua
Vector2D getAbsolutePosition() -- Always returns a Vector2D with 0, 0
Vector2D getAbsoluteSize() -- Always returns a Vector2D with the viewport pixel size
```

### UIRect class
*Inherits UIBase*

*This class is abstracted and exists only for inheritance.*

Methods:
```lua
Color getBackgroundColor() 
Color getBorderColor()
number getCornerRounding()
number getBackgroundTransparency()
number getBorderTransparency()
Dimension getPosition()
Dimension getSize()
Vector2D getAbsolutePosition() -- returns the real position of the object, in pixels
Vector2D getAbsoluteSize() -- returns the real size of the object, in pixels
boolean isMouseInside()
setBackgroundColor(Color color)
setBorderColor(Color color)
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

### Label class

*Inherits UIRect*

Methods:
```lua
string getFontFace()
string getText()
number getTextSize()
setFontFace(string fontFile)
setText(string text)
setTextSize(number size)
```

### UIButton class

*Inherits UIRect*

*This class is abstracted and exists only for inheritance.*


Events:
```lua
mouseClickDown()
mouseClickUp()
pressed()
released()
cancelled()
```

### Button class

*Inherits UIButton and Label*

### Slider class

*Inherits UIButton*

Methods:
```lua
number, number getValueRange()
number getValueIncrement()
number getValue()
setValueRange(number min, number max)
setValueIncrement(number inc)
setValue(number val)
```

Events:
```lua
```


### Event class
Events provide a way for *listeners*, user-defined functions, to be called when certain things happen with JUI objects.
When an event is "connected", the function given will be called whenever this event is fired by JUI.

Methods:
```lua
number connect(function newConnection) -- returns a listenerID
disconnect(number listenerID) -- disconnect the listener using the listenerID
```

### Dimension datatype

Constructor:
```lua
Dimension:new(number xScale, number yScale, number xPixel = 0, number yPixel = 0)
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

Constructor:
```lua
Vector2D:new(number x, number y)
```

### Color datatype
Represents color values.

Constructors:
```lua
Color:new() -- will default to fully black
Color:new(number red, number green, number blue, number alpha = 1) -- 0-1 double range
Color:fromRGB(number red, number green, number blue, number alpha = 255) -- 0-255 integer range
Color:fromHex(string HexColor, number alpha = 255) -- takes hexadecimal color codes
Color:fromHSL(number hue, number saturation, number lightness, number alpha = 255) -- HSL color
```
