import 'package:flutter/material.dart';
import 'candidateList.dart';
import 'jobDescriptions.dart';

class Job {
  final String title;
  final String company;
  final String logo;
  final String desc;
  final String workType;
  final String requirements;
  final String benefits;

  Job({
    required this.title,
    required this.company,
    required this.logo,
    required this.desc,
    required this.workType,
    required this.requirements,
    required this.benefits,
  });
}

final List<Job> jobList = [
  Job(
    title: 'Software Engineer',
    company: 'TCS',
    logo: 'assets/tcs.jpg',
    desc: 'gvhbjgcjhvbjnkmjhvgcf gvhbjnkml fcgvhbjnkml gvhbjnk  jnkmlkkx fc',
    workType: 'FULL TIME',
    requirements: '2 Years of experience needed',
    benefits: 'Dental Coverage',
  ),
  Job(
    title: 'Data Analyst',
    company: 'GOOGLE',
    logo: 'assets/google.webp',
    desc: 'fgvhbjnk',
    workType: 'FULL TIME',
    requirements: 'NO prior requirements needed',
    benefits: 'Health and Dental coverage',
  ),

  Job(
    title: 'Game Developer',
    company: 'EA GAMES',
    logo: 'assets/EA.webp',
    desc: 'tyghjkl',
    workType: 'FULL TIME or PART-TIME',
    requirements: '2+ years of experience in UNITY',
    benefits: 'Heath Insurance and GYM',
  ),
  Job(
    title: 'Delivery',
    company: 'AMAZON',
    logo: 'assets/amazon.png',
    desc: 'tyguhij',
    workType: 'PART-TIME',
    requirements: 'G License',
    benefits: 'Accident Insurence',
  ),

];

class JobList extends StatelessWidget {
  const JobList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Listings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JobListHomePage(title: 'Job Listings'),
    );
  }
}

class JobListHomePage extends StatefulWidget {
  final String title;

  const JobListHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<JobListHomePage> createState() => _JobListHomePageState();
}

class _JobListHomePageState extends State<JobListHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  bool _blinkingText = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
    _controller.forward();
    _startBlinking();
  }

  void _startBlinking() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _blinkingText = !_blinkingText;
      });
      _startBlinking();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              ...jobList.map((job) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(job.logo),
                      ),
                      title: Text(
                        job.title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.company,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            height: 24, //
                            child: Visibility(
                              visible: _blinkingText,
                              child: Text(
                                'APPLY NOW !',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => jobDescriptions(job: job),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}


//Used some random Images and Text from the internet

