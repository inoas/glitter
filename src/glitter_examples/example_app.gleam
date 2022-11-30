import gleam/int
import glitter.{Column, Container, ElevatedButton, NoWidget, Row, Text}
import glitter/atoms.{Auto}
import glitter/box_element.{Main}
import glitter/flex_wrap.{FlexWrap}
import glitter/options/column_options.{ColumnOptions}
import glitter/options/container_options.{ContainerOptions}
import glitter/options/row_options.{RowOptions}
import glitter/properties/color
import glitter/properties/margin
import glitter/properties/padding
import glitter/unit.{UnitAuto, UnitPercent, UnitPx}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
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
  Column(
    options: ColumnOptions(
      ..column_options.defaults(),
      width: UnitAuto(Auto),
      background_color: color.red(),
    ),
    widgets: [
      Row(
        options: RowOptions(
          ..row_options.defaults(),
          gap: UnitPx(Px(50.0)),
          width: UnitPercent(Percent(100.0)),
          background_color: color.green(),
          wrap: FlexWrap,
        ),
        widgets: [
          Container(
            options: ContainerOptions(
              ..container_options.defaults(),
              background_color: color.red(),
            ),
            widget: Text("Cats, the Gathering"),
          ),
          Container(
            options: ContainerOptions(
              ..container_options.defaults(),
              background_color: color.faff(),
            ),
            widget: Text("Search"),
          ),
          Container(
            options: ContainerOptions(
              ..container_options.defaults(),
              background_color: color.blue(),
            ),
            // width: UnitPercent(Percent(100.0)),
            widget: Text("Tail"),
          ),
          Container(
            options: ContainerOptions(
              ..container_options.defaults(),
              background_color: color.blue(),
              padding: padding.symmetric_px(8.0, 16.0),
              width: UnitPercent(Percent(100.0)),
            ),
            widget: NoWidget,
          ),
        ],
      ),
      Container(
        options: ContainerOptions(
          ..container_options.defaults(),
          kind: Main,
          background_color: color.black(),
          margin: margin.all_px(8.0)
          |> margin.with_auto_horizontal(),
          padding: padding.symmetric_px(8.0, 16.0),
        ),
        widget: Container(
          options: ContainerOptions(
            ..container_options.defaults(),
            background_color: color.faff(),
            height: unit.px(120.0),
            padding: padding.all_px(5.0),
            margin: margin.all_px(50.0),
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
      ),
    ],
  )
  |> glitter.to_lustre
}

pub fn main() {
  lustre.application(#(0, cmd.none()), update, render)
  |> lustre.start("#app")
}
