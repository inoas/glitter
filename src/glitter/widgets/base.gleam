import glitter/widgets/container_options.{ContainerOptions}

pub type Widget {
  ContainerWidget(Container)
  TextWidget(Text)
}

pub type Container {
  Container(widget: Widget, options: ContainerOptions)
}

pub type Text {
  Text(string: String)
}
