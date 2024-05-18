import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melihhakanpektas/shared/constants.dart';

class DotIndicator extends StatefulWidget {
  const DotIndicator({
    required this.currentPage,
    required this.index,
    required this.pageController,
    super.key,
  });
  final ValueNotifier<int> currentPage;
  final int index;
  final PageController pageController;

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
      duration: const Duration(milliseconds: 500),
    );
    _widthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _listener = () {
      if (_heightController.isCompleted) {
        _widthController.forward();
      } else if (_heightController.isDismissed) {
        _widthController.reverse();
      }
    };
    _heightAnimation = Tween<double>(begin: 10, end: 50).animate(_heightController);
    _heightAnimation.addListener(_listener);
    _widthAnimation = Tween<double>(begin: 10, end: 100).animate(_widthController);
  }

  @override
  void dispose() {
    _heightController
      ..removeListener(_listener)
      ..dispose();
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
          borderRadius: BorderRadius.circular(5),
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
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: value == widget.index &&
                              _widthAnimation.isCompleted &&
                              _heightAnimation.isCompleted
                          ? 1.0
                          : 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
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
                                          : widget.index == 3
                                              ? 'Certificates'
                                              : 'Contact',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.orbitron().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
