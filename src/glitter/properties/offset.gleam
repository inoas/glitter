import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

pub type Offset {
  Offset(horizontal: OffsetUnit, vertical: OffsetUnit)
}

pub type OffsetUnit {
  OffsetPercent(Percent)
  OffsetPx(Px)
  OffsetRem(Rem)
  OffsetVh(Vh)
  OffsetVw(Vw)
}

pub fn new(horizontal x: OffsetUnit, vertical y: OffsetUnit) -> Offset {
  Offset(horizontal: x, vertical: y)
}

pub fn none() -> Offset {
  Offset(horizontal: OffsetPx(Px(0.0)), vertical: OffsetPx(Px(0.0)))
}

pub fn px(horizontal x: Float, vertical y: Float) -> Offset {
  Offset(horizontal: OffsetPx(Px(x)), vertical: OffsetPx(Px(y)))
}
