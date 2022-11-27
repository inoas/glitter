import gleam/io
import glitter/widgets/container.{Container}
import glitter/widgets/container_options.{ContainerOptions}
import glitter/widgets/text.{Text}
import glitter/properties/padding
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/border
import glitter/properties/decoration_image.{DecorationImage}
import glitter/properties/decoration_image_options.{
  AttachmentRepeatPair, DecorationImageOptions, NoRepeatAtom,
}
import glitter/atoms/no_repeat.{NoRepeat}
import gleam/option.{Some}

pub fn example() {
  Container(
    child: Text("Hello World!"),
    options: ContainerOptions(
      ..container_options.defaults(),
      padding: padding.all(5.0),
      decoration: BoxDecoration(
        ..box_decoration.none(),
        border: border.all(5.0),
        decoration_image: Some(DecorationImage(
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
  )
  |> io.debug
}
