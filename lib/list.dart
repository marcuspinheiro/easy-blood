import 'package:flutter/material.dart';

class ListTileExample extends StatelessWidget {
  const ListTileExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const listTiles = <Widget>[
      ListTile(
  title: Text('Horse'),
  subtitle: Text('A strong animal'),
  dense: true,
)
    ];
    // Directly returning a list of widgets is not common practice.
    // People usually use ListView.builder, c.f. "ListView.builder" example.
    // Here we mainly demostrate ListTile.
    return ListView(children: listTiles);
  }
}