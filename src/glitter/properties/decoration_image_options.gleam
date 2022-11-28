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
    horizontal_anchor: HorizontalAnchor,
    horizontal_offset: AttachmentPositionUnit,
    vertical_anchor: VerticalAnchor,
    vertical_offset: AttachmentPositionUnit,
  )
}

pub type HorizontalAnchor {
  HorizontalAnchorCenter(Center)
  HorizontalAnchorLeft(Left)
  HorizontalAnchorRight(Right)
}

pub type VerticalAnchor {
  VerticalAnchorBottom(Bottom)
  VerticalAnchorCenter(Center)
  VerticalAnchorTop(Top)
}

pub type AttachmentPositionUnit {
  AttachmentPositionPercent(Percent)
  AttachmentPositionPx(Px)
  AttachmentPositionRem(Rem)
  AttachmentPositionVh(Vh)
  AttachmentPositionVw(Vw)
}

pub type AttachmentRepeat {
  AttachmentRepeatPair(x: Repetition, y: Repetition)
  AttachmentRepeat(Repetition)
}

pub type Repetition {
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
  AttachmentSizePercent(Percent)
  AttachmentSizePx(Px)
  AttachmentSizeRem(Rem)
  AttachmentSizeVh(Vh)
  AttachmentSizeVw(Vw)
}

pub fn defaults() {
  DecorationImageOptions(
    attachment: AttachmentFixed(Fixed),
    position: AttachmentPosition(
      horizontal_anchor: HorizontalAnchorLeft(Left),
      horizontal_offset: AttachmentPositionPx(Px(0.0)),
      vertical_anchor: VerticalAnchorTop(Top),
      vertical_offset: AttachmentPositionPx(Px(0.0)),
    ),
    repeat: AttachmentRepeatPair(
      x: RepetitionRepeat(Repeat),
      y: RepetitionRepeat(Repeat),
    ),
    size: AttachmentSizeCover(Cover),
  )
}
