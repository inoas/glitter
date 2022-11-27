import gleam/io
import glitter/properties/border
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/padding
import glitter/widgets/base.{Container, ContainerWidget, Text, TextWidget}
import glitter/widgets/container_options.{ContainerOptions}

pub fn example() {
  let text_container =
    Container(
      widget: TextWidget(Text("Foo")),
      options: ContainerOptions(
        ..container_options.defaults(),
        padding: padding.all(5.0),
      ),
    )

  let main_container =
    Container(
      widget: ContainerWidget(text_container),
      options: ContainerOptions(
        ..container_options.defaults(),
        decoration: BoxDecoration(
          ..box_decoration.none(),
          border: border.all(5.0),
        ),
      ),
    )

  io.debug(main_container)
}
