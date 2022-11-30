import glitter/atoms.{
  Auto, Bottom, Center, Cover, Fixed, Left, NoRepeat, Repeat, Right, Round,
  Scroll, Space, Top,
}
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
  AttachmentRepeats(x: Repetition, y: Repetition)
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
  AttachmentSizes(x: AttachmentSizeUnit, y: AttachmentSizeUnit)
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
    repeat: AttachmentRepeats(
      x: RepetitionRepeat(Repeat),
      y: RepetitionRepeat(Repeat),
    ),
    size: AttachmentSizeCover(Cover),
  )
}
