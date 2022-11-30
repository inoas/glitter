import gleam/float
import glitter/atoms.{Auto, Unset}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type Unit {
  UnitAuto(Auto)
  UnitUnset(Unset)
  UnitPercent(Percent)
  UnitPx(Px)
  UnitRem(Rem)
  UnitVh(Vh)
  UnitVw(Vw)
}

pub fn px(size size: Float) {
  UnitPx(Px(size))
}

pub fn unset() {
  UnitUnset(Unset)
}

pub fn auto() {
  UnitAuto(Auto)
}

pub fn to_string(size) -> String {
  case size {
    UnitAuto(Auto) -> "auto"
    UnitUnset(Unset) -> "unset"
    UnitPercent(Percent(percent_value)) -> float.to_string(percent_value) <> "%"
    UnitPx(Px(px_value)) -> float.to_string(px_value) <> "px"
    UnitRem(Rem(rem_value)) -> float.to_string(rem_value) <> "rem"
    UnitVh(Vh(vh_value)) -> float.to_string(vh_value) <> "vh"
    UnitVw(Vw(vw_value)) -> float.to_string(vw_value) <> "vw"
  }
}
