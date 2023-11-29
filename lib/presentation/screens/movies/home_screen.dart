import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/views/views.dart';


class HomeScreen extends StatefulWidget {

  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//Este Micin es necesario para mantener el estado en el PageView
class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    PopularView(),
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if(pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeIn,
        duration: const Duration(microseconds: 250),
      );
    }

    return Scaffold(
      body: PageView(
        //Evitar que rebote
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.pageIndex,
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}