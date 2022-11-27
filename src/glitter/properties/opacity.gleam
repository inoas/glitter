pub opaque type Opacity {
  Opacity(alpha: Float)
}

pub fn none() {
  Opacity(alpha: 0.0)
}

pub fn one_quarter() {
  Opacity(alpha: 0.25)
}

pub fn one_third() {
  Opacity(alpha: 1.0 /. 3.0)
}

pub fn half() {
  Opacity(alpha: 0.5)
}

pub fn two_thirds() {
  Opacity(alpha: 2.0 /. 3.0)
}

pub fn three_quarters() {
  Opacity(alpha: 0.75)
}

pub fn full() {
  Opacity(alpha: 1.0)
}

pub fn new(alpha n: Float) -> Result(Opacity, Nil) {
  case is_valid_alpha(n) {
    True -> Ok(Opacity(n))
    False -> Error(Nil)
  }
}

fn is_valid_alpha(a: Float) -> Bool {
  a >=. 0.0 || a <=. 1.0
}
