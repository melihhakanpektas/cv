import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

const String text =
    """As a Full Stack developer, I bring over **2 years** of experience in **Full-Stack development** mostly using **Flutter & Firebase**. I began my professional journey in software development with **Flutter**, during which I independently developed and published 2 web application projects and 2 mobile application, collaborated on **over 10 projects**, emphasizing teamwork and effective communication.

In my project engagements, I have integrated AI services such as **ChatGPT and DALLE**, alongside payment services including **Stripe, Google Pay, Apple Pay, and PayTR**. I have undertaken both front-end and back-end development responsibilities, predominantly utilizing **Firebase and Google Cloud** services for the backend infrastructure. Throughout the development lifecycle, I have adhered to **Agile Methodologies** and leveraged version control systems effectively.

Moreover, my passion for music has often intersected with my professional endeavors. Currently, I am immersed in a project focused on processing and visualizing live microphone data by applying various algorithms to convert it into frequency data.""";

class _MainAppState extends State<MainApp> {
  final ScrollController _scrollControllerHorizontal = ScrollController();
  final ScrollController _scrollControllerVertical = ScrollController();
  final splittext = text.split('**');

  @override
  Widget build(BuildContext context) {
    const height = 900.0;
    const width = height / 1.414;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lekton().fontFamily,
        brightness: Brightness.light,
      ),
      home: Material(
        color: Colors.grey,
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          controller: _scrollControllerHorizontal,
          child: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            controller: _scrollControllerVertical,
            child: SingleChildScrollView(
              controller: _scrollControllerVertical,
              child: Center(
                child: SingleChildScrollView(
                  controller: _scrollControllerHorizontal,
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      SelectionArea(
                        child: Container(
                          width: width,
                          height: height,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Melih Hakan Pektas',
                                          style:
                                              TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          'Full Stack Developer',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(height: 10),
                                        Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                launchUrl(Uri.parse('tel:+905012533899'));
                                              },
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.phone),
                                                  SizedBox(width: 5),
                                                  Text('+90 501 253 38 99'),
                                                ],
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                launchUrl(Uri.parse(
                                                    'mailto:contact@melihhakanpektas.com'));
                                              },
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.email),
                                                  SizedBox(width: 5),
                                                  Text('contact@melihhakanpektas.com'),
                                                ],
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                launchUrl(
                                                    Uri.parse('https://www.melihhakanpektas.com'));
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(MdiIcons.web),
                                                  const SizedBox(width: 5),
                                                  const Text('melihhakanpektas.com'),
                                                ],
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                launchUrl(
                                                  Uri.parse(
                                                    'https://pub.dev/publishers/melihhakanpektas.com/packages',
                                                  ),
                                                );
                                              },
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.flutter_dash),
                                                  SizedBox(width: 5),
                                                  Text('pub.dev'),
                                                ],
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                launchUrl(
                                                  Uri.parse(
                                                    'https://github.com/melihhakanpektas',
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(MdiIcons.github),
                                                  const SizedBox(width: 5),
                                                  const Text('GitHub'),
                                                ],
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                launchUrl(
                                                  Uri.parse(
                                                    'https://www.linkedin.com/in/melihhakanpektas/',
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(MdiIcons.linkedin),
                                                  const SizedBox(width: 5),
                                                  const Text('LinkedIn'),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(thickness: 2, height: 0),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Column(
                                          children: [
                                            _buildSkillBar('Dart (Flutter)', 0.9),
                                            _buildSkillBar('Firebase', 0.85),
                                            _buildSkillBar('Node.js', 0.6),
                                            _buildSkillBar('Kotlin', 0.5),
                                            _buildSkillBar('Swift', 0.4),
                                            _buildSkillBar('Java', 0.4),
                                            _buildSkillBar(
                                                'Third-party Libraries and APIs Integration', .9),
                                            _buildSkillBar('UI/UX', .8),
                                            _buildSkillBar('Database Management', .8),
                                            _buildSkillBar('Agile Development Methodologies', .8),
                                            _buildSkillBar('Project Management', .7),
                                            _buildSkillBar('English', .5),
                                            const SizedBox(height: 10),
                                            const Text('Hobies', style: TextStyle(fontSize: 18)),
                                            const Wrap(
                                              spacing: 10,
                                              children: [
                                                Chip(
                                                    padding: EdgeInsets.zero,
                                                    label: Text('Music',
                                                        style: TextStyle(fontSize: 10))),
                                                Chip(
                                                    padding: EdgeInsets.zero,
                                                    label: Text('Guitar',
                                                        style: TextStyle(fontSize: 10))),
                                                Chip(
                                                    padding: EdgeInsets.zero,
                                                    label: Text('Piano',
                                                        style: TextStyle(fontSize: 10))),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const VerticalDivider(thickness: 2, width: 0),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                          padding: const EdgeInsets.all(14),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('About Me',
                                                  style: TextStyle(fontSize: 20)),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: RichText(
                                                  textAlign: TextAlign.justify,
                                                  text: TextSpan(
                                                    children: List.generate(splittext.length, (i) {
                                                      if (i.isEven) {
                                                        return TextSpan(
                                                          text: splittext[i],
                                                          style: const TextStyle(
                                                            fontSize: 11,
                                                          ),
                                                        );
                                                      } else {
                                                        return TextSpan(
                                                          text: splittext[i],
                                                          style: const TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        );
                                                      }
                                                    }),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 30),
                                              const Row(
                                                children: [
                                                  Expanded(
                                                    flex: 10,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Work Experience',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        Text(
                                                          '1 year 1 months',
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 10,
                                                    child: Column(
                                                      children: [
                                                        _buildWorkExperience(
                                                          company: 'Apply Coder Informatics',
                                                          startDate: '03/2024',
                                                          endDate: 'Present',
                                                          experienceTime: '1 months',
                                                        ),
                                                        const SizedBox(height: 15),
                                                        _buildWorkExperience(
                                                          startDate: '02/2023',
                                                          endDate: '02/2024',
                                                          experienceTime: '1 year',
                                                        ),
                                                        const SizedBox(height: 15),
                                                      ],
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    child: SizedBox(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SelectionArea(
                        child: Container(
                          width: width,
                          height: height,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              children: [
                                const Text('Projects (individually developed)',
                                    style: TextStyle(fontSize: 20)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildProject(
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
                                    _buildProject(
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
                                    _buildProject(
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
                                    _buildProject(
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
                                const SizedBox(height: 10),
                                const Text(
                                  'Certificates',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                _buildCertificate(
                                  title:
                                      'Google Game & Application Academy Graduation Certificate 2023 (Flutter)',
                                  description:
                                      'Having successfully completed all the training within the scope of the Game and Application Academy between December 1, 2022, and July 28, 2023, and developed an application, they have earned the right to graduate.',
                                  instution: 'Google Game & Application Academy',
                                  date: '08.2023',
                                ),
                                _buildCertificate(
                                  title: 'Google Project Management',
                                  description:
                                      'Recipients of the Google Project Management Certificate have completed six courses developed by Google, which include practical, hands-on assessments and are designed to prepare them for entry-level positions in project management. These individuals are competent in initiating, planning, and executing projects according to both traditional and agile approaches.',
                                  instution: 'Coursera',
                                  date: '07.2023',
                                ),
                                _buildCertificate(
                                  title: 'Application Development with Flutter',
                                  instution: 'Google Game & Application Academy',
                                  date: '05.2023',
                                ),
                                _buildCertificate(
                                  title: 'App Jam Participation Certificate',
                                  description:
                                      """Within the framework of the Game and Application Academy, they participated in the App Jam held from 06.04.2023 to 10.04.2023 with their team by developing an application under the concept of "Applications that can be used within the Academy."
                                      """,
                                  instution: 'Google Game & Application Academy',
                                  date: '04.2023',
                                ),
                                _buildCertificate(
                                  title: 'Google: Technical Support Fundamentals',
                                  instution: 'Coursera',
                                  date: '09.2021',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProject({
    String title = '',
    String description = '',
    String usedTechnologies = '',
    String date = '',
    String url = '',
    String imagePath = '',
    String qrImagePath = '',
  }) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!, width: 0),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 75,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (imagePath.isNotEmpty) ...[
              Image.asset(
                imagePath,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
            ],
            const SizedBox(height: 5),
            if (qrImagePath.isNotEmpty) ...[
              const SizedBox(width: 10),
              Image.asset(
                qrImagePath,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Container _buildCertificate({
    required String title,
    String? description,
    required String instution,
    required String date,
  }) {
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
              )
            ],
          ),
          if (description != null) ...[
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

  Container _buildWorkExperience({
    required String startDate,
    required String endDate,
    required String experienceTime,
    String position = 'Full Stack Developer',
    String company = 'Ruf Information Technologies',
    String location = 'Ankara, Turkey',
    String industry = 'Information Technologies',
    String employmentType = 'Full-time',
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Position',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    position,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Text(
                experienceTime,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Company',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      company,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Industry',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    industry,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Start Date',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      startDate,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'End Date',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      endDate,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Employment Type',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      employmentType,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSkillBar(String title, double value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!, width: 0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 5,
                  backgroundColor: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${(value * 100).round()}%',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
