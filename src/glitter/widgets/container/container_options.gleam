//// See <https://api.flutter.dev/flutter/widgets/Container-class.html>
//// Not Implemented:
////
//// ```
//// key: Option(String),
//// clip: clipBehavior = Clip.none}
//// alignment: Option(String),
//// color: Option(String),
//// decoration: Option(String),
//// foreground_decoration: Option(String),
//// constraints: Option(String),
//// transform: Option(String),
//// transform_alignment: Option(String),
//// ```
////

import gleam/option.{None, Option}
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/padding.{Padding}
import glitter/properties/margin.{Margin}

pub type ContainerOptions {
  ContainerOptions(
    decoration: BoxDecoration,
    height: Option(Int),
    margin: Margin,
    padding: Padding,
    width: Option(Int),
  )
}

pub fn defaults() {
  ContainerOptions(
    decoration: box_decoration.none(),
    height: None,
    margin: margin.none(),
    padding: padding.none(),
    width: None,
  )
}
