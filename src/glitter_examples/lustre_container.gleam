import gleam/option.{Some}
import glitter/atoms/no_repeat.{NoRepeat}
import glitter/properties/border
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/color
import glitter/properties/margin
import glitter/properties/decoration_image_options.{
  AttachmentRepeatPair, DecorationImageOptions, NoRepeatAtom,
}
import glitter/properties/decoration_image.{DecorationImage}
import glitter/properties/padding
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
  Container(
    options: ContainerOptions(
      ..container_options.defaults(),
      background_color: color.blue(),
      margin: margin.new(4.0, 8.0, 12.0, 16.0),
      padding: padding.symmetric(8.0, 16.0),
    ),
    widget: Container(
      options: ContainerOptions(
        ..container_options.defaults(),
        background_color: color.red(),
        decoration: // Not implemented for rendering
        BoxDecoration(
          ..box_decoration.none(),
          border: border.all(5.0),
          image: Some(DecorationImage(
            path_or_url: "https://upload.wikimedia.org/wikipedia/commons/d/d0/Peace_dove_%283329620077%29.jpg",
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
        width: Some(200.0),
      ),
      widget: Text("Hello World!"),
    ),
  )
}
