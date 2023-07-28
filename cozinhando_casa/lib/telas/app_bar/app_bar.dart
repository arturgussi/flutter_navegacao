import 'package:flutter/material.dart';

class ApplicationToolbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ApplicationToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text('Cozinhando em Casa'));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
