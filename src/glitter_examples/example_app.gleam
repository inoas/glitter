import gleam/int
import gleam/option.{Some}
import glitter.{Column, Container, ElevatedButton, Row, Text}
import glitter/properties/color
import glitter/properties/margin
import glitter/properties/padding
import glitter/widgets/column_options
import glitter/widgets/container_options.{ContainerOptions}
import glitter/widgets/row_options
import lustre
import lustre/cmd
import lustre/event.{dispatch as lustre_dispatch}

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
  Container(
    options: ContainerOptions(
      ..container_options.defaults(),
      background_color: color.black(),
      margin: margin.with_horizontal_auto(margin.symmetric_px(
        vertical: 10.0,
        horizontal: 0.0,
      )),
      padding: padding.symmetric(8.0, 16.0),
    ),
    widget: Container(
      options: ContainerOptions(
        ..container_options.defaults(),
        background_color: color.faff(),
        height: Some(120.0),
        padding: padding.all(5.0),
        margin: margin.px(50.0, 50.0, 50.0, 50.0),
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
  |> glitter.to_lustre()
}

pub fn main() {
  lustre.application(#(0, cmd.none()), update, render)
  |> lustre.start("#app")
}
