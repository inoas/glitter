import gleam/io
import gleam/option.{Some}
import glitter.{Container, Text}
import glitter/atoms/no_repeat.{NoRepeat}
import glitter/properties/border
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/decoration_image_options.{
  AttachmentRepeatPair, DecorationImageOptions, NoRepeatAtom,
}
import glitter/properties/decoration_image.{DecorationImage}
import glitter/properties/padding
import glitter/widgets/container_options.{ContainerOptions}

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
            path_or_url: "/foo/bar.png",
            options: DecorationImageOptions(
              ..decoration_image_options.defaults(),
              repeat: AttachmentRepeatPair(
                x: NoRepeatAtom(NoRepeat),
                y: NoRepeatAtom(NoRepeat),
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
