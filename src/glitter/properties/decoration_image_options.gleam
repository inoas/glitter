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
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}

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

pub type Attachment {
  FixedAtom(Fixed)
  ScrollAtom(Scroll)
}

pub type AttachmentPosition {
  AttachmentPosition(
    horizontal_anchor: HorizontalAnchorUnit,
    horizontal_offset: AttachmentPositionUnit,
    vertical_anchor: VerticalAnchorUnit,
    vertical_offset: AttachmentPositionUnit,
  )
}

pub type HorizontalAnchorUnit {
  HorizontalAnchorCenterAtom(Center)
  HorizontalAnchorLeftAtom(Left)
  HorizontalAnchorRightAtom(Right)
}

pub type VerticalAnchorUnit {
  VerticalAnchorBottomAtom(Bottom)
  VerticalAnchorCenterAtom(Center)
  VerticalAnchorTopAtom(Top)
}

pub type AttachmentPositionUnit {
  AttachmentPositionPercentUnit(Percent)
  AttachmentPositionPxUnit(Px)
  AttachmentPositionRemUnit(Rem)
  AttachmentPositionVhUnit(Vh)
  AttachmentPositionVwUnit(Vw)
}

pub type AttachmentRepeat {
  AttachmentRepeatAtomPair(x: RepeatUnit, y: RepeatUnit)
  AttachmentRepeatAtom(RepeatUnit)
}

pub type RepeatUnit {
  NoRepeatAtom(NoRepeat)
  RepeatAtom(Repeat)
  RoundAtom(Round)
  SpaceAtom(Space)
}

pub type AttachmentSize {
  CoverAtom(Cover)
  SizePair(x: AttachmentSizeUnit, y: AttachmentSizeUnit)
}

pub type AttachmentSizeUnit {
  AttachmentSizeAutoAtom(Auto)
  AttachmentSizePercentUnit(Percent)
  AttachmentSizePxUnit(Px)
  AttachmentSizeRemUnit(Rem)
  AttachmentSizeVhUnit(Vh)
  AttachmentSizeVwUnit(Vw)
}

pub fn defaults() {
  DecorationImageOptions(
    attachment: FixedAtom(Fixed),
    position: AttachmentPosition(
      horizontal_anchor: HorizontalAnchorLeftAtom(Left),
      horizontal_offset: AttachmentPositionPxUnit(Px(0.0)),
      vertical_anchor: VerticalAnchorTopAtom(Top),
      vertical_offset: AttachmentPositionPxUnit(Px(0.0)),
    ),
    repeat: AttachmentRepeatAtomPair(
      x: RepeatAtom(Repeat),
      y: RepeatAtom(Repeat),
    ),
    size: CoverAtom(Cover),
  )
}
