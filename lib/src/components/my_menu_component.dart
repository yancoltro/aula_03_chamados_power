import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) {
        return <PopupMenuItem>[
          const PopupMenuItem(
            child: Text("Cadastro"),
            value: "/cadastro",
          ),
          const PopupMenuItem(
            child: Text("Chamados"),
            value: "/chamados",
          ),
        ];
      }),
      onSelected: (value) {
        // Navigator.of(context).pop();
        Navigator.of(context).pushNamed(value.toString());
      },
    );
  }
}