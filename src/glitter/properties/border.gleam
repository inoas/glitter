import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type Border {
  Border(
    left: BorderUnit,
    top: BorderUnit,
    right: BorderUnit,
    bottom: BorderUnit,
  )
}

pub type BorderUnit {
  BorderPercent(Percent)
  BorderPx(Px)
  BorderRem(Rem)
  BorderVh(Vh)
  BorderVw(Vw)
}

pub fn new(
  left l: BorderUnit,
  top t: BorderUnit,
  right r: BorderUnit,
  bottom b: BorderUnit,
) -> Border {
  Border(left: l, top: t, right: r, bottom: b)
}

pub fn none() -> Border {
  Border(
    left: BorderPx(Px(0.0)),
    top: BorderPx(Px(0.0)),
    right: BorderPx(Px(0.0)),
    bottom: BorderPx(Px(0.0)),
  )
}

pub fn all_px(n: Float) -> Border {
  Border(
    left: BorderPx(Px(n)),
    top: BorderPx(Px(n)),
    right: BorderPx(Px(n)),
    bottom: BorderPx(Px(n)),
  )
}

pub fn symmetric_px(vertical v: Float, horizontal h: Float) -> Border {
  Border(
    left: BorderPx(Px(h)),
    top: BorderPx(Px(v)),
    right: BorderPx(Px(h)),
    bottom: BorderPx(Px(v)),
  )
}

pub fn all_rem(n: Float) -> Border {
  Border(
    left: BorderRem(Rem(n)),
    top: BorderRem(Rem(n)),
    right: BorderRem(Rem(n)),
    bottom: BorderRem(Rem(n)),
  )
}

pub fn symmetric_rem(vertical v: Float, horizontal h: Float) -> Border {
  Border(
    left: BorderRem(Rem(h)),
    top: BorderRem(Rem(v)),
    right: BorderRem(Rem(h)),
    bottom: BorderRem(Rem(v)),
  )
}
