# JUI Library
A library that adds simple GUI elements for you to utilize in your Love2D games.

## Basic Setup

## API

#### UIBase class

*This class is abstracted and exists for only inheritance.*

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

*This class is abstracted and exists for only inheritance.*

Methods:
```lua
RGBColor getBackgroundColor()
RGBColor getBorderColor()
number getCornerRounding()
Dimension getPosition()
Dimension getSize()
Vector2D getAbsolutePosition()           -- returns the real position of the object, in pixels
Vector2D getAbsoluteSize()               -- returns the real size of the object, in pixels
setBackgroundColor(RGBColor color)
setBorderColor(RGBColor color)
setCornerRounding(number rounding)
setPosition(Dimension pos)
setSize(Dimension size)
```

### Frame class

*Inherits UIRect*

### TextBox class

*Inherits UIRect*

### Dimension datatype

### Vector2D datatype

### RGBColor datatype