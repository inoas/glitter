import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}

pub type Offset {
  Offset(horizontal: OffsetUnit, vertical: OffsetUnit)
}

pub fn none() -> Offset {
  Offset(horizontal: OffsetPxUnit(Px(0.0)), vertical: OffsetPxUnit(Px(0.0)))
}

pub fn new(horizontal x: Float, vertical y: Float) -> Offset {
  Offset(horizontal: OffsetPxUnit(Px(x)), vertical: OffsetPxUnit(Px(y)))
}

pub type OffsetUnit {
  OffsetPercentUnit(Percent)
  OffsetPxUnit(Px)
  OffsetRemUnit(Rem)
}
