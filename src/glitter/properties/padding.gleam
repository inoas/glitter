import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}

pub type Padding {
  Padding(
    left: PaddingUnit,
    top: PaddingUnit,
    right: PaddingUnit,
    bottom: PaddingUnit,
  )
}

pub fn none() -> Padding {
  Padding(
    left: PaddingPxUnit(Px(0.0)),
    top: PaddingPxUnit(Px(0.0)),
    right: PaddingPxUnit(Px(0.0)),
    bottom: PaddingPxUnit(Px(0.0)),
  )
}

pub fn all_px(n: Float) -> Padding {
  Padding(
    left: PaddingPxUnit(Px(n)),
    top: PaddingPxUnit(Px(n)),
    right: PaddingPxUnit(Px(n)),
    bottom: PaddingPxUnit(Px(n)),
  )
}

pub fn symmetric_px(vertical v: Float, horizontal h: Float) -> Padding {
  Padding(
    left: PaddingPxUnit(Px(h)),
    top: PaddingPxUnit(Px(v)),
    right: PaddingPxUnit(Px(h)),
    bottom: PaddingPxUnit(Px(v)),
  )
}

pub fn all(
  l: PaddingUnit,
  t: PaddingUnit,
  r: PaddingUnit,
  b: PaddingUnit,
) -> Padding {
  Padding(left: l, top: t, right: r, bottom: b)
}

pub type PaddingUnit {
  PaddingRemUnit(Rem)
  PaddingPxUnit(Px)
  PaddingPercentUnit(Percent)
}
