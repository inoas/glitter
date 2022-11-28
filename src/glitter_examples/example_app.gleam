import gleam/int
import gleam/option.{Some}
import glitter.{Column, Container, ElevatedButton, Row, Text}
import glitter/atoms/no_repeat.{NoRepeat}
import glitter/atoms/round.{Round}
import glitter/options/column_options
import glitter/options/container_options.{ContainerOptions}
import glitter/options/decoration_image_options.{
  AttachmentRepeats, DecorationImageOptions, RepetitionNoRepeat, RepetitionRound,
}
import glitter/options/row_options
import glitter/properties/border
import glitter/properties/box_decoration.{BoxDecoration}
import glitter/properties/color
import glitter/properties/decoration_image.{DecorationImage}
import glitter/properties/margin
import glitter/properties/padding
import glitter/units/size
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
      margin: margin.all_px(8.0)
      |> margin.with_auto_horizontal(),
      padding: padding.symmetric_px(8.0, 16.0),
    ),
    widget: Container(
      options: ContainerOptions(
        ..container_options.defaults(),
        background_color: color.faff(),
        height: size.px(120.0),
        padding: padding.all_px(5.0),
        margin: margin.all_px(50.0),
        decoration: BoxDecoration(
          ..box_decoration.none(),
          border: border.all_px(5.0),
          image: Some(DecorationImage(
            path_or_url: "https://upload.wikimedia.org/wikipedia/commons/8/8c/Peace_symbol_%28bold%29.svg",
            options: DecorationImageOptions(
              ..decoration_image_options.defaults(),
              repeat: AttachmentRepeats(
                x: RepetitionNoRepeat(NoRepeat),
                y: RepetitionRound(Round),
              ),
            ),
          )),
        ),
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
  |> glitter.to_lustre
}

pub fn main() {
  lustre.application(#(0, cmd.none()), update, render)
  |> lustre.start("#app")
}
