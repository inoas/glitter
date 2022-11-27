import glitter/atoms/auto.{Auto}
import glitter/atoms/bottom.{Bottom}
import glitter/atoms/center.{Center}
import glitter/atoms/cover.{Cover}
import glitter/atoms/fixed.{Fixed}
import glitter/atoms/left.{Left}
import glitter/atoms/right.{Right}
import glitter/atoms/scroll.{Scroll}
import glitter/atoms/top.{Top}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}

pub type DecorationImage {
  // TODO:
  // attachment
  // position
  // repeat
  DecorationImage(
    attachment: Attachment,
    path_or_url: String,
    position: Position,
    repeat: String,
    size: Size,
  )
}

pub type Attachment {
  Fixed(Fixed)
  Scroll(Scroll)
}

pub type Position {
  Position(
    horizontal_anchor: PositionHorizontalAnchor,
    horizontal_offset: PositionUnit,
    vertical_anchor: PositionVerticalAnchor,
    vertical_offset: PositionUnit,
  )
}

pub type PositionHorizontalAnchor {
  PositionHorizontalAnchorCenter(Center)
  PositionHorizontalAnchorLeft(Left)
  PositionHorizontalAnchorRight(Right)
}

pub type PositionVerticalAnchor {
  PositionVerticalAnchorBottom(Bottom)
  PositionVerticalAnchorCenter(Center)
  PositionVerticalAnchorTop(Top)
}

pub type PositionUnit {
  PositionUnitRem(Rem)
  PositionUnitPx(Px)
  PositionUnitPercent(Percent)
}

pub type Size {
  Cover(Cover)
  SizeUnitPair(SizeUnit, SizeUnit)
}

pub type SizeUnit {
  SizeUnitAuto(Auto)
  SizeUnitRem(Rem)
  SizeUnitPx(Px)
  SizeUnitPercent(Percent)
}
