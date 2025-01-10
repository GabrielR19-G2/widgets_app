import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Estar pendiente de nuestro counter_provider
    // Cada vez que cambia el valor, flutter va a redibujar donde sea necesario
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined)),
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO Actualizar valor counter
            // No usar watch en métodos. -> Pésima práctica
            // notifier -> Hace referencia al que va a hacer la notificación. state -> transformar el valor
            ref.read(counterProvider.notifier).state++;

            // otra forma de hacerlo
            // ref.read(counterProvider.notifier).update((state) => state + 1);
          },
          child: const Icon(Icons.add)),
    );
  }
}

// counter_screen
// icons.add
