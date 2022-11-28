import glitter/atoms/auto.{Auto}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type Margin {
  Margin(
    left: MarginUnit,
    top: MarginUnit,
    right: MarginUnit,
    bottom: MarginUnit,
  )
}

pub type MarginUnit {
  MarginAuto(Auto)
  MarginPercent(Percent)
  MarginPx(Px)
  MarginRem(Rem)
  MarginVh(Vh)
  MarginVw(Vw)
}

pub fn none() -> Margin {
  Margin(
    left: MarginPx(Px(0.0)),
    top: MarginPx(Px(0.0)),
    right: MarginPx(Px(0.0)),
    bottom: MarginPx(Px(0.0)),
  )
}

pub fn new(
  left l: MarginUnit,
  top t: MarginUnit,
  right r: MarginUnit,
  bottom b: MarginUnit,
) -> Margin {
  Margin(left: l, top: t, right: r, bottom: b)
}

pub fn all_px(n: Float) -> Margin {
  Margin(
    left: MarginPx(Px(n)),
    top: MarginPx(Px(n)),
    right: MarginPx(Px(n)),
    bottom: MarginPx(Px(n)),
  )
}

pub fn symmetric_px(vertical v: Float, horizontal h: Float) -> Margin {
  Margin(
    left: MarginPx(Px(h)),
    top: MarginPx(Px(v)),
    right: MarginPx(Px(h)),
    bottom: MarginPx(Px(v)),
  )
}

pub fn all_rem(n: Float) -> Margin {
  Margin(
    left: MarginRem(Rem(n)),
    top: MarginRem(Rem(n)),
    right: MarginRem(Rem(n)),
    bottom: MarginRem(Rem(n)),
  )
}

pub fn symmetric_rem(vertical v: Float, horizontal h: Float) -> Margin {
  Margin(
    left: MarginRem(Rem(h)),
    top: MarginRem(Rem(v)),
    right: MarginRem(Rem(h)),
    bottom: MarginRem(Rem(v)),
  )
}

// TODO: this should be removed in favour of using flexbox alignments
pub fn auto_horizontal() -> Margin {
  Margin(
    left: MarginAuto(Auto),
    top: MarginPx(Px(0.0)),
    right: MarginAuto(Auto),
    bottom: MarginPx(Px(0.0)),
  )
}

// TODO: this should be removed in favour of using flexbox alignments
pub fn with_auto_horizontal(margin: Margin) -> Margin {
  Margin(..margin, left: MarginAuto(Auto), right: MarginAuto(Auto))
}
