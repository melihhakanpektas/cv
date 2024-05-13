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
    return Scaffold(
      appBar: CustomAppBar(
        fontFamily: GoogleFonts.lato().fontFamily!,
        backgroundColor: kMainColor,
        actions: [
          actionsText(
            'About Me',
            onPressed: () {},
          ),
          const SizedBox(width: 20.0),
          actionsText(
            'Projects',
            onPressed: () {},
          ),
          const SizedBox(width: 20.0),
          actionsText(
            'Contact',
            onPressed: () {},
          ),
        ],
      ),
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
        child: Column(
          children: [
            _buildUpButton(),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: kMaxContentWidth,
                  child: Row(
                    children: [
                      _buildPageIndicator(),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            _buildDownButton(),
          ],
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

  ValueListenableBuilder<int> _buildPageIndicator() {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPage,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    radius: 5.0,
                    backgroundColor:
                        i == value ? kSecondaryColor : kSecondaryColor.withOpacity(0.5),
                  ),
                ),
            ],
          ),
        );
      },
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
