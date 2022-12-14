import gleam/option.{None, Option}
import glitter/properties/border.{Border}
import glitter/properties/border_radius.{BorderRadius}
import glitter/properties/color.{Color}
import glitter/properties/box_shadow.{BoxShadow}
import glitter/properties/decoration_image.{DecorationImage}

pub type BoxDecoration {
  BoxDecoration(
    border: Border,
    border_radius: BorderRadius,
    box_shadows: List(BoxShadow),
    color: Color,
    image: Option(DecorationImage),
  )
}

pub fn none() -> BoxDecoration {
  BoxDecoration(
    border: border.none(),
    border_radius: border_radius.none(),
    box_shadows: [],
    color: color.none(),
    image: None,
  )
}
