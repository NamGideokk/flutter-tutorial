// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LeadingMenu extends StatefulWidget {
  const LeadingMenu({Key? key}) : super(key: key);

  @override
  State<LeadingMenu> createState() => _LeadingMenuState();
}

class _LeadingMenuState extends State<LeadingMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: Text('leadingMenu'),
    );
  }
}
