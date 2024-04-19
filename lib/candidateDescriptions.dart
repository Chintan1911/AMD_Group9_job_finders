import 'package:flutter/material.dart';
import 'candidateList.dart';

class CandidateDescriptions extends StatelessWidget {
  final Candidate candidate;

  const CandidateDescriptions({Key? key, required this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(candidate.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: candidate.name,
              child: Image.asset(
                candidate.profileImage,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(
                'Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.name,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Designation:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.designation,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Experience:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.experience,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Education:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.education,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Bio:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.bio,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Certifications:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.certifications,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Email:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.email,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Contact:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.contact,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Location:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                candidate.location,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
