import 'dart:math';

import 'package:flutter/material.dart';
import 'package:melihhakanpektas/shared/constants.dart';
import 'package:melihhakanpektas/shared/neon_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView(
    this.scrollController, {
    super.key,
  });
  final ScrollController scrollController;

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  ValueNotifier<int> isHovered = ValueNotifier<int>(-1);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: AlwaysStoppedAnimation(min(1, value * 3)),
            curve: Curves.fastOutSlowIn,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: SingleChildScrollView(
                controller: widget.scrollController,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: kToolbarHeight + 30),
                          FadeTransition(
                            opacity:
                                AlwaysStoppedAnimation(value < 0.2 ? 0 : min(1, (value - 0.2) * 4)),
                            child: const Text(
                              'Projects',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          const SizedBox(height: 30),
                          FadeTransition(
                            opacity:
                                AlwaysStoppedAnimation(value < 0.4 ? 0 : min(1, (value - 0.4) * 4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: Wrap(
                                spacing: 75,
                                runSpacing: 75,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runAlignment: WrapAlignment.spaceBetween,
                                children: [
                                  ProjectWidget(
                                    imagePath: 'assets/images/satkapilogo.png',
                                    qrImagePath: 'assets/images/satkapiqr.png',
                                    title: 'SatKapi',
                                    description:
                                        'A web application where users can quickly receive offers for their technological devices and complete their sales transactions securely from their address. This startup is successfully operating in Turkey.',
                                    usedTechnologies:
                                        'Flutter, PayTR, Firebase (Functions, Firestore, Storage, Auth)',
                                    date: '2023',
                                    url: 'https://satkapi.com',
                                  ),
                                  ProjectWidget(
                                    imagePath: 'assets/images/hizlaniologo.png',
                                    qrImagePath: 'assets/images/hizlanioqr.png',
                                    title: 'Hizlanio',
                                    description:
                                        'A web application designed to help users enhance their reading comprehension skills through rapid reading exercises. This startup is successfully operating in Turkey.',
                                    usedTechnologies:
                                        'Flutter, PayTR, Firebase (Functions, Firestore, Storage, Auth)',
                                    date: '2023',
                                    url: 'https://hizlanio.com',
                                  ),
                                  ProjectWidget(
                                    imagePath: 'assets/images/teachercalendarlogo.png',
                                    qrImagePath: 'assets/images/teachercalendarqr.png',
                                    title: 'Teacher Calendar',
                                    description:
                                        'A calendar application tailored for private tutors, facilitating appointment scheduling, payment tracking, generating income reports, and simplifying communication with clients. This application is available on both iOS and Android platforms.',
                                    usedTechnologies:
                                        'Flutter, Google Pay, Apple Pay, Firebase (Functions, Firestore, Storage, Auth)',
                                    date: '2023',
                                    url:
                                        'https://apps.apple.com/be/app/teacher-calendar/id6447215229?platform=iphone',
                                  ),
                                  ProjectWidget(
                                    imagePath: 'assets/images/musicreadingtrainerlogo.webp',
                                    qrImagePath: 'assets/images/musicreadingtrainerqr.png',
                                    title: 'Music Reading Trainer',
                                    description:
                                        "An app aimed at improving users' ability to read musical notation, allowing them to track their progress in sight-reading exercises and enhance their music reading skills over time. This application is only available on the Google Play Store.",
                                    usedTechnologies: 'Flutter',
                                    date: '2022',
                                    url:
                                        'https://play.google.com/store/apps/details?id=com.melihhakanpektas.musicreadingtrainer&hl=tr&gl=US',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    this.title = '',
    this.description = '',
    this.usedTechnologies = '',
    this.date = '',
    this.url = '',
    this.imagePath = '',
    this.qrImagePath = '',
    super.key,
  });
  final String title;
  final String description;
  final String usedTechnologies;
  final String date;
  final String url;
  final String imagePath;
  final String qrImagePath;

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  late final ValueNotifier<bool> isHovered;
  final key = UniqueKey();

  @override
  void initState() {
    super.initState();
    isHovered = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    try {
      isHovered.dispose();
    } catch (e) {
      debugPrint('Error during dispose: $e');
    } finally {
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isHovered,
      builder: (context, bool value, child) {
        return AnimatedScale(
          duration: Durations.medium2,
          scale: isHovered.value ? 1.5 : 1,
          curve: Curves.easeInOut,
          child: child,
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          isHovered.value = true;
        },
        onExit: (_) {
          isHovered.value = false;
        },
        child: InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          onTap: () {
            Navigator.of(context).push(
              HeroDialogRoute<void>(
                builder: (context) {
                  return Center(
                    child: AlertDialog(
                      scrollable: true,
                      content: SizedBox(
                        width: kMaxContentWidth,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Hero(
                              tag: key,
                              child: Neon(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    widget.imagePath,
                                    width: 125,
                                    height: 125,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.description,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Used Technologies: ${widget.usedTechnologies}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Date: ${widget.date}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      launchUrlString(widget.url);
                                    },
                                    child: const Text(
                                      'Visit Website',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          child: Hero(
            tag: key,
            child: Neon(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.imagePath,
                  width: 125,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    required this.builder,
    super.settings,
  });

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  String get barrierLabel => 'HeroDialog';
}
