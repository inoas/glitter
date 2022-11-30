//// TODO:
////
//// ```
//// Row({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})
//// ```
//// See <https://api.flutter.dev/flutter/widgets/Row-class.html>
////

import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/color.{Color}
import glitter/properties/margin.{Margin}
import glitter/properties/padding.{Padding}
import glitter/size.{Size}
import glitter/wrap_element.{Div, WrapElement}

pub type RowOptions {
  RowOptions(
    background_color: Color,
    decoration: BoxDecoration,
    height: Size,
    kind: WrapElement,
    margin: Margin,
    padding: Padding,
    width: Size,
  )
}

pub fn defaults() {
  RowOptions(
    background_color: color.none(),
    decoration: box_decoration.none(),
    height: size.unset(),
    kind: Div,
    margin: margin.unset(),
    padding: padding.unset(),
    width: size.unset(),
  )
}
