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

/// TODO:
/// - gradient
/// - background-blend-mode
/// - background-clip
/// - background-origin
/// - shape: Option(BoxShape) = BoxShape.rectangle
///
pub type DecorationImageOptions {
  DecorationImageOptions(
    attachment: Attachment,
    position: AttachmentPosition,
    repeat: AttachmentRepeat,
    size: AttachmentSize,
  )
}

pub fn defaults() {
  DecorationImageOptions(
    attachment: FixedAtom(Fixed),
    position: AttachmentPosition(
      horizontal_anchor: HorizontalAnchorLeftAtom(Left),
      horizontal_offset: PositionPxUnit(Px(0.0)),
      vertical_anchor: VerticalAnchorTopAtom(Top),
      vertical_offset: PositionPxUnit(Px(0.0)),
    ),
    repeat: AttachmentRepeatPair(x: RepeatAtom(Repeat), y: RepeatAtom(Repeat)),
    size: CoverAtom(Cover),
  )
}

pub type Attachment {
  FixedAtom(Fixed)
  ScrollAtom(Scroll)
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
  HorizontalAnchorCenterAtom(Center)
  HorizontalAnchorLeftAtom(Left)
  HorizontalAnchorRightAtom(Right)
}

pub type PositionVerticalAnchor {
  VerticalAnchorBottomAtom(Bottom)
  VerticalAnchorCenterAtom(Center)
  VerticalAnchorTopAtom(Top)
}

pub type PositionUnit {
  PositionPercentUnit(Percent)
  PositionPxUnit(Px)
  PositionRemUnit(Rem)
}

pub type AttachmentRepeat {
  AttachmentRepeatPair(x: RepeatUnit, y: RepeatUnit)
  AttachmentRepeatValue(RepeatUnit)
}

pub type RepeatUnit {
  NoRepeatAtom(NoRepeat)
  RepeatAtom(Repeat)
  RoundAtom(Round)
  SpaceAtom(Space)
}

pub type AttachmentSize {
  CoverAtom(Cover)
  SizePair(x: SizeUnit, y: SizeUnit)
}

pub type SizeUnit {
  SizeAutoAtom(Auto)
  SizePercentUnit(Percent)
  SizePxUnit(Px)
  SizeRemUnit(Rem)
}
