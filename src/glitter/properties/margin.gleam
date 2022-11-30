import gleam/float
import glitter/atoms.{Auto, Unset}
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
  MarginUnset(Unset)
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

pub fn unset() -> Margin {
  Margin(
    left: MarginUnset(Unset),
    top: MarginUnset(Unset),
    right: MarginUnset(Unset),
    bottom: MarginUnset(Unset),
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

pub fn unit_to_string(margin_unit margin_unit: MarginUnit) -> String {
  case margin_unit {
    MarginUnset(Unset) -> "unset"
    MarginAuto(Auto) -> "auto"
    MarginPercent(Percent(percent_value)) ->
      float.to_string(percent_value) <> "%"
    MarginPx(Px(px_value)) -> float.to_string(px_value) <> "px"
    MarginRem(Rem(rem_value)) -> float.to_string(rem_value) <> "rem"
    MarginVh(Vh(vh_value)) -> float.to_string(vh_value) <> "vh"
    MarginVw(Vw(vw_value)) -> float.to_string(vw_value) <> "vw"
  }
}

pub fn to_string(margin margin: Margin) -> String {
  unit_to_string(margin.top) <> " " <> unit_to_string(margin.right) <> " " <> unit_to_string(
    margin.bottom,
  ) <> " " <> unit_to_string(margin.left)
}
