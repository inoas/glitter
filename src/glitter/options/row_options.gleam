//// TODO:
////
//// ```
//// Row({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})
//// ```
//// See <https://api.flutter.dev/flutter/widgets/Row-class.html>
////

import glitter/flex_wrap.{FlexNoWrap, FlexWrap}
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/color.{Color}
import glitter/properties/margin.{Margin}
import glitter/properties/padding.{Padding}
import glitter/size.{Size}
import glitter/box_element.{BoxElement, Div}

pub type RowOptions {
  RowOptions(
    background_color: Color,
    decoration: BoxDecoration,
    gap: Size,
    gap_x: Size,
    gap_y: Size,
    height: Size,
    kind: BoxElement,
    margin: Margin,
    padding: Padding,
    width: Size,
    wrap: FlexWrap,
  )
}

pub fn defaults() {
  RowOptions(
    background_color: color.none(),
    decoration: box_decoration.none(),
    gap: size.unset(),
    gap_x: size.unset(),
    gap_y: size.unset(),
    height: size.unset(),
    kind: Div,
    margin: margin.unset(),
    padding: padding.unset(),
    width: size.unset(),
    wrap: FlexNoWrap,
  )
}
