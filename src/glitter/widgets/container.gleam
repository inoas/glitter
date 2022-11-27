import glitter/widgets/container_options.{ContainerOptions}
import glitter/widgets/text.{Text}

pub type Container {
  // How can I make a Container contain itself?
  Container(child: Text, options: ContainerOptions)
}
