import glitter/atoms/auto.{Auto}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}

pub type Margin {
  Margin(
    left: MarginUnit,
    top: MarginUnit,
    right: MarginUnit,
    bottom: MarginUnit,
  )
}

pub fn none() -> Margin {
  Margin(
    left: MarginPxUnit(Px(0.0)),
    top: MarginPxUnit(Px(0.0)),
    right: MarginPxUnit(Px(0.0)),
    bottom: MarginPxUnit(Px(0.0)),
  )
}

pub fn px(
  left l: Float,
  top t: Float,
  right r: Float,
  bottom b: Float,
) -> Margin {
  Margin(
    left: MarginPxUnit(Px(l)),
    top: MarginPxUnit(Px(t)),
    right: MarginPxUnit(Px(r)),
    bottom: MarginPxUnit(Px(b)),
  )
}

pub fn all_px(n: Float) -> Margin {
  Margin(
    left: MarginPxUnit(Px(n)),
    top: MarginPxUnit(Px(n)),
    right: MarginPxUnit(Px(n)),
    bottom: MarginPxUnit(Px(n)),
  )
}

pub fn symmetric_px(vertical v: Float, horizontal h: Float) -> Margin {
  Margin(
    left: MarginPxUnit(Px(h)),
    top: MarginPxUnit(Px(v)),
    right: MarginPxUnit(Px(h)),
    bottom: MarginPxUnit(Px(v)),
  )
}

pub fn all(l: MarginUnit, t: MarginUnit, r: MarginUnit, b: MarginUnit) -> Margin {
  Margin(left: l, top: t, right: r, bottom: b)
}

pub fn horizontal_auto() -> Margin {
  let foo =
    Margin(
      left: MarginAutoAtom(Auto),
      top: MarginPxUnit(Px(0.0)),
      right: MarginAutoAtom(Auto),
      bottom: MarginPxUnit(Px(0.0)),
    )
  foo
}

pub fn with_horizontal_auto(margin: Margin) -> Margin {
  Margin(..margin, left: MarginAutoAtom(Auto), right: MarginAutoAtom(Auto))
}

pub type MarginUnit {
  MarginAutoAtom(Auto)
  MarginRemUnit(Rem)
  MarginPxUnit(Px)
  MarginPercentUnit(Percent)
}
