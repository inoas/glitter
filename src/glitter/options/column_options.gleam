//// TODO:
////
//// ```
//// Column({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})
//// ```
//// See <https://api.flutter.dev/flutter/widgets/Column-class.html>
////

import glitter/box_element.{BoxElement, Div}
import glitter/flex_wrap.{FlexNoWrap, FlexWrap}
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/color.{Color}
import glitter/properties/margin.{Margin}
import glitter/properties/padding.{Padding}
import glitter/unit.{Unit}

pub type ColumnOptions {
  ColumnOptions(
    background_color: Color,
    decoration: BoxDecoration,
    height: Unit,
    gap: Unit,
    gap_x: Unit,
    gap_y: Unit,
    kind: BoxElement,
    margin: Margin,
    padding: Padding,
    reversed: Bool,
    width: Unit,
    wrap: FlexWrap,
  )
}

pub fn defaults() {
  ColumnOptions(
    background_color: color.none(),
    decoration: box_decoration.none(),
    height: unit.unset(),
    gap: unit.unset(),
    gap_x: unit.unset(),
    gap_y: unit.unset(),
    kind: Div,
    margin: margin.unset(),
    padding: padding.unset(),
    reversed: False,
    width: unit.unset(),
    wrap: FlexNoWrap,
  )
}
