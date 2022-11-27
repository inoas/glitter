pub type Offset {
  Offset(horizontal: Float, vertical: Float)
}

pub fn none() -> Offset {
  Offset(horizontal: 0.0, vertical: 0.0)
}

pub fn new(horizontal x: Float, vertical y: Float) -> Offset {
  Offset(x, y)
}
