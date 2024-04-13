import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Esse elit tempor quis Lorem elit velit consectetur nulla commodo eiusmod Lorem tempor proident.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Quis deserunt occaecat fugiat voluptate elit sint officia occaecat officia. Exercitation sint qui nulla labore. Aute ipsum cillum fugiat cillum occaecat nisi aliquip id pariatur excepteur nulla deserunt sit.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Fugiat ea aute in quis sunt. Elit fugiat excepteur ea mollit fugiat eiusmod proident id incididunt dolore exercitation officia. Id duis anim est duis. Culpa duis sit nostrud laborum elit quis nostrud ullamco cupidatat nostrud. Reprehenderit qui commodo elit cillum ullamco minim magna pariatur commodo nisi. Non est officia cillum nostrud veniam veniam labore. Sit reprehenderit veniam tempor est ipsum officia velit aute elit.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() { 
    final page = pageViewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController ,
            children: [
              for (final slide in slides)
                _Slide(
                  title: slide.title,
                  caption: slide.caption,
                  imageUrl: slide.imageUrl,
                ),
            ],
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('Salir'))),
          endReached ? 
          Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                child: const Text('Comenzar'),
                onPressed: () => context.pop(),
              ),
            ),
          ):const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(caption, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
