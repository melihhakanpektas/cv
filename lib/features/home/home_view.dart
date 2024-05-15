import 'package:cv/features/custom_app_bar/custom_app_bar.dart';
import 'package:cv/features/home/pages/about_me/about_me.dart';
import 'package:cv/features/home/pages/contact/contact_view.dart';
import 'package:cv/features/home/pages/main/main_view.dart';
import 'package:cv/features/home/pages/projects/projects_view.dart';
import 'package:cv/shared/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  final List<ScrollController> _scrollControllers = [
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
  ];
  final ValueNotifier<int> _currentPage = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: kMainColor,
              ),
              child: Center(
                child: Text(
                  'Melih Hakan Pektas',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 25,
                    fontFamily: GoogleFonts.orbitron().fontFamily!,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                    shadows: const [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Hello'),
              onTap: () {
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('About Me'),
              onTap: () {
                _pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Projects'),
              onTap: () {
                _pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                _pageController.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: CustomAppBar(
          fontFamily: GoogleFonts.lato().fontFamily!,
          backgroundColor: kMainColor,
          actions: MediaQuery.of(context).size.width > kMobileMaxContentWidth
              ? [
                  actionsText(
                    'Hello',
                    onPressed: () {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  const SizedBox(width: 20.0),
                  actionsText(
                    'About Me',
                    onPressed: () {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  const SizedBox(width: 20.0),
                  actionsText(
                    'Projects',
                    onPressed: () {
                      _pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  const SizedBox(width: 20.0),
                  actionsText(
                    'Contact',
                    onPressed: () {
                      _pageController.animateToPage(
                        3,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ]
              : [const EndDrawerButton()]),
      body: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            if (event.scrollDelta.dy > 0 &&
                _scrollControllers[_currentPage.value].position.pixels ==
                    _scrollControllers[_currentPage.value].position.maxScrollExtent) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else if (_scrollControllers[_currentPage.value].position.pixels == 0 &&
                event.scrollDelta.dy < 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          }
        },
        child: Center(
          child: SizedBox(
            width: kMaxContentWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPageIndicator(width),
                Expanded(
                  child: Column(
                    children: [
                      _buildUpButton(),
                      Expanded(
                        child: Center(
                          child: ValueListenableBuilder(
                              valueListenable: _currentPage,
                              builder: (context, value, child) {
                                return PageView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  controller: _pageController,
                                  children: [
                                    MainView(
                                      _scrollControllers[0],
                                    ),
                                    AboutMeView(
                                      _scrollControllers[1],
                                    ),
                                    ProjectsView(
                                      _scrollControllers[2],
                                    ),
                                    ContactView(_scrollControllers[3]),
                                  ],
                                  onPageChanged: (index) {
                                    _currentPage.value = index;
                                  },
                                );
                              }),
                        ),
                      ),
                      _buildDownButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ValueListenableBuilder _buildDownButton() {
    return ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, value, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: value == 3 ? 0.0 : 1.0,
            child: TextButton(
              onPressed: value == 3
                  ? null
                  : () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 50.0,
                color: kSecondaryColor,
              ),
            ),
          );
        });
  }

  Widget _buildPageIndicator(double width) {
    return SizedBox(
      width: width < kMobileMaxContentWidth ? 40 : 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            width > kMobileMaxContentWidth ? CrossAxisAlignment.end : CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: DotIndicator(
                currentPage: _currentPage,
                index: i,
                pageController: _pageController,
              ),
            ),
        ],
      ),
    );
  }

  ValueListenableBuilder<int> _buildUpButton() {
    return ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, value, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: value == 0 ? 0.0 : 1.0,
            child: TextButton(
              onPressed: value == 0
                  ? null
                  : () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
              child: const Icon(
                Icons.keyboard_arrow_up_rounded,
                size: 50.0,
                color: kSecondaryColor,
              ),
            ),
          );
        });
  }

  TextButton actionsText(
    String text, {
    required Function() onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: 16.0,
          fontFamily: GoogleFonts.lato().fontFamily!,
          shadows: const [
            Shadow(
              color: Colors.black,
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatefulWidget {
  final ValueNotifier<int> currentPage;
  final int index;
  final PageController pageController;

  const DotIndicator({
    required this.currentPage,
    required this.index,
    required this.pageController,
    super.key,
  });

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> with TickerProviderStateMixin {
  late AnimationController _heightController;
  late AnimationController _widthController;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;
  late final VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _heightController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _widthController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _listener = () {
      if (_heightController.isCompleted) {
        _widthController.forward();
      } else if (_heightController.isDismissed) {
        _widthController.reverse();
      }
    };
    _heightAnimation = Tween<double>(begin: 10.0, end: 50.0).animate(_heightController);
    _heightAnimation.addListener(_listener);
    _widthAnimation = Tween<double>(begin: 10.0, end: 100.0).animate(_widthController);
  }

  @override
  dispose() {
    _heightController.removeListener(_listener);
    _heightController.dispose();
    _widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: widget.currentPage,
        builder: (context, value, child) {
          value == widget.index ? _heightController.forward() : _heightController.reverse();
          return InkWell(
            onTap: () {
              widget.pageController.animateToPage(
                widget.index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: AnimatedBuilder(
                animation: _heightController,
                builder: (context, child) {
                  return AnimatedBuilder(
                    animation: _widthController,
                    builder: (context, child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: width < kMobileMaxContentWidth ? 10 : _widthAnimation.value,
                        height: width < kMobileMaxContentWidth ? 10 : _heightAnimation.value,
                        decoration: BoxDecoration(
                          color: value == widget.index
                              ? Colors.white.withOpacity(0.8)
                              : Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: value == widget.index &&
                                  _widthAnimation.isCompleted &&
                                  _heightAnimation.isCompleted
                              ? 1.0
                              : 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.index == 0
                                      ? 'Hello'
                                      : widget.index == 1
                                          ? 'About Me'
                                          : widget.index == 2
                                              ? 'Projects'
                                              : 'Contact',
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.orbitron().fontFamily!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          );
        });
  }
}
