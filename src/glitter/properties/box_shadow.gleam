import glitter/properties/color.{Color}
import glitter/properties/offset.{Offset}

pub type BoxShadow {
  BoxShadow(
    blur_radius: Float,
    color: Color,
    offset: Offset,
    spread_radius: Float,
  )
}

pub fn none() -> BoxShadow {
  BoxShadow(
    blur_radius: 0.0,
    color: color.none(),
    offset: offset.none(),
    spread_radius: 0.0,
  )
}

pub fn new(
  blur_radius br: Float,
  color c: Color,
  offset os: Offset,
  spread_radius sr: Float,
) -> BoxShadow {
  BoxShadow(blur_radius: br, color: c, offset: os, spread_radius: sr)
}
