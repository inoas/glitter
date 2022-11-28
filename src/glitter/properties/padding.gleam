import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type Padding {
  Padding(
    left: PaddingUnit,
    top: PaddingUnit,
    right: PaddingUnit,
    bottom: PaddingUnit,
  )
}

pub type PaddingUnit {
  PaddingPercent(Percent)
  PaddingPx(Px)
  PaddingRem(Rem)
  PaddingVh(Vh)
  PaddingVw(Vw)
}

pub fn none() -> Padding {
  Padding(
    left: PaddingPx(Px(0.0)),
    top: PaddingPx(Px(0.0)),
    right: PaddingPx(Px(0.0)),
    bottom: PaddingPx(Px(0.0)),
  )
}

pub fn all_px(n: Float) -> Padding {
  Padding(
    left: PaddingPx(Px(n)),
    top: PaddingPx(Px(n)),
    right: PaddingPx(Px(n)),
    bottom: PaddingPx(Px(n)),
  )
}

pub fn symmetric_px(vertical v: Float, horizontal h: Float) -> Padding {
  Padding(
    left: PaddingPx(Px(h)),
    top: PaddingPx(Px(v)),
    right: PaddingPx(Px(h)),
    bottom: PaddingPx(Px(v)),
  )
}

pub fn all_rem(n: Float) -> Padding {
  Padding(
    left: PaddingRem(Rem(n)),
    top: PaddingRem(Rem(n)),
    right: PaddingRem(Rem(n)),
    bottom: PaddingRem(Rem(n)),
  )
}

pub fn symmetric_rem(vertical v: Float, horizontal h: Float) -> Padding {
  Padding(
    left: PaddingRem(Rem(h)),
    top: PaddingRem(Rem(v)),
    right: PaddingRem(Rem(h)),
    bottom: PaddingRem(Rem(v)),
  )
}

pub fn new(
  left l: PaddingUnit,
  top t: PaddingUnit,
  right r: PaddingUnit,
  bottom b: PaddingUnit,
) -> Padding {
  Padding(left: l, top: t, right: r, bottom: b)
}
