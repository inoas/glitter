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
  AttachmentFixed(Fixed)
  AttachmentScroll(Scroll)
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
  HorizontalAnchorCenter(Center)
  HorizontalAnchorLeft(Left)
  HorizontalAnchorRight(Right)
}

pub type VerticalAnchorUnit {
  VerticalAnchorBottom(Bottom)
  VerticalAnchorCenter(Center)
  VerticalAnchorTop(Top)
}

pub type AttachmentPositionUnit {
  AttachmentPositionPercentUnit(Percent)
  AttachmentPositionPxUnit(Px)
  AttachmentPositionRemUnit(Rem)
  AttachmentPositionVhUnit(Vh)
  AttachmentPositionVwUnit(Vw)
}

pub type AttachmentRepeat {
  AttachmentRepeatPair(x: RepetitionUnit, y: RepetitionUnit)
  AttachmentRepeat(RepetitionUnit)
}

pub type RepetitionUnit {
  RepetitionNoRepeat(NoRepeat)
  RepetitionRepeat(Repeat)
  RepetitionRound(Round)
  RepetitionSpace(Space)
}

pub type AttachmentSize {
  AttachmentSizeCover(Cover)
  AttachmentSizePair(x: AttachmentSizeUnit, y: AttachmentSizeUnit)
}

pub type AttachmentSizeUnit {
  AttachmentSizeAuto(Auto)
  AttachmentSizePercentUnit(Percent)
  AttachmentSizePxUnit(Px)
  AttachmentSizeRemUnit(Rem)
  AttachmentSizeVhUnit(Vh)
  AttachmentSizeVwUnit(Vw)
}

pub fn defaults() {
  DecorationImageOptions(
    attachment: AttachmentFixed(Fixed),
    position: AttachmentPosition(
      horizontal_anchor: HorizontalAnchorLeft(Left),
      horizontal_offset: AttachmentPositionPxUnit(Px(0.0)),
      vertical_anchor: VerticalAnchorTop(Top),
      vertical_offset: AttachmentPositionPxUnit(Px(0.0)),
    ),
    repeat: AttachmentRepeatPair(
      x: RepetitionRepeat(Repeat),
      y: RepetitionRepeat(Repeat),
    ),
    size: AttachmentSizeCover(Cover),
  )
}
