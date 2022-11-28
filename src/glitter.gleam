import gleam/float
import gleam/int
import gleam/io
import gleam/list
import glitter/atoms/auto.{Auto}
import glitter/properties/color
import glitter/properties/margin.{
  MarginAuto, MarginPercent, MarginPx, MarginRem, MarginVh, MarginVw,
}
import glitter/properties/padding.{
  PaddingPercent, PaddingPx, PaddingRem, PaddingVh, PaddingVw,
}
import glitter/units/percent.{Percent}
import glitter/units/px.{Px}
import glitter/units/rem.{Rem}
import glitter/units/vh.{Vh}
import glitter/units/vw.{Vw}
import glitter/options/column_options.{ColumnOptions}
import glitter/options/container_options.{ContainerOptions}
import glitter/options/row_options.{RowOptions}
import lustre/attribute.{classes as lustre_classes, style as lustre_style}
import lustre/element.{
  button as lustre_button, div as lustre_div, text as lustre_text,
}
import lustre/event.{on_click as lustre_on_click}
import glitter/units/size.{
  SizeAuto, SizePercent, SizePx, SizeRem, SizeVh, SizeVw,
}

pub type Widget(action) {
  Text(body: String)
  Container(widget: Widget(action), options: ContainerOptions)
  Column(widgets: List(Widget(action)), options: ColumnOptions)
  Row(widgets: List(Widget(action)), options: RowOptions)
  TextButton(label: String, on_pressed: fn(action) -> Nil)
  ElevatedButton(label: String, on_pressed: fn(action) -> Nil)
  OutlinedButton(label: String, on_pressed: fn(action) -> Nil)
}

pub fn to_lustre(widget: Widget(action)) {
  case widget {
    Text(body: body) -> text_to_lustre(body)
    Container(widget: widget, options: options) ->
      container_to_lustre(widget, options)
    Column(widgets: widgets, options: options) ->
      column_to_lustre(widgets, options)
    Row(widgets: widgets, options: options) -> row_to_lustre(widgets, options)
    TextButton(label: label, on_pressed: on_pressed) ->
      text_button_to_lustre(label, on_pressed)
    ElevatedButton(label: label, on_pressed: on_pressed) ->
      elevated_button_to_lustre(label, on_pressed)
    OutlinedButton(label: label, on_pressed: on_pressed) ->
      outlined_button_to_lustre(label, on_pressed)
  }
}

fn text_to_lustre(string) {
  lustre_text(string)
}

fn container_to_lustre(widget, options) {
  let ContainerOptions(
    background_color: color,
    decoration: _decoration,
    height: height,
    margin: margin,
    padding: padding,
    width: width,
  ) = options

  let classes = lustre_classes([#("container", True)])
  let attributes = [classes]

  let styles = [#("display", "flex")]

  // background-color
  let color_none = color.to_rgba(color.none())
  let styles = case color.to_rgba(color) {
    color if color == color_none -> styles
    color -> [
      #(
        "backgroundColor",
        "rgba(" <> int.to_string(color.0) <> ", " <> int.to_string(color.1) <> ", " <> int.to_string(
          color.2,
        ) <> ", " <> float.to_string(color.3) <> ")",
      ),
      ..styles
    ]
  }

  let size_to_unit = fn(size) {
    case size {
      SizeAuto(Auto) -> "auto"
      SizePercent(Percent(percent_value)) ->
        float.to_string(percent_value) <> "%"
      SizePx(Px(px_value)) -> float.to_string(px_value) <> "px"
      SizeRem(Rem(rem_value)) -> float.to_string(rem_value) <> "rem"
      SizeVh(Vh(vh_value)) -> float.to_string(vh_value) <> "vh"
      SizeVw(Vw(vw_value)) -> float.to_string(vw_value) <> "vw"
    }
  }

  // height
  let height_auto = SizeAuto(Auto)
  let styles = case height {
    height if height == height_auto -> styles
    height -> [#("height", size_to_unit(height)), ..styles]
  }

  // padding
  let padding_none = padding.none()
  let padding_to_unit = fn(padding) {
    case padding {
      PaddingPercent(Percent(percent_value)) ->
        float.to_string(percent_value) <> "%"
      PaddingPx(Px(px_value)) -> float.to_string(px_value) <> "px"
      PaddingRem(Rem(rem_value)) -> float.to_string(rem_value) <> "rem"
      PaddingVh(Vh(vh_value)) -> float.to_string(vh_value) <> "vh"
      PaddingVw(Vw(vw_value)) -> float.to_string(vw_value) <> "vw"
    }
  }

  let styles = case padding {
    padding if padding == padding_none -> styles
    padding -> [
      #(
        "padding",
        padding_to_unit(padding.top) <> " " <> padding_to_unit(padding.right) <> " " <> padding_to_unit(
          padding.bottom,
        ) <> " " <> padding_to_unit(padding.left),
      ),
      ..styles
    ]
  }

  // margin
  let margin_none = margin.none()
  let margin_to_unit = fn(margin) {
    case margin {
      MarginAuto(Auto) -> "auto"
      MarginPercent(Percent(percent_value)) ->
        float.to_string(percent_value) <> "%"
      MarginPx(Px(px_value)) -> float.to_string(px_value) <> "px"
      MarginRem(Rem(rem_value)) -> float.to_string(rem_value) <> "rem"
      MarginVh(Vh(vh_value)) -> float.to_string(vh_value) <> "vh"
      MarginVw(Vw(vw_value)) -> float.to_string(vw_value) <> "vw"
    }
  }
  let styles = case margin {
    margin if margin == margin_none -> styles
    margin -> [
      #(
        "margin",
        margin_to_unit(margin.top) <> " " <> margin_to_unit(margin.right) <> " " <> margin_to_unit(
          margin.bottom,
        ) <> " " <> margin_to_unit(margin.left),
      ),
      ..styles
    ]
  }

  // width
  let width_auto = SizeAuto(Auto)
  let styles = case width {
    width if width == width_auto -> styles
    width -> [#("width", size_to_unit(width)), ..styles]
  }

  let attributes = [lustre_style(styles), ..attributes]
  let widget = to_lustre(widget)
  // let widget = lustre_text(string.inspect(widget))
  // let widget = lustre_text(string.inspect(attributes))
  lustre_div(attributes, [widget])
}

fn column_to_lustre(widgets, options) {
  let ColumnOptions(main_axis_alignment: _main_axis_alignment) = options
  let attributes = [lustre_classes([#("column", True)])]
  let widgets = list.map(widgets, to_lustre)
  lustre_div(attributes, widgets)
}

fn row_to_lustre(widgets, options) {
  let RowOptions(main_axis_alignment: _main_axis_alignment) = options
  let attributes = [lustre_classes([#("row", True)])]
  let widgets = list.map(widgets, to_lustre)
  lustre_div(attributes, widgets)
}

fn outlined_button_to_lustre(
  label label: String,
  on_pressed on_pressed: fn(action) -> Nil,
) {
  button_to_lustre(
    label: label,
    on_pressed: on_pressed,
    style_class_name: "outlined-button",
  )
}

fn text_button_to_lustre(
  label label: String,
  on_pressed on_pressed: fn(action) -> Nil,
) {
  button_to_lustre(
    label: label,
    on_pressed: on_pressed,
    style_class_name: "text-button",
  )
}

fn elevated_button_to_lustre(
  label label: String,
  on_pressed on_pressed: fn(action) -> Nil,
) {
  button_to_lustre(
    label: label,
    on_pressed: on_pressed,
    style_class_name: "elevated-button",
  )
}

fn button_to_lustre(
  label label: String,
  on_pressed on_pressed,
  style_class_name style_class_name: String,
) {
  let classes = lustre_classes([#("button", True), #(style_class_name, True)])
  let attributes = [classes]
  let attributes = [lustre_on_click(on_pressed), ..attributes]
  let children = [lustre_text(label)]
  lustre_button(attributes, children)
}

pub fn main() {
  io.println(
    "Notice: Run `make dev` to start a webserver with an example project!",
  )
}
