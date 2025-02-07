import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Romil Shah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  void _downloadResume() async {
    const url = 'assets/Romil_Resume.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left sidebar (similar to Hyde theme)
          Container(
            width: 300,
            color: const Color(0xFF202020),
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Romil V. Shah',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Software Engineer',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _downloadResume,
                  child: const Text('Download Resume'),
                ),
                const Spacer(),
                // Social links
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.link, color: Colors.white),
                      onPressed: () => launch('https://linkedin.com/in/rohil13'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.code, color: Colors.white),
                      onPressed: () => launch('https://github.com/Rohil1321'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Main content area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'I am a student passionate about software development. '
                    'I enjoy learning new technologies and applying them to solve real-world problems.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ProjectCard(
                    title: 'Search Engine',
                    description: 'A search engine project built with advanced algorithms',
                    link: 'https://github.com/Rohil1321/CS-600-Stevens/tree/main/Project/SearchEngine_CS600',
                  ),
                  const SizedBox(height: 16),
                  ProjectCard(
                    title: 'Captain Veggie',
                    description: 'An engaging project developed for AAI 551',
                    link: 'https://github.com/Rohil1321/AAI_551_Project',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => launch(link),
              child: const Text('View Project'),
            ),
          ],
        ),
      ),
    );
  }
}
