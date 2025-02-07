import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:melihhakanpektas/shared/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactView extends StatefulWidget {
  const ContactView(
    this.scrollController, {
    super.key,
  });
  final ScrollController scrollController;

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();
  }

  @override
  void dispose() {
    try {
      _animationController.dispose();
    } catch (e) {
      debugPrint('Error during dispose: $e');
    } finally {
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final value = _animationController.value;
        return Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: Center(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kToolbarHeight + 30),
                  FadeTransition(
                    opacity: AlwaysStoppedAnimation(value < 0.2 ? 0 : min(1, (value - 0.2) * 4)),
                    child: const Text(
                      'Contact Me',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeTransition(
                    opacity: AlwaysStoppedAnimation(value < 0.4 ? 0 : min(1, (value - 0.4) * 4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContactRow(
                          icon: const Icon(Icons.email, color: Colors.blue),
                          onPressed: () {
                            launchUrlString('mailto:contact@melihhakanpektas.com');
                          },
                          label: 'contact@melihhakanpektas.com',
                        ),
                        ContactRow(
                          icon: Icon(MdiIcons.linkedin, color: Colors.blue[700]),
                          onPressed: () {
                            launchUrlString('https://www.linkedin.com/in/melihhakanpektas/');
                          },
                          label: 'melihhakanpektas',
                        ),
                        ContactRow(
                          icon: Icon(MdiIcons.github, color: Colors.blueGrey),
                          onPressed: () {
                            launchUrlString('https://www.github.com/crescodev/');
                          },
                          label: 'crescodev',
                        ),
                        ContactRow(
                          icon: Icon(MdiIcons.instagram, color: Colors.pink),
                          onPressed: () {
                            launchUrlString('https://www.instagram.com/crescodev/');
                          },
                          label: 'crescodev',
                        ),
                        ContactRow(
                          icon: Icon(MdiIcons.youtube, color: Colors.red),
                          onPressed: () {
                            launchUrlString('https://www.youtube.com/crescodev/');
                          },
                          label: 'crescodev',
                        ),
                        ContactRow(
                          icon: const Icon(
                            Icons.image,
                            size: 24,
                          ),
                          onPressed: () {
                            launchUrlString('https://www.kick.com/crescodev/');
                          },
                          label: 'crescodev',
                          leading: Image.asset(
                            'assets/images/kick_icon.jpg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 10),
                            Text('Ankara, Turkey'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.language),
                            SizedBox(width: 10),
                            Text('English, Turkish'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ContactRow extends StatelessWidget {
  const ContactRow({
    required this.icon,
    required this.onPressed,
    required this.label,
    super.key,
    this.leading,
  });

  final Icon icon;
  final VoidCallback onPressed;
  final String label;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        leading ?? icon,
        const SizedBox(width: 10),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(label),
          ),
        ),
      ],
    );
  }
}
