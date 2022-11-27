import glitter/widgets/container_options.{ContainerOptions}
import glitter/properties/color
import glitter/properties/padding
import glitter/properties/margin
import lustre/element.{
  button as lustre_button, div as lustre_div, text as lustre_text,
}
import gleam/int
import gleam/float
// import gleam/string
import lustre/attribute.{classes as lustre_classes, style as lustre_style}
import gleam/option.{None, Some}
import lustre/event.{on_click as lustre_on_click}

pub type Widget(action) {
  Container(widget: Widget(action), options: ContainerOptions)
  Text(body: String)
  TextButton(label: String, on_pressed: fn(action) -> Nil)
  ElevatedButton(label: String, on_pressed: fn(action) -> Nil)
  OutlinedButton(label: String, on_pressed: fn(action) -> Nil)
}

pub fn to_lustre(widget: Widget(action)) {
  case widget {
    Container(widget, options) -> container_to_lustre(widget, options)
    Text(body) -> text_to_lustre(body)
    TextButton(label, on_pressed) -> text_button_to_lustre(label, on_pressed)
    ElevatedButton(label, on_pressed) ->
      elevated_button_to_lustre(label, on_pressed)
    OutlinedButton(label, on_pressed) ->
      outlined_button_to_lustre(label, on_pressed)
  }
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

  let styles = [#("display", "flex")]

  // background-color
  let color_none = color.rgba(color.none())
  let styles = case color.rgba(color) {
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

  // height
  let styles = case height {
    None -> styles
    Some(height) -> [#("height", float.to_string(height) <> "px"), ..styles]
  }

  // padding
  let padding_none = padding.none()
  let styles = case padding {
    padding if padding == padding_none -> styles
    padding -> [
      #(
        "padding",
        float.to_string(padding.top) <> "px " <> float.to_string(padding.right) <> "px " <> float.to_string(
          padding.bottom,
        ) <> "px " <> float.to_string(padding.left) <> "px",
      ),
      ..styles
    ]
  }

  // margin
  let margin_none = margin.none()
  let styles = case margin {
    margin if margin == margin_none -> styles
    margin -> [
      #(
        "margin",
        float.to_string(margin.top) <> "px " <> float.to_string(margin.right) <> "px " <> float.to_string(
          margin.bottom,
        ) <> "px " <> float.to_string(margin.left) <> "px",
      ),
      ..styles
    ]
  }

  // width
  let styles = case width {
    None -> styles
    Some(width) -> [#("width", float.to_string(width) <> "px"), ..styles]
  }

  let attributes = [lustre_style(styles)]
  let widget = to_lustre(widget)
  // let widget = lustre_text(string.inspect(widget))
  // let widget = lustre_text(string.inspect(attributes))
  lustre_div(attributes, [widget])
}

fn text_to_lustre(string) {
  lustre_text(string)
}

fn outlined_button_to_lustre(string, on_pressed) {
  button_to_lustre(string, on_pressed, "outlined-button")
}

fn text_button_to_lustre(string, on_pressed) {
  button_to_lustre(string, on_pressed, "text-button")
}

fn elevated_button_to_lustre(string, on_pressed) {
  button_to_lustre(string, on_pressed, "elevated-button")
}

fn button_to_lustre(string, on_pressed, style_class_name: String) {
  let classes = lustre_classes([#("button", True), #(style_class_name, True)])
  let attributes = [classes]
  let attributes = [lustre_on_click(on_pressed), ..attributes]
  let children = [lustre_text(string)]
  lustre_button(attributes, children)
}
