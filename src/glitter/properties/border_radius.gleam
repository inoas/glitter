import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type BorderRadius {
  BorderRadius(
    left: BorderRadiusUnit,
    top: BorderRadiusUnit,
    right: BorderRadiusUnit,
    bottom: BorderRadiusUnit,
  )
}

pub type BorderRadiusUnit {
  BorderRadiusPercent(Percent)
  BorderRadiusPx(Px)
  BorderRadiusRem(Rem)
  BorderRadiusVh(Vh)
  BorderRadiusVw(Vw)
}

pub fn new(
  left l: BorderRadiusUnit,
  top t: BorderRadiusUnit,
  right r: BorderRadiusUnit,
  bottom b: BorderRadiusUnit,
) -> BorderRadius {
  BorderRadius(left: l, top: t, right: r, bottom: b)
}

pub fn none() -> BorderRadius {
  BorderRadius(
    left: BorderRadiusPx(Px(0.0)),
    top: BorderRadiusPx(Px(0.0)),
    right: BorderRadiusPx(Px(0.0)),
    bottom: BorderRadiusPx(Px(0.0)),
  )
}

pub fn all_px(n: Float) -> BorderRadius {
  BorderRadius(
    left: BorderRadiusPx(Px(n)),
    top: BorderRadiusPx(Px(n)),
    right: BorderRadiusPx(Px(n)),
    bottom: BorderRadiusPx(Px(n)),
  )
}

pub fn symmetric_px(vertical v: Float, horizontal h: Float) -> BorderRadius {
  BorderRadius(
    left: BorderRadiusPx(Px(h)),
    top: BorderRadiusPx(Px(v)),
    right: BorderRadiusPx(Px(h)),
    bottom: BorderRadiusPx(Px(v)),
  )
}

pub fn all_rem(n: Float) -> BorderRadius {
  BorderRadius(
    left: BorderRadiusRem(Rem(n)),
    top: BorderRadiusRem(Rem(n)),
    right: BorderRadiusRem(Rem(n)),
    bottom: BorderRadiusRem(Rem(n)),
  )
}

pub fn symmetric_rem(vertical v: Float, horizontal h: Float) -> BorderRadius {
  BorderRadius(
    left: BorderRadiusRem(Rem(h)),
    top: BorderRadiusRem(Rem(v)),
    right: BorderRadiusRem(Rem(h)),
    bottom: BorderRadiusRem(Rem(v)),
  )
}
