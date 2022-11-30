import gleam/io
import gleam/list
import glitter/options/column_options.{ColumnOptions}
import glitter/options/container_options.{ContainerOptions}
import glitter/options/row_options.{RowOptions}
import glitter/properties/color.{Color}
import glitter/properties/margin.{Margin}
import glitter/properties/padding.{Padding}
import glitter/size.{Size}
import glitter/flex_wrap.{FlexNoWrap, FlexWrap, FlexWrapReverse}
import glitter/box_element.{
  Address, Article, Aside, BoxElement, Div, Footer, H1, H2, H3, H4, H5, H6,
  Header, Main, Nav, Section,
}
import lustre/attribute.{classes as lustre_classes, style as lustre_style}
import lustre/element.{
  address as lustre_address, article as lustre_article, aside as lustre_aside,
  button as lustre_button, div as lustre_div, footer as lustre_footer,
  h1 as lustre_h1, h2 as lustre_h2, h3 as lustre_h3, h4 as lustre_h4,
  h5 as lustre_h5, h6 as lustre_h6, header as lustre_header, main as lustre_main,
  nav as lustre_nav, section as lustre_section, text as lustre_text,
}
import lustre/event.{on_click as lustre_on_click}

pub type Widget(action) {
  Column(widgets: List(Widget(action)), options: ColumnOptions)
  Container(widget: Widget(action), options: ContainerOptions)
  ElevatedButton(label: String, on_pressed: fn(action) -> Nil)
  NoWidget
  OutlinedButton(label: String, on_pressed: fn(action) -> Nil)
  Row(widgets: List(Widget(action)), options: RowOptions)
  Text(body: String)
  TextButton(label: String, on_pressed: fn(action) -> Nil)
}

pub fn to_lustre(widget: Widget(action)) {
  case widget {
    Column(widgets: widgets, options: options) ->
      column_to_lustre(widgets, options)
    Container(widget: widget, options: options) ->
      container_to_lustre(widget, options)
    NoWidget -> text_to_lustre("")
    ElevatedButton(label: label, on_pressed: on_pressed) ->
      elevated_button_to_lustre(label, on_pressed)
    OutlinedButton(label: label, on_pressed: on_pressed) ->
      outlined_button_to_lustre(label, on_pressed)
    Row(widgets: widgets, options: options) -> row_to_lustre(widgets, options)
    Text(body: body) -> text_to_lustre(body)
    TextButton(label: label, on_pressed: on_pressed) ->
      text_button_to_lustre(label, on_pressed)
  }
}

pub fn call_lustre_element(
  wrap_ box_element: BoxElement,
  lustre_attributes,
  lustre_children,
) {
  case box_element {
    Address -> lustre_address(lustre_attributes, lustre_children)
    Article -> lustre_article(lustre_attributes, lustre_children)
    Aside -> lustre_aside(lustre_attributes, lustre_children)
    Div -> lustre_div(lustre_attributes, lustre_children)
    Footer -> lustre_footer(lustre_attributes, lustre_children)
    H1 -> lustre_h1(lustre_attributes, lustre_children)
    H2 -> lustre_h2(lustre_attributes, lustre_children)
    H3 -> lustre_h3(lustre_attributes, lustre_children)
    H4 -> lustre_h4(lustre_attributes, lustre_children)
    H5 -> lustre_h5(lustre_attributes, lustre_children)
    H6 -> lustre_h6(lustre_attributes, lustre_children)
    Header -> lustre_header(lustre_attributes, lustre_children)
    Main -> lustre_main(lustre_attributes, lustre_children)
    Nav -> lustre_nav(lustre_attributes, lustre_children)
    Section -> lustre_section(lustre_attributes, lustre_children)
  }
}

fn text_to_lustre(string) {
  lustre_text(string)
}

fn with_background_color(
  styles: List(#(String, String)),
  background_color: Color,
) {
  let background_color_none = color.none()
  case background_color {
    background_color if background_color == background_color_none -> styles
    background_color -> [
      #("backgroundColor", color.to_string(background_color)),
      ..styles
    ]
  }
}

fn with_height(styles: List(#(String, String)), height: Size) {
  case height == size.unset() {
    True -> styles
    False -> [#("height", size.to_string(height)), ..styles]
  }
}

fn with_gap(
  styles: List(#(String, String)),
  gap: Size,
  gap_x: Size,
  gap_y: Size,
) {
  let gap_unset = size.unset()
  io.debug(#(gap != gap_unset, gap_x != gap_unset, gap_y != gap_unset))
  case gap != gap_unset, gap_x != gap_unset, gap_y != gap_unset {
    False, False, False -> styles
    False, False, True -> [#("rowGap", size.to_string(gap_y)), ..styles]
    False, True, False -> [#("columnGap", size.to_string(gap_x)), ..styles]
    False, True, True -> [
      #("gap", size.to_string(gap_y) <> " " <> size.to_string(gap_x)),
      ..styles
    ]
    True, False, False -> [#("gap", size.to_string(gap)), ..styles]
    True, False, True -> [
      #("gap", size.to_string(gap) <> " " <> size.to_string(gap_x)),
      ..styles
    ]
    True, True, False -> [
      #("gap", size.to_string(gap_y) <> " " <> size.to_string(gap)),
      ..styles
    ]
    True, True, True -> [
      #("gap", size.to_string(gap_y) <> " " <> size.to_string(gap_x)),
      ..styles
    ]
  }
}

fn with_row_reverse_flex_direction(
  styles: List(#(String, String)),
  reverse_flow: Bool,
) {
  case reverse_flow {
    False -> styles
    True -> [#("flexDirection", "row-reverse"), ..styles]
  }
}

fn with_column_reverse_flex_direction(
  styles: List(#(String, String)),
  reverse_flow: Bool,
) {
  case reverse_flow {
    False -> styles
    True -> [#("flexDirection", "column-reverse"), ..styles]
  }
}

fn with_flex_wrap(styles: List(#(String, String)), wrap: FlexWrap) {
  case wrap {
    FlexNoWrap -> styles
    FlexWrap -> [#("flexWrap", "wrap"), ..styles]
    FlexWrapReverse -> [#("flexWrap", "wrapReverse"), ..styles]
  }
}

fn with_margin(styles: List(#(String, String)), margin: Margin) {
  case margin == margin.unset() {
    True -> styles
    False -> [#("margin", margin.to_string(margin)), ..styles]
  }
}

fn with_padding(styles: List(#(String, String)), padding: Padding) {
  case padding == padding.unset() {
    True -> styles
    False -> [#("padding", padding.to_string(padding)), ..styles]
  }
}

fn with_width(styles: List(#(String, String)), width: Size) {
  case width == size.unset() {
    True -> styles
    False -> [#("width", size.to_string(width)), ..styles]
  }
}

fn container_to_lustre(widget, options) {
  let ContainerOptions(
    background_color: background_color,
    decoration: _decoration,
    height: height,
    kind: box_element,
    margin: margin,
    padding: padding,
    width: width,
  ) = options

  let classes = [#("container", True)]
  let styles =
    []
    |> with_background_color(background_color)
    |> with_height(height)
    |> with_margin(margin)
    |> with_padding(padding)
    |> with_width(width)

  let lustre_attributes = [lustre_style(styles), lustre_classes(classes)]
  let lustre_children = [to_lustre(widget)]
  call_lustre_element(box_element, lustre_attributes, lustre_children)
}

fn column_to_lustre(widgets, options) {
  let ColumnOptions(
    background_color: background_color,
    decoration: _decoration,
    gap: gap,
    gap_x: gap_x,
    gap_y: gap_y,
    height: height,
    kind: box_element,
    margin: margin,
    padding: padding,
    reversed: column_reverse_flex_direction,
    width: width,
    wrap: flex_wrap,
  ) = options

  let classes = [#("column", True)]
  let styles =
    []
    |> with_background_color(background_color)
    |> with_flex_wrap(flex_wrap)
    |> with_gap(gap, gap_x, gap_y)
    |> with_height(height)
    |> with_margin(margin)
    |> with_padding(padding)
    |> with_column_reverse_flex_direction(column_reverse_flex_direction)
    |> with_width(width)

  let lustre_attributes = [lustre_style(styles), lustre_classes(classes)]
  let lustre_children = list.map(widgets, to_lustre)
  call_lustre_element(box_element, lustre_attributes, lustre_children)
}

fn row_to_lustre(widgets, options) {
  let RowOptions(
    background_color: background_color,
    decoration: _decoration,
    gap: gap,
    gap_x: gap_x,
    gap_y: gap_y,
    height: height,
    kind: box_element,
    margin: margin,
    padding: padding,
    reversed: row_reverse_flex_direction,
    width: width,
    wrap: flex_wrap,
  ) = options

  let classes = [#("row", True)]
  let styles =
    []
    |> with_background_color(background_color)
    |> with_flex_wrap(flex_wrap)
    |> with_gap(gap, gap_x, gap_y)
    |> with_height(height)
    |> with_margin(margin)
    |> with_padding(padding)
    |> with_row_reverse_flex_direction(row_reverse_flex_direction)
    |> with_width(width)

  let lustre_attributes = [lustre_style(styles), lustre_classes(classes)]
  let lustre_children = list.map(widgets, to_lustre)
  call_lustre_element(box_element, lustre_attributes, lustre_children)
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
