import 'package:flutter/material.dart';

buildHeader() {
  return const DrawerHeader(
    decoration: BoxDecoration(color: Color.fromRGBO(146, 33, 33, 1)),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/gcu.jpg'),
          radius: 40,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Government College',
          style: TextStyle(color: Colors.white, fontSize: 15),
        )
      ],
    ),
  );
}
