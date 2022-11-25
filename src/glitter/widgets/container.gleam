////
//// Not Implemented:
//// - ClipBehavior
//// - key: Option(String),
//// - alignment: Option(String),
//// - color: Option(String),
//// - decoration: Option(String),
//// - foreground_decoration: Option(String),
//// - width: Option(String),
//// - height: Option(String),
//// - constraints: Option(String),
//// - margin: Option(String),
//// - transform: Option(String),
//// - transform_alignment: Option(String),
////

import gleam/option.{None, Option}
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/edge_inset.{EdgeInset}
import glitter/properties/margin.{Margin}
import glitter/widgets/widget.{Widget}

pub type Container {
  Container(
    child: Widget,
    decoration: Option(BoxDecoration),
    height: Option(Int),
    margin: Option(Margin),
    padding: Option(EdgeInset),
  )
}

pub fn defaults(child) {
  Container(
    // Must specify `child` this but do not want to:
    child: child,
    decoration: None,
    height: None,
    margin: None,
    padding: None,
  )
}
