import gleam/io
import gleam/option.{Some}
import glitter.{Container, Text}
import glitter/atoms/no_repeat.{NoRepeat}
import glitter/atoms/round.{Round}
import glitter/properties/border
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/decoration_image.{DecorationImage}
import glitter/properties/padding
import glitter/options/container_options.{ContainerOptions}
import glitter/options/decoration_image_options.{
  AttachmentRepeats, DecorationImageOptions, RepetitionNoRepeat, RepetitionRound,
}

pub fn example() {
  Container(
    widget: Container(
      widget: Text("Foo"),
      options: ContainerOptions(
        ..container_options.defaults(),
        padding: padding.all_px(5.0),
        decoration: BoxDecoration(
          ..box_decoration.none(),
          border: border.all_px(5.0),
          image: Some(DecorationImage(
            path_or_url: "https://upload.wikimedia.org/wikipedia/commons/8/8c/Peace_symbol_%28bold%29.svg",
            options: DecorationImageOptions(
              ..decoration_image_options.defaults(),
              repeat: AttachmentRepeats(
                x: RepetitionNoRepeat(NoRepeat),
                y: RepetitionRound(Round),
              ),
            ),
          )),
        ),
      ),
    ),
    options: container_options.defaults(),
  )
  |> io.debug
}
