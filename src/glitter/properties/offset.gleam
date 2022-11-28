import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type Offset {
  Offset(horizontal: OffsetUnit, vertical: OffsetUnit)
}

pub type OffsetUnit {
  OffsetPercentUnit(Percent)
  OffsetPxUnit(Px)
  OffsetRemUnit(Rem)
  OffsetVhUnit(Vh)
  OffsetVwUnit(Vw)
}

pub fn new(horizontal x: OffsetUnit, vertical y: OffsetUnit) -> Offset {
  Offset(horizontal: x, vertical: y)
}

pub fn none() -> Offset {
  Offset(horizontal: OffsetPxUnit(Px(0.0)), vertical: OffsetPxUnit(Px(0.0)))
}

pub fn px(horizontal x: Float, vertical y: Float) -> Offset {
  Offset(horizontal: OffsetPxUnit(Px(x)), vertical: OffsetPxUnit(Px(y)))
}
