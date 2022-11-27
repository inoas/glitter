import gleam/option.{Some}
import glitter/atoms/no_repeat.{NoRepeat}
import glitter/properties/border
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/decoration_image_options.{
  AttachmentRepeatPair, DecorationImageOptions, NoRepeatAtom,
}
import glitter/properties/decoration_image.{DecorationImage}
import glitter/properties/padding
import glitter/properties/color
import glitter/widgets/base.{Container, Text}
import glitter/widgets/container_options.{ContainerOptions}
import lustre
import lustre/cmd

pub fn main() {
  let app = lustre.application(#(0, cmd.none()), update, render)
  lustre.start(app, "#app")
}

pub type Action {
  Incr
  Decr
}

fn update(state, action) {
  case action {
    Incr -> #(state + 1, cmd.none())
    Decr -> #(state - 1, cmd.none())
  }
}

fn render(_state) {
  base.to_lustre(glitter_example())
}

pub fn glitter_example() {
  let container =
    Container(
      widget: Text("Foo"),
      options: ContainerOptions(
        ..container_options.defaults(),
        background_color: color.red(),
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
        height: Some(120.0),
        padding: padding.all(5.0),
        width: Some(80.0),
      ),
    )

  let container_2 =
    Container(widget: container, options: container_options.defaults())

  container_2
}
