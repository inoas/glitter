import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}

pub type BorderRadius {
  BorderRadius(
    left: BorderRadiusUnit,
    top: BorderRadiusUnit,
    right: BorderRadiusUnit,
    bottom: BorderRadiusUnit,
  )
}

pub type BorderRadiusUnit {
  BorderRadiusRemUnit(Rem)
  BorderRadiusPercentUnit(Percent)
  BorderRadiusPxUnit(Px)
}

pub fn none() -> BorderRadius {
  BorderRadius(
    left: BorderRadiusPxUnit(Px(0.0)),
    top: BorderRadiusPxUnit(Px(0.0)),
    right: BorderRadiusPxUnit(Px(0.0)),
    bottom: BorderRadiusPxUnit(Px(0.0)),
  )
}

pub fn all_px(n: Float) -> BorderRadius {
  BorderRadius(
    left: BorderRadiusPxUnit(Px(n)),
    top: BorderRadiusPxUnit(Px(n)),
    right: BorderRadiusPxUnit(Px(n)),
    bottom: BorderRadiusPxUnit(Px(n)),
  )
}

pub fn symmetric_px(vertical v: Float, horizontal h: Float) -> BorderRadius {
  BorderRadius(
    left: BorderRadiusPxUnit(Px(h)),
    top: BorderRadiusPxUnit(Px(v)),
    right: BorderRadiusPxUnit(Px(h)),
    bottom: BorderRadiusPxUnit(Px(v)),
  )
}

pub fn all_rem(n: Float) -> BorderRadius {
  BorderRadius(
    left: BorderRadiusRemUnit(Rem(n)),
    top: BorderRadiusRemUnit(Rem(n)),
    right: BorderRadiusRemUnit(Rem(n)),
    bottom: BorderRadiusRemUnit(Rem(n)),
  )
}

pub fn symmetric_rem(vertical v: Float, horizontal h: Float) -> BorderRadius {
  BorderRadius(
    left: BorderRadiusRemUnit(Rem(h)),
    top: BorderRadiusRemUnit(Rem(v)),
    right: BorderRadiusRemUnit(Rem(h)),
    bottom: BorderRadiusRemUnit(Rem(v)),
  )
}

pub fn new(
  left l: BorderRadiusUnit,
  top t: BorderRadiusUnit,
  right r: BorderRadiusUnit,
  bottom b: BorderRadiusUnit,
) -> BorderRadius {
  BorderRadius(left: l, top: t, right: r, bottom: b)
}
