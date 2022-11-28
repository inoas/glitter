//// TODO:
////
//// ```
//// Column({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})
//// ```
//// See <https://api.flutter.dev/flutter/widgets/Column-class.html>
////

pub type ColumnOptions {
  ColumnOptions(main_axis_alignment: String)
}

pub fn defaults() {
  ColumnOptions(main_axis_alignment: "")
}
