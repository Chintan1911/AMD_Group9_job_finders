import 'package:flutter/material.dart';
import 'package:job_finders/jobList.dart';
import 'candidateDescriptions.dart';
import 'home_page.dart';
import 'main.dart';

// Define the Candidate class
class Candidate {
  final String name;
  final String designation;
  final String profileImage;
  final String experience;
  final String education;
  final String certifications;
  final String bio;
  final String location;
  final String email;
  final String contact;
  bool isConnected;

  Candidate({
    required this.name,
    required this.designation,
    required this.profileImage,
    required this.experience,
    required this.education,
    required this.certifications,
    required this.bio,
    required this.location,
    required this.email,
    required this.contact,
    this.isConnected = false,
  });
}

// Define the 'candidates' list
final List<Candidate> candidates = [
  Candidate(
    name: 'Chintankumar Patel',
    designation: 'Software Engineer',
    profileImage: 'assets/software.jpeg',
    experience: '5 years of experience',
    education: 'Bachelor of Science in Computer Science',
    certifications: 'AWS Certified Developer',
    bio: 'I have 2+ years of expertise creating creative software solutions. ',
    location: '299, Doon Valley, N2N 1V8, ON',
    email: 'chintan@yahoo.com',
    contact: '7272111712',
  ),
  Candidate(
    name: 'Abin Benedict',
    designation: 'Data Analyst',
    profileImage: 'assets/project.jpeg',
    experience: '3 years of experience',
    education: 'Master of Science in Data Science',
    certifications: 'Google Data Analytics Professional Certificate',
    bio: 'Data scientist with a passion for analyzing and interpreting complex datasets.',
    location: '456 Elm St, Anycity, USA',
    email: 'abd@gmail.com',
    contact: '8921236591',
  ),
  Candidate(
    name: 'Anai Joshy',
    designation: 'UI/UX Designer',
    profileImage: 'assets/market.jpeg',
    experience: '7 years of experience',
    education: 'Bachelor of Fine Arts in Graphic Design',
    certifications: 'Adobe Certified Expert (ACE)',
    bio: 'Creative graphic designer with a passion for visual storytelling and branding.',
    location: '678 Pine St, Anycity, USA',
    email: 'anai12@outlook.com',
    contact: '9633074891',
  ),
  Candidate(
    name: 'Abhishek Khatri',
    designation: 'Mobile Developer',
    profileImage: 'assets/HR.jpeg',
    experience: '4 years of experience',
    education: 'Bachelor of Technology in Computer Engineering',
    certifications: 'Flutter Certified Developer',
    bio: 'Experienced web developer with expertise in front-end technologies. ',
    location: '101 Pine St, Anystate, USA',
    email: 'abhi890@gmail.com',
    contact: '8901236590',
  ),
  Candidate(
    name: 'Sijin David',
    designation: 'Project Manager',
    profileImage: 'assets/PM.jpg',
    experience: '10 years of experience',
    education: 'MBA',
    certifications: 'Project Management Professional (PMP)',
    bio: 'Experienced project manager with a record of delivering projects on time and within budget. ',
    location: '658 Ira Needles, Sudbury ON',
    email: 'sijin@yahoo.com',
    contact: '6754238908',
  ),
  Candidate(
    name: 'Jobe Johnson',
    designation: 'Marketing Specialist',
    profileImage: 'assets/last.webp',
    experience: '3+ years of experience',
    education: 'Internation Business Management',
    certifications: 'Marketing and Sales internation',
    bio: ' Dynamic marketing specialist with expertise in digital marketing and brand management.',
    location: '234 Cedar Ave, Anystate, USA',
    email: 'johnson@example.com',
    contact: '2345654321',
  ),
  Candidate(
    name: 'Dheena Das',
    designation: 'Financial Analyst',
    profileImage: 'assets/HR.jpg',
    experience: '12 years of experience',
    education: 'Charted Accountant',
    certifications: 'CA certification',
    bio: 'Detail-oriented financial analyst with a strong background in financial modeling and forecasting. ',
    location: '87 Walmart St, Anytown, ON',
    email: 'das123@example.com',
    contact: '7865789023',
  ),
  Candidate(
    name: 'Pradeep Xaviour',
    designation: 'HR Manager',
    profileImage: 'assets/FA.jpeg',
    experience: '6 years of experience',
    education: 'Master in Commerce',
    certifications: 'HR certification From NIT',
    bio: ' Strategic HR manager with experience in recruitment and management.',
    location: '245 broadwalk Ktchener, ON',
    email: 'pradeeo@gmail.com',
    contact: '8876652345',
  ),
];

// Define the CandidateList widget
class CandidateList extends StatefulWidget {
  @override
  _CandidateListState createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text('Candidate List'),
            ),
            IconButton(
              icon: Icon(Icons.work),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobList()), // Navigate to JobListPage
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                child: GestureDetector( // Wrap ListTile with GestureDetector

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CandidateDescriptions(candidate: candidate)),
                        );
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
                      // Add the connect icon button
                      trailing: IconButton(
                        icon: Icon(candidate.isConnected ? Icons.check_circle : Icons.add_circle),
                        onPressed: () {
                          // Toggle connection status
                          toggleConnectionStatus(candidate);
                        },
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  void toggleConnectionStatus(Candidate candidate) {
    setState(() {
      candidate.isConnected = !candidate.isConnected;
    });
    String status = candidate.isConnected ? 'Connected' : 'Disconnected';
    String message = '$status with ${candidate.name}';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
    print('Connection Status: $status');
  }
}
