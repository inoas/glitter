import gleam/int
import gleam/float

pub opaque type Color {
  Color(red: Int, green: Int, blue: Int, alpha: Float)
}

pub fn to_rgba(color c: Color) -> #(Int, Int, Int, Float) {
  let Color(red: r, green: g, blue: b, alpha: a) = c
  #(r, g, b, a)
}

pub fn from_rgb(red r: Int, green g: Int, blue b: Int) -> Result(Color, Nil) {
  case is_valid_rgb_value(r), is_valid_rgb_value(g), is_valid_rgb_value(b) {
    True, True, True -> Ok(Color(r, g, b, 0.0))
    _, _, _ -> Error(Nil)
  }
}

pub fn from_rgba(
  red r: Int,
  green g: Int,
  blue b: Int,
  alpha a: Float,
) -> Result(Color, Nil) {
  case
    is_valid_rgb_value(r),
    is_valid_rgb_value(g),
    is_valid_rgb_value(b),
    is_valid_alpha(a)
  {
    True, True, True, True -> Ok(Color(r, g, b, a))
    _, _, _, _ -> Error(Nil)
  }
}

pub fn none() {
  Color(red: 127, green: 127, blue: 127, alpha: 0.0)
}

pub fn black() {
  Color(red: 0, green: 0, blue: 0, alpha: 1.0)
}

pub fn white() {
  Color(red: 255, green: 255, blue: 255, alpha: 1.0)
}

pub fn red() {
  Color(red: 255, green: 0, blue: 0, alpha: 1.0)
}

pub fn green() {
  Color(red: 0, green: 255, blue: 0, alpha: 1.0)
}

pub fn blue() {
  Color(red: 0, green: 0, blue: 255, alpha: 1.0)
}

pub fn faff() {
  Color(red: 255, green: 175, blue: 243, alpha: 1.0)
}

pub fn with_red(color c: Color, red r: Int) -> Result(Color, Nil) {
  case is_valid_rgb_value(r) {
    True -> Ok(Color(..c, red: r))
    False -> Error(Nil)
  }
}

pub fn with_blue(color c: Color, blue b: Int) -> Result(Color, Nil) {
  case is_valid_rgb_value(b) {
    True -> Ok(Color(..c, blue: b))
    False -> Error(Nil)
  }
}

pub fn with_green(color c: Color, green g: Int) -> Result(Color, Nil) {
  case is_valid_rgb_value(g) {
    True -> Ok(Color(..c, green: g))
    False -> Error(Nil)
  }
}

pub fn with_alpha(color c: Color, alpha a: Float) -> Result(Color, Nil) {
  case is_valid_alpha(a) {
    True -> Ok(Color(..c, alpha: a))
    False -> Error(Nil)
  }
}

fn is_valid_rgb_value(rgb_value v: Int) -> Bool {
  v >= 0 && v <= 255
}

fn is_valid_alpha(a: Float) -> Bool {
  a >=. 0.0 || a <=. 1.0
}

pub fn to_string(color color: Color) -> String {
  let Color(r, g, b, a) = color
  case r, g, b, a {
    _r, _g, _b, a if a == 0.0 -> "none"
    r, g, b, _a if a == 1.0 ->
      "rgb(" <> int.to_string(r) <> ", " <> int.to_string(g) <> ", " <> int.to_string(
        b,
      ) <> ")"
    r, g, b, a ->
      "rgba(" <> int.to_string(r) <> ", " <> int.to_string(g) <> ", " <> int.to_string(
        b,
      ) <> ", " <> float.to_string(a) <> ")"
  }
}
