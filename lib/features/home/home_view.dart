import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melihhakanpektas/features/custom_app_bar/custom_app_bar.dart';
import 'package:melihhakanpektas/features/home/animated_background.dart';
import 'package:melihhakanpektas/features/home/dot_indicator.dart';
import 'package:melihhakanpektas/features/home/pages/about_me/about_me.dart';
import 'package:melihhakanpektas/features/home/pages/certificates/certificates_view.dart';
import 'package:melihhakanpektas/features/home/pages/contact/contact_view.dart';
import 'package:melihhakanpektas/features/home/pages/main/main_view.dart';
import 'package:melihhakanpektas/features/home/pages/projects/projects_view.dart';
import 'package:melihhakanpektas/shared/constants.dart';

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
    ScrollController(),
  ];
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    for (final controller in _scrollControllers) {
      controller.dispose();
    }
    _currentPage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kMainColor,
      endDrawer: _buildDrawer(context),
      body: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent &&
              event.scrollDelta.dy < 0 &&
              _scrollControllers[_currentPage.value].position.pixels == 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else if (event is PointerScrollEvent &&
              event.scrollDelta.dy > 0 &&
              _scrollControllers[_currentPage.value].position.pixels ==
                  _scrollControllers[_currentPage.value].position.maxScrollExtent) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.all(kContentPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      kMainColor,
                      Color.fromARGB(255, 20, 33, 44),
                      kMainColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            const AnimatedBackground(),
            Align(
              child: Container(
                width: kMaxContentWidth,
                padding: const EdgeInsets.all(kContentPadding),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 500,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildPageIndicator(width),
                          Expanded(
                            child: Center(
                              child: PageView(
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
                                  CertificatesView(_scrollControllers[3]),
                                  ContactView(_scrollControllers[4]),
                                ],
                                onPageChanged: (index) {
                                  _currentPage.value = index;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildUpButton(),
            _buildDownButton(),
            _buildAppBar(context),
          ],
        ),
      ),
    );
  }

  SizedBox _buildAppBar(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: CustomAppBar(
        titleOnTap: () => _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        fontFamily: GoogleFonts.orbitron().fontFamily,
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
                const SizedBox(width: 20),
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
                const SizedBox(width: 20),
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
                const SizedBox(width: 20),
                actionsText(
                  'Certificates',
                  onPressed: () {
                    _pageController.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                actionsText(
                  'Contact',
                  onPressed: () {
                    _pageController.animateToPage(
                      4,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ]
            : [
                Stack(
                  children: [
                    EndDrawerButton(
                      style: ButtonStyle(
                        alignment: Alignment.centerRight,
                        foregroundColor: MaterialStateProperty.all(kSecondaryColor),
                      ),
                    ),
                  ],
                ),
              ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            arrowColor: kSecondaryColor,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kMainColor,
                  Color.fromARGB(255, 20, 33, 44),
                  kMainColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text(
              'Melih Hakan Pektas',
              style: TextStyle(
                color: kSecondaryColor,
                fontFamily: GoogleFonts.orbitron().fontFamily,
                shadows: const [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            accountEmail: const Text('contact@melihhakanpektas.com'),
            currentAccountPicture: const CircleAvatar(
              foregroundImage: AssetImage('assets/images/melih_hakan_pektas_small.jpg'),
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
            title: const Text('Certifications'),
            onTap: () {
              _pageController.animateToPage(
                3,
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
    );
  }

  Widget _buildDownButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, value, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: value == 4 ? 0.0 : 1.0,
            child: SizedBox(
              width: kMaxContentWidth,
              child: TextButton(
                onPressed: value == 4
                    ? null
                    : () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 50,
                  color: kSecondaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageIndicator(double width) {
    return SizedBox(
      width: width < kMobileMaxContentWidth ? 40 : 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            width > kMobileMaxContentWidth ? CrossAxisAlignment.end : CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.all(5),
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

  Widget _buildUpButton() {
    return Align(
      alignment: Alignment.topCenter,
      child: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: value == 0 ? 0.0 : 1.0,
              child: SizedBox(
                width: kMaxContentWidth,
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
                    size: 50,
                    color: kSecondaryColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TextButton actionsText(
    String text, {
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: 16,
          fontFamily: GoogleFonts.lato().fontFamily,
          shadows: const [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}
