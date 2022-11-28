import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}

pub type Border {
  Border(
    left: BorderUnit,
    top: BorderUnit,
    right: BorderUnit,
    bottom: BorderUnit,
  )
}

pub type BorderUnit {
  BorderRemUnit(Rem)
  BorderPercentUnit(Percent)
  BorderPxUnit(Px)
}

pub fn none() -> Border {
  Border(
    left: BorderPxUnit(Px(0.0)),
    top: BorderPxUnit(Px(0.0)),
    right: BorderPxUnit(Px(0.0)),
    bottom: BorderPxUnit(Px(0.0)),
  )
}

pub fn all_px(n: Float) -> Border {
  Border(
    left: BorderPxUnit(Px(n)),
    top: BorderPxUnit(Px(n)),
    right: BorderPxUnit(Px(n)),
    bottom: BorderPxUnit(Px(n)),
  )
}

pub fn symmetric_px(vertical v: Float, horizontal h: Float) -> Border {
  Border(
    left: BorderPxUnit(Px(h)),
    top: BorderPxUnit(Px(v)),
    right: BorderPxUnit(Px(h)),
    bottom: BorderPxUnit(Px(v)),
  )
}

pub fn all_rem(n: Float) -> Border {
  Border(
    left: BorderRemUnit(Rem(n)),
    top: BorderRemUnit(Rem(n)),
    right: BorderRemUnit(Rem(n)),
    bottom: BorderRemUnit(Rem(n)),
  )
}

pub fn symmetric_rem(vertical v: Float, horizontal h: Float) -> Border {
  Border(
    left: BorderRemUnit(Rem(h)),
    top: BorderRemUnit(Rem(v)),
    right: BorderRemUnit(Rem(h)),
    bottom: BorderRemUnit(Rem(v)),
  )
}

pub fn new(
  left l: BorderUnit,
  top t: BorderUnit,
  right r: BorderUnit,
  bottom b: BorderUnit,
) -> Border {
  Border(left: l, top: t, right: r, bottom: b)
}
