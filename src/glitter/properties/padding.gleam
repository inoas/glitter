import gleam/float
import glitter/atoms.{Unset}
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
  PaddingUnset(Unset)
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

pub fn unset() -> Padding {
  Padding(
    left: PaddingUnset(Unset),
    top: PaddingUnset(Unset),
    right: PaddingUnset(Unset),
    bottom: PaddingUnset(Unset),
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

pub fn unit_to_string(padding_unit padding_unit: PaddingUnit) -> String {
  case padding_unit {
    PaddingUnset(Unset) -> "unset"
    PaddingPercent(Percent(percent_value)) ->
      float.to_string(percent_value) <> "%"
    PaddingPx(Px(px_value)) -> float.to_string(px_value) <> "px"
    PaddingRem(Rem(rem_value)) -> float.to_string(rem_value) <> "rem"
    PaddingVh(Vh(vh_value)) -> float.to_string(vh_value) <> "vh"
    PaddingVw(Vw(vw_value)) -> float.to_string(vw_value) <> "vw"
  }
}

pub fn to_string(padding padding: Padding) -> String {
  unit_to_string(padding.top) <> " " <> unit_to_string(padding.right) <> " " <> unit_to_string(
    padding.bottom,
  ) <> " " <> unit_to_string(padding.left)
}
