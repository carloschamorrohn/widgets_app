import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons Screen'),
        ),
        body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ));
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {},child: const Text('Elevated')),
            const ElevatedButton(onPressed: null,child: Text('Disabled')),
            ElevatedButton.icon(onPressed: (){}, 
            icon: const Icon(Icons.access_alarm_rounded),
            label: const Text('Elevated icon')),
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility_new), label: const Text('Filled icon'),),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.abc_rounded), label: const Text('Outlined icon'),), 
            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility), label: const Text('Text icon'),),
            IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline_outlined))
          ],
        ),
      ),
    );
  }
}
