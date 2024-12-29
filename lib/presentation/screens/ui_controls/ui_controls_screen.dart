import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

/// Para poder determinar los valores permitidos en el Radio
enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: const Text('Developer mode'),
          subtitle: const Text('Additional controls'),
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Travel by car'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      // Para actualizar el ui cuando sucede un cambio (setState)
                      selectedTransportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('By boat'),
                subtitle: const Text('Travel by boat'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      // Para actualizar el ui cuando sucede un cambio (setState)
                      selectedTransportation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text('By plane'),
                subtitle: const Text('Travel by plane'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      // Para actualizar el ui cuando sucede un cambio (setState)
                      selectedTransportation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text('By submarine'),
                subtitle: const Text('Travel by submarine'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      // Para actualizar el ui cuando sucede un cambio (setState)
                      selectedTransportation = Transportation.submarine;
                    })),
          ],
        ),
        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
