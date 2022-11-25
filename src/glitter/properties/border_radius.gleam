import gleam/option.{Option}

pub type BorderRadius {
  BorderRadius(left: Int, top: Int, right: Int, bottom: Int)
}

pub fn none() -> BorderRadius {
  BorderRadius(left: 0, top: 0, right: 0, bottom: 0)
}

pub fn new(left l: Int, top t: Int, right r: Int, bottom b: Int) -> BorderRadius {
  BorderRadius(left: l, top: t, right: r, bottom: b)
}

pub fn all(n: Int) -> BorderRadius {
  BorderRadius(left: n, top: n, right: n, bottom: n)
}

pub fn symmetric(
  vertical v: Option(Int),
  horizontal h: Option(Int),
) -> BorderRadius {
  let h = option.unwrap(h, or: 0)
  let v = option.unwrap(v, or: 0)
  BorderRadius(left: h, top: v, right: h, bottom: v)
}
