import glitter/atoms/auto.{Auto}
import glitter/atoms/bottom.{Bottom}
import glitter/atoms/center.{Center}
import glitter/atoms/cover.{Cover}
import glitter/atoms/fixed.{Fixed}
import glitter/atoms/left.{Left}
import glitter/atoms/no_repeat.{NoRepeat}
import glitter/atoms/repeat.{Repeat}
import glitter/atoms/right.{Right}
import glitter/atoms/round.{Round}
import glitter/atoms/scroll.{Scroll}
import glitter/atoms/space.{Space}
import glitter/atoms/top.{Top}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}

pub type DecorationImageOptions {
  DecorationImageOptions(
    attachment: Attachment,
    position: AttachmentPosition,
    repeat: AttachmentRepeat,
    size: Size,
  )
}

pub fn defaults() {
  DecorationImageOptions(
    attachment: AttachmentFixed(Fixed),
    position: AttachmentPosition(
      horizontal_anchor: PositionHorizontalAnchorLeft(Left),
      horizontal_offset: PositionUnitPx(Px(0.0)),
      vertical_anchor: PositionVerticalAnchorTop(Top),
      vertical_offset: PositionUnitPx(Px(0.0)),
    ),
    repeat: AttachmentRepeatPair(x: RepeatAtom(Repeat), y: RepeatAtom(Repeat)),
    size: CoverAtom(Cover),
  )
}

pub type Attachment {
  AttachmentFixed(Fixed)
  AttachmentScroll(Scroll)
}

pub type AttachmentPosition {
  AttachmentPosition(
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

pub type AttachmentRepeat {
  AttachmentRepeatValue(RepeatUnit)
  AttachmentRepeatPair(x: RepeatUnit, y: RepeatUnit)
}

pub type RepeatUnit {
  RepeatAtom(Repeat)
  NoRepeatAtom(NoRepeat)
  SpaceAtom(Space)
  RoundAtom(Round)
}

pub type Size {
  CoverAtom(Cover)
  SizeUnitPair(x: SizeUnit, y: SizeUnit)
}

pub type SizeUnit {
  SizeUnitAuto(Auto)
  SizeUnitRem(Rem)
  SizeUnitPx(Px)
  SizeUnitPercent(Percent)
}
