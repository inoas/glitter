import gleam/io
import gleam/option.{Some}
import glitter/atoms/no_repeat.{NoRepeat}
import glitter/properties/border
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/decoration_image_options.{
  AttachmentRepeatPair, DecorationImageOptions, NoRepeatAtom,
}
import glitter/properties/decoration_image.{DecorationImage}
import glitter/properties/padding
import glitter/widgets/base.{Container, ContainerWidget, Text, TextWidget}
import glitter/widgets/container_options.{ContainerOptions}

pub fn example() {
  let container =
    Container(
      widget: TextWidget(Text("Foo")),
      options: ContainerOptions(
        ..container_options.defaults(),
        padding: padding.all(5.0),
        decoration: BoxDecoration(
          ..box_decoration.none(),
          border: border.all(5.0),
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
    )

  let container_2 =
    Container(
      widget: ContainerWidget(container),
      options: container_options.defaults(),
    )

  io.debug(container_2)
  Nil
}
