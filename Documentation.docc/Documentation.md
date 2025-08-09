# ``RattleSnakes``

A library to create "snake" objects with textual serialized representations, for example a ``SNKColorSnake`` could be: `Color[R=100 G=000 B=255]`. It also has some helpful snakes.

## Overview

This library provides a way to create "snake" objects that can be converted to text and back, in a readable format.
Every snake inherits from ``SNKSnake``. If the snake simply wraps a non-snake object, it will inherit from ``SNKWrapperSnake``.

In addition, this library provides several useful snakes, such as ``SNKColorSnake``, ``SNKSnakeNSString``, and ``SNKSnakeNSArray``.

## Guide

### Creating basic snakes

A basic snake must implement ``SNKSnake/serialize`` and ``SNKSnake/initWithString:error:``, in addition to providing its own initializers, properties, and methods.

 - serialize: return the textual version of the object, unless an error occurs. Then it should set `error` to an NSError with code ``SNKFormatCode/SNKFormatError``. You might use `NSString/stringWithFormat:` and other string manipulation methods. See `SNKColorSnake`'s source code.
 - initWithString:error: convert the textual version back to the Objective C object. You might use `NSRegularExpression` or simply `NSString/substringWithRange:`.

### Creating wrapper snakes

A wrapper snake must implement serialize and initWithString, but it comes with ``SNKWrapperSnake/initWithValue:error:``, which can be overridden to handle invalid initialization values with the ``SNKFormatCode/SNKInvalidInitValue`` NSError code.
Access the stored value with `[self value]` or set it with `super.value = ...`. 
For an example, see the source code of `SNKSnakeNSString`.
