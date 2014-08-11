![Snappy Logo](http://cl.ly/image/340k2D3v332V/snappy.png)

Want to be bombarded with a code example before you even start reading? I got your back, here you go!

```swift
view.snp_top ~== container.snp_top ~+ 10 ~/ 2
box.snp_edges ~== 20 ~! 750
```

Yep, that's all. That's how you create constraints with Snappy.

---

Snappy is a simple, yer powerful and extensible auto-layout library written in Swift, taking advantage of many great language features, such as generics and custom operators. Snappy is also safe – it will report some of the obvious failures at compile-time.

> Snappy was inspired by [Masonry](http://github.com/masonry/masonry), which, at the time of its glory was, well, glorious, but didn't quite live up to my expectations as a long-term investment.

## Requirements

Snappy requires **iOS 8** and an emerald application being developed in **Xcode 6.0 Beta 5**. OS X support is coming.

## Installation

As there's no support for redistributable Swift frameworks yet, you can clone the whole repository (or add it as a submodule), then drag-and-drop the whole `Snappy.xcodeproj` into your workspace. Then make sure you linked your target with the framework and added it as a dependency. Done!

**Remember:** The `master` branch always contains a stable version. All real development happens in the `develop` branch. Also, Snappy isn't quite production-ready until version 1.0.

## Usage

### Operators, operators, operators

They're everywhere. You create your constraint using a combination of 7 custom operators provided by Snappy:

Operator | Function
--------:|:--------
   `~==` | Creates an "equal" constraint.
   `~>=` | Creates a "greater than or equal" constraint.
   `~<=` | Creates a "less than or equal" constraint.
    `~!` | Sets the priority of a constraint.
    `~+` | Sets a positive constant in the constraint.
    `~-` | Sets a negative constant in the constraint.
    `~*` | Sets the multiplication factor of the constraint.
    `~/` | Sets the inverse multiplication factor of the constraint.

### Syntax

Snappy has a fairly similar syntax, that can be expressed like so:

```none
attribute ~==|~>=|~<= attribute|literal (~+|~- constant) (~*|*/ multiplier) (~! priority)
```

> Pipe `|` means an alternation, and parentheses `()` describe an optional field.

You obtain the attributes from a view using `snp_*` properties provided by Snappy, such as `snp_leading` or `snp_centerX`.

Every attribute on the right-hand side of the equation can be replaced by a literal of a supported type, so you can write things like:

```swift
view.snp_width ~== 100

// instead of

view.snp_top ~== superview.snp_width
```

The behavior of how the literal types are converted to a constraint expression are described by the attribute themselves. This allows you to create constraints in a way not possible using the foundation API:

```swift
view.snp_edges ~== superview.snp_edges ~+ UIEdgeInsetsMake(20, 20, 20, 20)

// is the same as

view.snp_edges ~== UIEdgeInsetsMake(20, 20, 20, 20)

// or even

view.snp_edges ~== 20
```

### Extensibility

If you feel like something is missing for you, or you want to create a convenience attribute that sets a couple of constraints automatically, you can easily do that.

An example of such an attribute is `snp_edges`, which sets top, left, bottom and right layout attributes from the given edge insets.

You can refer to the documentation in the wiki for more information and tutorials about extensibility.

### Priorities made easy

You don't have to explicitly assign the constraint priority outside its initializer – just use the `~!` operator:

```swift
view.snp_width ~>= 40 // implicit priority of 1000 (required)
view.snp_width ~<= 80 ~! 750 // explicit priority of 750 (high)
```

### Behind the scenes

What makes Snappy create is that you don't have to write the boilerplate code.

For example, Snappy automatically finds the approppriate view to install the constraints on. **It also disables the autoresizing masks for you!**

## Syntax breakdown

In case there are some questions, let's do a step-by-step breakdown on an example equation:

```swift
view1.snp_width ~>= view2.snp_width ~/ 2 ~+ 20 ~! 750
```

1. **`view1.snp_width`** – the width of `view1`
2. **`~>=`** – must be greater than or equal to...
3. **`view2.snp_width`** – the width of `view2`...
4. **`~/ 2`** – divided by 2...
5. **`~+ 20`** – and increased by 20
6. **`~! 750`** – the constraint has a high priority (of 750)

## Examples

> `target` describes a view that will receive the constraint, whereas `source` indicates a source view, that the `target` is related to. Note that in a lot of cases, you don't even need to specify the source view.

#### Target is offset by 20px on each edge

```swift
target.snp_edges ~== 20
```

#### Target is 40px away from the source

```swift
target.snp_left ~== source.snp_right ~+ 40
```

#### Target is centerred vertically and horizontally

```swift
target.centerX ~== source.snp_centerX
target.centerY ~== source.snp_centerY
```

#### Target is centerred horizontally, has full height and half width

```swift
target.snp_top ~== 0
target.snp_centerX ~== source.snp_centerX
target.snp_height ~== source.snp_height
target.snp_width ~== source.snp_width ~/ 2
```

#### Target sticks to top edge, has full width and a minimal height of 50

```swift
target.snp_top ~== 0
target.snp_width ~== source.snp_width
target.snp_height ~>= 50
```

## About the project

### Creators

**Adrian Kashivskyy**

- [http://github.com/akashivskyy](http://github.com/akashivskyy)
- [http://twitter.com/akashivskyy](http://twitter.com/akashivskyy)

### Documentation

If there's something you can't find by reading this file, or **very well documented source files**, please visit the [project's wiki](http://github.com/akashivskyy/snappy/wiki).

### License

Snappy is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for more info.