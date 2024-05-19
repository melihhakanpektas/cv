import 'dart:math';

import 'package:flutter/material.dart';

class CertificatesView extends StatefulWidget {
  const CertificatesView(
    this.scrollController, {
    super.key,
  });
  final ScrollController scrollController;

  @override
  State<CertificatesView> createState() => _CertificatesViewState();
}

class _CertificatesViewState extends State<CertificatesView> {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: kToolbarHeight + 30),
                    FadeTransition(
                      opacity: AlwaysStoppedAnimation(value < 0.2 ? 0 : min(1, (value - 0.2) * 4)),
                      child: const Text(
                        'Certificates',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeTransition(
                      opacity: AlwaysStoppedAnimation(value < 0.4 ? 0 : min(1, (value - 0.4) * 4)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Wrap(
                          spacing: 75,
                          runSpacing: 75,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                            CertificateWidget(
                              title:
                                  'Google Game & Application Academy Graduation Certificate 2023 (Flutter)',
                              description:
                                  'Having successfully completed all the training within the scope of the Game and Application Academy between December 1, 2022, and July 28, 2023, and developed an application, they have earned the right to graduate.',
                              instution: 'Google Game & Application Academy',
                              date: '08.2023',
                            ),
                            CertificateWidget(
                              title: 'Google Project Management',
                              description:
                                  'Recipients of the Google Project Management Certificate have completed six courses developed by Google, which include practical, hands-on assessments and are designed to prepare them for entry-level positions in project management. These individuals are competent in initiating, planning, and executing projects according to both traditional and agile approaches.',
                              instution: 'Coursera',
                              date: '07.2023',
                            ),
                            CertificateWidget(
                              title: 'Application Development with Flutter',
                              instution: 'Google Game & Application Academy',
                              date: '05.2023',
                              description: '',
                            ),
                            CertificateWidget(
                              title: 'App Jam Participation Certificate',
                              description: '''
                                Within the framework of the Game and Application Academy, they participated in the App Jam held from 06.04.2023 to 10.04.2023 with their team by developing an application under the concept of "Applications that can be used within the Academy."
                                ''',
                              instution: 'Google Game & Application Academy',
                              date: '04.2023',
                            ),
                            CertificateWidget(
                              title: 'Google: Technical Support Fundamentals',
                              instution: 'Coursera',
                              date: '09.2021',
                              description: '',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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

class CertificateWidget extends StatelessWidget {
  const CertificateWidget({
    required this.title,
    required this.description,
    required this.instution,
    required this.date,
    super.key,
  });
  final String title;
  final String description;
  final String instution;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!, width: 0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  instution,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(
                fontSize: 10,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ],
      ),
    );
  }
}
