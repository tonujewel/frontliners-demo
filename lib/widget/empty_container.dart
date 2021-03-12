import 'package:flutter/material.dart';

class EmptyContainer extends StatefulWidget {
  @override
  _EmptyContainerState createState() => _EmptyContainerState();
}

class _EmptyContainerState extends State<EmptyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/images/empty.png',height: 150),
      ),
    );
  }
}
