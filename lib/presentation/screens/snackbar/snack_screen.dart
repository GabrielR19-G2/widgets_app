import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    // Builder -> Algo que se va a construir en tiempo de ejecución
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Eu ipsum reprehenderit qui ullamco. Sit ipsum amet sunt nostrud eiusmod. Cupidatat enim et voluptate labore amet ad aliqua culpa anim consequat non laboris. Nisi culpa consectetur consequat dolor officia consequat id magna elit aliquip reprehenderit ex fugiat. Occaecat ad nostrud esse incididunt excepteur cupidatat esse. Labore nulla nisi proident laboris in laborum ea ut qui.'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    children: [
                      const Text(
                          'Consectetur nostrud sit nisi esse sint consectetur commodo laborum ipsum enim qui incididunt cupidatat officia.')
                    ],
                  );
                },
                child: Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: Text('Mostrar diálogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
