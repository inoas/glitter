import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/atoms/auto.{Auto}

pub type Margin {
  Margin(
    left: MarginUnit,
    top: MarginUnit,
    right: MarginUnit,
    bottom: MarginUnit,
  )
}

pub type MarginUnit {
  MarginAutoAtom(Auto)
  MarginRemUnit(Rem)
  MarginPercentUnit(Percent)
  MarginPxUnit(Px)
}

pub fn none() -> Margin {
  Margin(
    left: MarginPxUnit(Px(0.0)),
    top: MarginPxUnit(Px(0.0)),
    right: MarginPxUnit(Px(0.0)),
    bottom: MarginPxUnit(Px(0.0)),
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

pub fn all_rem(n: Float) -> Margin {
  Margin(
    left: MarginRemUnit(Rem(n)),
    top: MarginRemUnit(Rem(n)),
    right: MarginRemUnit(Rem(n)),
    bottom: MarginRemUnit(Rem(n)),
  )
}

pub fn symmetric_rem(vertical v: Float, horizontal h: Float) -> Margin {
  Margin(
    left: MarginRemUnit(Rem(h)),
    top: MarginRemUnit(Rem(v)),
    right: MarginRemUnit(Rem(h)),
    bottom: MarginRemUnit(Rem(v)),
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

pub fn auto_horizontal() -> Margin {
  Margin(
    left: MarginAutoAtom(Auto),
    top: MarginPxUnit(Px(0.0)),
    right: MarginAutoAtom(Auto),
    bottom: MarginPxUnit(Px(0.0)),
  )
}

pub fn with_auto_horizontal(margin: Margin) -> Margin {
  Margin(..margin, left: MarginAutoAtom(Auto), right: MarginAutoAtom(Auto))
}
