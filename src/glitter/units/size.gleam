import glitter/atoms/auto.{Auto}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type Size {
  SizeAuto(Auto)
  SizePercentUnit(Percent)
  SizePxUnit(Px)
  SizeRemUnit(Rem)
  SizeVhUnit(Vh)
  SizeVwUnit(Vw)
}

pub fn px(size size: Float) {
  SizePxUnit(Px(size))
}
