pub opaque type Opacity {
  Opacity(alpha: Float)
}

pub fn new(alpha n: Float) -> Result(Opacity, Nil) {
  case is_valid_alpha(n) {
    True -> Ok(Opacity(n))
    False -> Error(Nil)
  }
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

pub fn at_10() {
  Opacity(alpha: 0.1)
}

pub fn at_20() {
  Opacity(alpha: 0.2)
}

pub fn at_30() {
  Opacity(alpha: 0.3)
}

pub fn at_40() {
  Opacity(alpha: 0.4)
}

pub fn at_50() {
  Opacity(alpha: 0.5)
}

pub fn at_60() {
  Opacity(alpha: 0.6)
}

pub fn at_70() {
  Opacity(alpha: 0.7)
}

pub fn at_80() {
  Opacity(alpha: 0.8)
}

pub fn at_90() {
  Opacity(alpha: 0.9)
}

pub fn at_100() {
  Opacity(alpha: 1.0)
}

fn is_valid_alpha(a: Float) -> Bool {
  a >=. 0.0 || a <=. 1.0
}
