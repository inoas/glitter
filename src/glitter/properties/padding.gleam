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

pub fn symmetric(
  vertical v: Option(Float),
  horizontal h: Option(Float),
) -> Padding {
  let h = option.unwrap(h, or: 0.0)
  let v = option.unwrap(v, or: 0.0)
  Padding(left: h, top: v, right: h, bottom: v)
}
