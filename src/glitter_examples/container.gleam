import gleam/io
import glitter/widgets/container.{Container}
import glitter/widgets/container/container_options.{ContainerOptions}
import glitter/widgets/text.{Text}
import glitter/properties/padding

pub fn example() {
  Container(
    child: Text("Hello World!"),
    options: ContainerOptions(
      ..container_options.defaults(),
      padding: padding.all(5.0),
    ),
  )
  |> io.debug
}
