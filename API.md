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
Color getBackgroundColor()
Color getBorderColor()
number getCornerRounding()
number getBackgroundTransparency()
number getBorderTransparency()
Dimension getPosition()
Dimension getSize()
Vector2D getAbsolutePosition()           -- returns the real position of the object, in pixels
Vector2D getAbsoluteSize()               -- returns the real size of the object, in pixels
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

### TextBox class

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

### Color datatype

### HexColor datatype

### RGBColor datatype