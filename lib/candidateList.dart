import 'package:flutter/material.dart';

class Candidate {
  final String name;
  final String designation;
  final String profileImage;
  final String experience;
  final String education;
  final String certifications;

  Candidate({
    required this.name,
    required this.designation,
    required this.profileImage,
    required this.experience,
    required this.education,
    required this.certifications,
  });
}

final List<Candidate> candidates = [
  Candidate(
    name: 'Chintankumar Patel',
    designation: 'Software Engineer',
    profileImage: 'assets/software.jpeg',
    experience: '5 years of experience',
    education: 'Bachelor of Science in Computer Science',
    certifications: 'AWS Certified Developer',
  ),
  Candidate(
    name: 'Abin Benedict',
    designation: 'Data Analyst',
    profileImage: 'assets/project.jpeg',
    experience: '3 years of experience',
    education: 'Master of Science in Data Science',
    certifications: 'Google Data Analytics Professional Certificate',
  ),
  Candidate(
    name: 'Anai Joshy',
    designation: 'UI/UX Designer',
    profileImage: 'assets/market.jpeg',
    experience: '7 years of experience',
    education: 'Bachelor of Fine Arts in Graphic Design',
    certifications: 'Adobe Certified Expert (ACE)',
  ),
  Candidate(
    name: 'Abhishek Khatri',
    designation: 'Mobile Developer',
    profileImage: 'assets/HR.jpeg',
    experience: '4 years of experience',
    education: 'Bachelor of Technology in Computer Engineering',
    certifications: 'Flutter Certified Developer',
  ),
];

class CandidateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: 'logo',
                flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                    ),
                  );
                },
                child: Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
              ),
            ),
            SizedBox(height: 20),
            ...candidates.map((candidate) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(candidate.profileImage),
                    ),
                    title: Text(
                      candidate.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(candidate.designation),
                    onTap: () {
                      // Navigate to detail screen
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Hero(
                              tag: candidate.name,
                              child: Image.asset(
                                candidate.profileImage,
                                width: 300,
                                height: 300,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
