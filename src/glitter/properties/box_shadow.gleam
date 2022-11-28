import glitter/properties/color.{Color}
import glitter/properties/offset.{Offset}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type BoxShadow {
  BoxShadow(
    blur: BoxShadowRadius,
    color: Color,
    offset: Offset,
    spread: BoxShadowSpread,
  )
}

pub type BoxShadowSpread {
  BoxShadowSpreadPercent(Percent)
  BoxShadowSpreadPx(Px)
  BoxShadowSpreadRem(Rem)
  BoxShadowSpreadVh(Vh)
  BoxShadowSpreadVw(Vw)
}

pub type BoxShadowRadius {
  BoxShadowRadiusPercent(Percent)
  BoxShadowRadiusPx(Px)
  BoxShadowRadiusRem(Rem)
  BoxShadowRadiusVh(Vh)
  BoxShadowRadiusVw(Vw)
}

pub fn new(
  blur br: BoxShadowRadius,
  color c: Color,
  offset os: Offset,
  spread sr: BoxShadowSpread,
) -> BoxShadow {
  BoxShadow(blur: br, color: c, offset: os, spread: sr)
}

pub fn none() -> BoxShadow {
  BoxShadow(
    blur: BoxShadowRadiusPx(Px(0.0)),
    color: color.none(),
    offset: offset.none(),
    spread: BoxShadowSpreadPx(Px(0.0)),
  )
}

pub fn new_px(
  blur br: Float,
  color c: Color,
  offset os: Offset,
  spread sr: Float,
) -> BoxShadow {
  BoxShadow(
    blur: BoxShadowRadiusPx(Px(br)),
    color: c,
    offset: os,
    spread: BoxShadowSpreadPx(Px(sr)),
  )
}
