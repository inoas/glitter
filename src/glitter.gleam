import gleam/io
import gleam/list
import glitter/properties/color
import glitter/properties/margin
import glitter/properties/padding
import glitter/options/column_options.{ColumnOptions}
import glitter/options/container_options.{ContainerOptions}
import glitter/options/row_options.{RowOptions}
import lustre/attribute.{classes as lustre_classes, style as lustre_style}
import lustre/element.{
  button as lustre_button, div as lustre_div, text as lustre_text,
}
import lustre/event.{on_click as lustre_on_click}
import glitter/units/size

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
    background_color: background_color,
    decoration: _decoration,
    height: height,
    margin: margin,
    padding: padding,
    width: width,
  ) = options

  let classes = [#("container", True)]
  let styles = []
  // style: background-color
  let background_color_none = color.none()
  let styles = case background_color {
    background_color if background_color == background_color_none -> styles
    background_color -> [
      #("backgroundColor", color.to_string(background_color)),
      ..styles
    ]
  }
  // style:  height
  let height_unset = size.unset()
  let styles = case height {
    height if height == height_unset -> styles
    height -> [#("height", size.to_string(height)), ..styles]
  }
  // style: padding
  let padding_unset = padding.unset()
  let styles = case padding {
    padding if padding == padding_unset -> styles
    padding -> [#("padding", padding.to_string(padding)), ..styles]
  }
  // style: margin
  let margin_unset = margin.unset()
  let styles = case margin {
    margin if margin == margin_unset -> styles
    margin -> [#("margin", margin.to_string(margin)), ..styles]
  }
  // style: width
  let width_unset = size.unset()
  let styles = case width {
    width if width == width_unset -> styles
    width -> [#("width", size.to_string(width)), ..styles]
  }

  let lustre_attributes = [lustre_style(styles), lustre_classes(classes)]
  let lustre_children = [to_lustre(widget)]
  lustre_div(lustre_attributes, lustre_children)
}

fn column_to_lustre(widgets, options) {
  let ColumnOptions(main_axis_alignment: _main_axis_alignment) = options
  let classes = [#("column", True)]

  let lustre_attributes = [lustre_classes(classes)]
  let lustre_children = list.map(widgets, to_lustre)
  lustre_div(lustre_attributes, lustre_children)
}

fn row_to_lustre(widgets, options) {
  let RowOptions(main_axis_alignment: _main_axis_alignment) = options
  let classes = [#("row", True)]

  let lustre_attributes = [lustre_classes(classes)]
  let lustre_children = list.map(widgets, to_lustre)
  lustre_div(lustre_attributes, lustre_children)
}

fn outlined_button_to_lustre(
  label label: String,
  on_pressed on_pressed: fn(action) -> Nil,
) {
  button_to_lustre(
    label: label,
    on_pressed: on_pressed,
    button_class_name: "outlined-button",
  )
}

fn text_button_to_lustre(
  label label: String,
  on_pressed on_pressed: fn(action) -> Nil,
) {
  button_to_lustre(
    label: label,
    on_pressed: on_pressed,
    button_class_name: "text-button",
  )
}

fn elevated_button_to_lustre(
  label label: String,
  on_pressed on_pressed: fn(action) -> Nil,
) {
  button_to_lustre(
    label: label,
    on_pressed: on_pressed,
    button_class_name: "elevated-button",
  )
}

fn button_to_lustre(
  label label: String,
  on_pressed on_pressed,
  button_class_name button_class_name: String,
) {
  let classes = [#("button", True), #(button_class_name, True)]

  let lustre_attributes = [lustre_on_click(on_pressed), lustre_classes(classes)]
  let lustre_children = [lustre_text(label)]
  lustre_button(lustre_attributes, lustre_children)
}

pub fn main() {
  io.println(
    "Notice: Run `make dev` to start a webserver with an example project!",
  )
}
