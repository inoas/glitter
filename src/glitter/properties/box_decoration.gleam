import gleam/option.{Option}
import glitter/properties/border.{Border}
import glitter/properties/border_radius.{BorderRadius}

/// Not Implemented:
/// - color: Option(Color)
/// - image: Option(DecorationImage)
/// - box_shadows: Option([BoxShadow])
/// - gradient: Option(Gradient)
/// - background_blend_mode: Option(BlendMode)
/// - shape: Option(BoxShape) = BoxShape.rectangle
///
pub type BoxDecoration {
  BoxDecoration(border: Border, border_radius: BorderRadius)
}

pub fn none() -> BoxDecoration {
  BoxDecoration(border: border.none(), border_radius: border_radius.none())
}

pub fn new(
  border: Option(Border),
  border_radius: Option(BorderRadius),
) -> BoxDecoration {
  let b = option.unwrap(border, or: border.none())
  let br = option.unwrap(border_radius, or: border_radius.none())

  BoxDecoration(border: b, border_radius: br)
}
