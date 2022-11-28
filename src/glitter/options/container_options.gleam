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
import glitter/units/size.{Size, SizeAuto}
import glitter/atoms/auto.{Auto}

pub type ContainerOptions {
  ContainerOptions(
    background_color: Color,
    decoration: BoxDecoration,
    height: Size,
    margin: Margin,
    padding: Padding,
    width: Size,
  )
}

pub fn defaults() {
  ContainerOptions(
    background_color: color.none(),
    decoration: box_decoration.none(),
    height: SizeAuto(Auto),
    margin: margin.none(),
    padding: padding.none(),
    width: SizeAuto(Auto),
  )
}
