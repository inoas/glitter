import gleam/option.{Option}

pub type Padding {
  Padding(left: Float, top: Float, right: Float, bottom: Float)
}

pub fn none() -> Padding {
  Padding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
}

pub fn new(
  left l: Float,
  top t: Float,
  right r: Float,
  bottom b: Float,
) -> Padding {
  Padding(left: l, top: t, right: r, bottom: b)
}

pub fn all(n: Float) -> Padding {
  Padding(left: n, top: n, right: n, bottom: n)
}

pub fn symmetric(vertical v: Float, horizontal h: Float) -> Padding {
  Padding(left: h, top: v, right: h, bottom: v)
}
