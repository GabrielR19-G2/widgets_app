import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      'Enim non adipisicing esse reprehenderit sit enim velit minim magna ullamco commodo sit proident.',
      'assets/Images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Qui proident sit magna sunt anim ex consequat mollit aute ullamco proident eu.',
      'assets/Images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Officia esse Lorem minim incididunt occaecat irure proident eiusmod.',
      'assets/Images/3.png'),
];

class AppTutorial extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorial({super.key});

  @override
  State<AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // lo que se tenga aquí, se va a emitir muchas veces
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      // 1.5 -> porque cuando va a la mitad de 1 y 2, ya se cumple (antes de pasar al último slide)
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
      print('${pageviewController.page}');
    });
  }

  // cuando se usa stateful
  // limpia los listeners
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              // Controller -> Sirve para determinar en que slide estamos, para poner pausa, etc.
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList(),
            ),
            Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Exit'),
                onPressed: () => context.pop(),
              ),
            ),
            endReached
                ? Positioned(
                    bottom: 30,
                    right: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(seconds: 1),
                      child: FilledButton(
                          onPressed: () => context.pop(),
                          child: const Text('Comenzar')),
                    ))
                : const SizedBox()
          ],
        ));
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
