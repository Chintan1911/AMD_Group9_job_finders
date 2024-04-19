import 'package:flutter/material.dart';
import 'jobList.dart';

class jobDescriptions extends StatelessWidget {
  final Job job;

  const jobDescriptions({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.company),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Image.asset(
                  job.logo,
                  height: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Job Title:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
                ),
                SizedBox(width: 9),
                Flexible(
                  child: Text(
                    job.title,
                    style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
                ),
                SizedBox(width: 9),
                Flexible(
                  child: Text(
                    job.desc,
                    style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Work Type:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
                ),
                SizedBox(width: 9),
                Flexible(
                  child: Text(
                    job.workType,
                    style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Requirements:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
                ),
                SizedBox(width: 9),
                Flexible(
                  child: Text(
                    job.requirements,
                    style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Benefits:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
                ),
                SizedBox(width: 9),
                Flexible(
                  child: Text(
                    job.benefits,
                    style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('APPLY NOW'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
