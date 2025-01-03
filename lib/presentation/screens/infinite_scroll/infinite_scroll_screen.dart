import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = new ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // cuando estamos al final o cerca del final
      // scrollController.position.pixels// posición actual
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Load next page
        loadNextPage();
      }
      // scrollController.position.maxScrollExtent; // posición máxima
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  ///
  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;

    setState(() {}); //Redibujando lo que se tenga que redibujar
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    // TODO: Revisar si está montado el widget
    if (!isMounted) return; //Si no está montado, salimos
    setState(() {});
    // TODO: mover scroll
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));

    if (!isMounted) return;
    // sincrono
    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    // determinando si la persona está cerca del bottom/final
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
        scrollController.position.pixels +
            120, //A que posición (en pixeles) nos queremos mover
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  ///añadir 5 imagenes
  void addFiveImages() {
    final lastId = imagesIds.last;

    /// Barrer los elementos para insertar 5 más
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // construye bajo demanda.
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            itemCount: imagesIds.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
                placeholder: const AssetImage('assets/Images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: isLoading
              ? FadeIn(
                  child: SpinPerfect(
                      infinite: true, child: const Icon(Icons.refresh_rounded)),
                )
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))),
    );
  }
}
