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
    desc: 'The most crucial job of Senior Account Executive for Solera ISM Team is position created with the target of growing sales and building up partner relations. Besides never giving up on your job, your position will include generation of robust sales pipeline, identification and communication with potential clients, and the solving of problems of all the customers you work with.',
    workType: 'FULL TIME',
    requirements: '2 Years of experience needed',
    benefits: 'Dental Coverage',
  ),
  Job(
    title: 'Data Analyst',
    company: 'GOOGLE',
    logo: 'assets/google.webp',
    desc: 'The corporations will have the ability to partner with the Google, in any form and even the small companies could engage in such partnership with Google. It does not matter whether the size of your market is big or small, the alignment of such activities will only depend on the form of partnership from Google. Your online media background in addition to your communication skills and analysis capabilities will determine what kinds of new and well-established businesses would be successful.',
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
    desc: 'You’re part of the united Amazon team at the package pick-up station – the last one where packages get packed to be later delivered to Amazon customers. We are running a kind of system, where boxes of different orders come off the trucks and straight onto the conveyors.',
    workType: 'PART-TIME',
    requirements: 'G License',
    benefits: 'Accident Insurence',
  ),

  Job(
    title: 'Warehouse Associate',
    company: 'JYSK',
    logo: 'assets/',
    desc: 'Our desired candidate has a good work ethic, is comfortable with working with their hands on highly precise upbeat projects and loves family oriented environment.No experience needed! We will teach at work, and you will be in a new profession soon!',
    workType: ' PART-TIME',
    requirements: 'No Experince Needed',
    benefits: 'Heath Insurance and GYM',
  ),

  Job(
    title: 'Machine Operator ',
    company: 'THE WARNER COMPANY',
    logo: 'assets/',
    desc: 'The baron Company has been a trend setting company in natural taste products since 1868. The Vanilla Extract, Cinnamon, and Black Pepper from our products range in addition to the Extracts, Spices, Dry Seasoning Mixes, Bitters, and Baking Decorations among the other categories are the products of The Watkins Companys complete innovation.',
    workType: 'FULL TIME ',
    requirements: '2+ years of experience ',
    benefits: 'Heath Insurance',
  ),

  Job(
    title: 'Information Technology Roles',
    company: 'BLACKBERRY',
    logo: 'assets/',
    desc: 'Participants will work closely with DCI and designated employer partners to build skills and capabilities, which will culminate in being selected to work in full time roles with clients. Outcomes typically align towards Help Desk Analysts positions in Connecticut.',
    workType: 'FULL TIME or PART-TIME',
    requirements: '3+ years of experience ',
    benefits: 'Heath Insurance and GYM',
  ),
  Job(
    title: 'IT Technical Manager',
    company: 'ROCKWEL COMPANY ENTERPRISE',
    logo: 'assets/',
    desc: 'On eWorks plant, you are expected to deal with all kind of defective electronics devices, and conducting maintenance tasks. These can be PCs or laptops, Macs, printers, monitors, servers, networking equipment and many other tools of modern office.',
    workType: 'PART-TIME',
    requirements: '4+ years of experience ',
    benefits: 'Heath Insurance ',
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

