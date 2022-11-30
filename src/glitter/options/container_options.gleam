//// TODO:
////
//// ```
//// key: Option(String),
//// clip: clipBehavior = Clip.none}
//// alignment: Option(String),
//// foreground_decoration: Option(String),
//// constraints: Option(String),
//// transform: Option(String),
//// transform_alignment: Option(String),
//// ```
//// See <https://api.flutter.dev/flutter/widgets/Container-class.html>
////

import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/color.{Color}
import glitter/properties/margin.{Margin}
import glitter/properties/padding.{Padding}
import glitter/unit.{Unit}
import glitter/box_element.{BoxElement, Div}

pub type ContainerOptions {
  ContainerOptions(
    background_color: Color,
    decoration: BoxDecoration,
    height: Unit,
    kind: BoxElement,
    margin: Margin,
    padding: Padding,
    width: Unit,
  )
}

pub fn defaults() {
  ContainerOptions(
    background_color: color.none(),
    decoration: box_decoration.none(),
    height: unit.unset(),
    kind: Div,
    margin: margin.unset(),
    padding: padding.unset(),
    width: unit.unset(),
  )
}
