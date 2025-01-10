import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // Para saber que opción fue la seleccionado
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // determinando si tiene notch, cuánto es el padding en alguna dirección
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      child: NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          // nuevo indice que queremos
          setState(() {
            navDrawerIndex = value;
          });

          final menuItems = appMenuItems[value];
          context.push(menuItems.link);
          // Cerrando el drawer
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
              child: const Text('main')),
          // spread operator
          ...appMenuItems.sublist(0, 3).map(
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('More options'),
          ),
          ...appMenuItems.sublist(3).map(
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),

          // clonar y
          // Construyendo las opciones del menú
          // const NavigationDrawerDestination(
          //   icon: Icon(Icons.add),
          //   label: Text('Home Screen'),
          // ),
        ],
      ),
    );
  }
}
