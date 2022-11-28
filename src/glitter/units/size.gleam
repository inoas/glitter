import gleam/float
import glitter/atoms/auto.{Auto}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type Size {
  SizeAuto(Auto)
  SizePercent(Percent)
  SizePx(Px)
  SizeRem(Rem)
  SizeVh(Vh)
  SizeVw(Vw)
}

pub fn px(size size: Float) {
  SizePx(Px(size))
}

pub fn to_string(size) -> String {
  case size {
    SizeAuto(Auto) -> "auto"
    SizePercent(Percent(percent_value)) -> float.to_string(percent_value) <> "%"
    SizePx(Px(px_value)) -> float.to_string(px_value) <> "px"
    SizeRem(Rem(rem_value)) -> float.to_string(rem_value) <> "rem"
    SizeVh(Vh(vh_value)) -> float.to_string(vh_value) <> "vh"
    SizeVw(Vw(vw_value)) -> float.to_string(vw_value) <> "vw"
  }
}
