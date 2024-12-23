import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity, //Llega hasta lo que pueda el padre.
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          // Wrap -> Similar a columnas, lo pone de izquierda a derecha y cuando ya no cabe lo pondrá abajo
          child: Wrap(
            spacing: 10,
            // crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Elevated ')),
              const ElevatedButton(
                  onPressed: null, child: Text('Elevated Disabled')),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_alarm_rounded),
                  label: const Text('Elevated Icon')),
              FilledButton(
                onPressed: () {},
                child: const Text('Filled'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new_outlined),
                label: const Text('Filled Icon'),
              ),
              OutlinedButton(onPressed: () {}, child: const Text('Outline')),
              OutlinedButton.icon(
                onPressed: () {},
                label: const Text('Outlined icon'),
                icon: const Icon(Icons.terminal),
              ),
              TextButton(onPressed: () {}, child: const Text('Text')),
              TextButton.icon(
                  onPressed: () {},
                  label: const Text('Text'),
                  icon: const Icon(Icons.account_box_outlined)),

              //TODO: custom button

              const CustomButton(),

              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.app_registration_rounded)),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.primary),
                    iconColor: const MaterialStatePropertyAll(Colors.white)),
              ),
            ],
          )),
    );
  }
}

/// Botón personalizado
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          hoverColor: Colors.amber,
          splashColor: Colors.green,
          focusColor: Colors.blueAccent,
          // Como un gesture detector
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Hola mundo', style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
