//// TODO:
////
//// ```
//// Row({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})
//// ```
//// See <https://api.flutter.dev/flutter/widgets/Row-class.html>
////

import glitter/units/size.{Size, SizeUnset}
import glitter/atoms/unset.{Unset}
import glitter/units/wrap_element.{Div, WrapElement}

pub type RowOptions {
  RowOptions(height: Size, width: Size, kind: WrapElement)
}

pub fn defaults() {
  RowOptions(height: SizeUnset(Unset), width: SizeUnset(Unset), kind: Div)
}
