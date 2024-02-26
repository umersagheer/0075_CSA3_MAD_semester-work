import 'package:flutter/material.dart';

buildItem(
    {required IconData icon,
    required String title,
    required GestureTapCallback onTap}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: onTap,
    minLeadingWidth: 5,
  );
}
