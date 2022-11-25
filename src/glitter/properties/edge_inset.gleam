import gleam/option.{Option}

pub type EdgeInset {
  EdgeInset(left: Int, top: Int, right: Int, bottom: Int)
}

pub fn none() -> EdgeInset {
  EdgeInset(left: 0, top: 0, right: 0, bottom: 0)
}

pub fn new(left l: Int, top t: Int, right r: Int, bottom b: Int) -> EdgeInset {
  EdgeInset(left: l, top: t, right: r, bottom: b)
}

pub fn all(n: Int) -> EdgeInset {
  EdgeInset(left: n, top: n, right: n, bottom: n)
}

pub fn symmetric(
  vertical v: Option(Int),
  horizontal h: Option(Int),
) -> EdgeInset {
  let h = option.unwrap(h, or: 0)
  let v = option.unwrap(v, or: 0)
  EdgeInset(left: h, top: v, right: h, bottom: v)
}
