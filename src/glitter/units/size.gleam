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
