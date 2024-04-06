import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controles de UI'),
      ),
      body: _UiControllsView(),
    );
  }
}

enum Transportation { car, bike, boat, bus }

class _UiControllsView extends StatefulWidget {
  const _UiControllsView();

  @override
  State<_UiControllsView> createState() => _UiControllsViewState();
}

class _UiControllsViewState extends State<_UiControllsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
            title: const Text('Developer mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() => isDeveloper = !isDeveloper)),

        ExpansionTile(
            title: const Text('Vehiculo de transporte'),
            subtitle: Text('$selectedTransportation'),
            children: [
              RadioListTile(
                  title: const Text('By Car'),
                  subtitle: const Text('Viajar en carro'),
                  value: Transportation.car,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(() {
                        selectedTransportation = Transportation.car;
                      })),
              RadioListTile(
                  title: const Text('By Bike'),
                  subtitle: const Text('Viajar en moto'),
                  value: Transportation.bike,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(() {
                        selectedTransportation = Transportation.bike;
                      })),
              RadioListTile(
                  title: const Text('By Boat'),
                  subtitle: const Text('Viajar en barco'),
                  value: Transportation.boat,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(() {
                        selectedTransportation = Transportation.boat;
                      })),
              RadioListTile(
                  title: const Text('By Bus'),
                  subtitle: const Text('Viajar en bus'),
                  value: Transportation.bus,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(() {
                        selectedTransportation = Transportation.bus;
                      }))
            ]),
            //TODO 
        CheckboxListTile(
          title: const Text('Incluir Desayuno'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() => wantsBreakfast = !wantsBreakfast)),
        CheckboxListTile(
          title: const Text('Incluir Almuerzo'),
          value: wantsLunch, 
          onChanged: (value) => setState(() => wantsLunch = !wantsLunch)),
        CheckboxListTile(
          title: const Text('Incluir Cena'),
          value: wantsDinner, 
          onChanged: (value) => setState(() => wantsDinner = !wantsDinner))
      ],
    );
  }
}
