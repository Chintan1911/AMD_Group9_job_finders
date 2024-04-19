import 'package:flutter/material.dart';
import 'candidateList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasConnections = candidates.any((candidate) => candidate.isConnected);

    return FadeTransition(
      opacity: _opacityAnimation,
      child: Scaffold(
        appBar: hasConnections
            ? AppBar(
          title: Text(
            'Home',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CandidateList()),
                );
              },
              icon: Icon(
                Icons.people,
                color: Colors.black,
                size: 28,
              ),
            ),
            SizedBox(width: 16),
          ],
        )
            : null,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: hasConnections ? _buildPostsList() : CandidateList(),
        ),
      ),
    );
  }

  Widget _buildPostsList() {
    List<Post> connectedPosts = [];
    for (Post post in posts) {
      if (candidates.any((candidate) => candidate.isConnected && candidate.name == post.postedBy)) {
        connectedPosts.add(post);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text(
          'Posts by Candidates',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: connectedPosts.length,
            itemBuilder: (context, index) {
              final post = connectedPosts[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(
                          post.image,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.caption,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Posted by: ${post.postedBy}',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Post {
  final String image;
  final String caption;
  final String postedBy;

  Post({
    required this.image,
    required this.caption,
    required this.postedBy,
  });
}

final List<Post> posts = [
  Post(
    image: 'assets/post1.png',
    caption: 'Excited to join this amazing team!',
    postedBy: 'Chintankumar Patel',
  ),
  Post(
    image: 'assets/post2.png',
    caption: 'Completed a successful data analysis project today!',
    postedBy: 'Abin Benedict',
  ),
  Post(
    image: 'assets/post3.jpeg',
    caption: 'Designed a stunning UI for our latest project!',
    postedBy: 'Anai Joshy',
  ),
];
