import gleam/int
import gleam/option.{Some}
import glitter/atoms/no_repeat.{NoRepeat}
import glitter/properties/border
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/color
import glitter/properties/decoration_image_options.{
  AttachmentRepeatPair, DecorationImageOptions, NoRepeatAtom,
}
import glitter/properties/decoration_image.{DecorationImage}
import glitter/properties/margin
import glitter/properties/padding
import glitter/widgets/base.{Column, Container, ElevatedButton, Row, Text}
import glitter/widgets/column_options
import glitter/widgets/container_options.{ContainerOptions}
import glitter/widgets/row_options
import lustre
import lustre/cmd
import lustre/event.{dispatch as lustre_dispatch}

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

fn render(state) {
  glitter_example(state)
  |> base.to_lustre()
}

pub fn glitter_example(state) {
  Container(
    options: ContainerOptions(
      ..container_options.defaults(),
      background_color: color.black(),
      margin: margin.new(50.0, 50.0, 50.0, 50.0),
      padding: padding.symmetric(8.0, 16.0),
    ),
    widget: Container(
      options: ContainerOptions(
        ..container_options.defaults(),
        background_color: color.faff(),
        height: Some(120.0),
        padding: padding.all(5.0),
        width: Some(200.0),
      ),
      widget: Column(
        options: column_options.defaults(),
        widgets: [
          Text("Counter: " <> int.to_string(state)),
          Row(
            options: row_options.defaults(),
            widgets: [
              ElevatedButton(label: "+", on_pressed: lustre_dispatch(Incr)),
              ElevatedButton(label: "-", on_pressed: lustre_dispatch(Decr)),
            ],
          ),
        ],
      ),
    ),
  )
}
