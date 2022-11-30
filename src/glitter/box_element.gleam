/// This is a subset of HTML/CSS block elements and some inline elements that
/// can behave like block by setting their display property.
///
/// Generally the subset here must allow nesting of other arbitrary block elements.
///
/// In HTML/CSS block elements are elements which break the vertical flow to
/// create a new block.
///
/// Thus in HTML/CSS
/// - `p` is a block element
/// - `button` is not a block element
/// - `label` is not a block element
/// - `span` is not a block element
/// - `ul` is not a block element
/// - `li` is not a block element
///
/// In Glitter box elements are those which can take arbitrary other box
/// elements. `p` is _not_ a box element in Glitter because it cannot
/// take arbitrary further elements.
///
/// Thus Glitter:
/// - `p` is _not_ a box element because it cannot take arbitrary box elements
/// - `button` could be a box element
///    because it can take arbitary box elements if set to display: block
/// - `label` is not a box element
///    because it can take arbitary box elements if set to display: block
/// - `span` is not a box element
/// - `ul` is not a box element
///
pub type BoxElement {
  Article
  Aside
  Div
  Footer
  H1
  H2
  H3
  H4
  H5
  H6
  Header
  Main
  Nav
  Section
  Address
}
