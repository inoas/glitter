# Glitter TODO

Flutter:


```dart
Container(
  padding: const EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Icons.kitchen, color: Colors.green[500]),
          const Text('PREP:'),
          const Text('25 min'),
        ],
      ),
      Column(
        children: [
          Icon(Icons.timer, color: Colors.green[500]),
          const Text('COOK:'),
          const Text('1 hr'),
        ],
      ),
      Column(
        children: [
          Icon(Icons.restaurant, color: Colors.green[500]),
          const Text('FEEDS:'),
          const Text('4-6'),
        ],
      ),
    ],
  ),
)
```

Glitter:

```gleam
Container(
  ..container.defaults,
  padding: EdgeInsets.all(20),
  child: Row(
    ..row.defaults,
    main_axis_alignment = MainAxisAlignmentSpaceEvenly,
    children: [
      Column(
        ..column.defaults,
        children: [
          Icon(
            ..icon.defaults,
            icon_data: Icons.timer,
            color: Colors.green(500),
          ),
          Text("PREP: "),
          Text("25 min"),
        ],
      ),
      Column(
        ..column.defaults,
        children: [
          Icon(
            ..icon.defaults,
            icon_data: Icons.timer,
            color: Colors.green(500),
          ),
          Text("COOK: "),
          Text("1 hr"),
        ],
      ),
      Column(
        ..column.defaults,
        children: [
          Icon(
            ..icon.defaults,
            icon_data: Icons.timer,
            color: Colors.green(500),
          ),
          Text('FEEDS:'),
          Text('4-6'),
        ],
      ),
    ],
  ),
)
```