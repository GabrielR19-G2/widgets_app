import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + material3'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  // Si es privado, no es necesario utilizar key
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    // Text('nombre')
    // ListTile
    ///Se va a contruir en tiempo de ejecución
    return ListView.builder(
      // physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_outlined,
          color: colors.primary), //Widget que va al final
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        print('${menuItem.title}');
        // TODO: Navegar a otras pantallas
      },
    );
  }
}
