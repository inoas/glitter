//// TODO:
////
//// ```
//// Row({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})
//// ```
//// See <https://api.flutter.dev/flutter/widgets/Row-class.html>
////

pub type RowOptions {
  RowOptions(main_axis_alignment: String)
}

pub fn defaults() {
  RowOptions(main_axis_alignment: "")
}
