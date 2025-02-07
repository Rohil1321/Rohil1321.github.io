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
      title: 'Rohil Shah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          displayLarge: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: const TextStyle(
            fontSize: 18,
            color: Color(0xFF515151),
          ),
        ),
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
          // Left sidebar (Hyde theme style)
          Container(
            width: 300,
            color: const Color(0xFF202020),
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rohil Shah',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'Portfolio',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 32),
                _buildNavItem(context, 'About', true),
                _buildNavItem(context, 'Projects', false),
                _buildNavItem(context, 'Contact', false),
                const Spacer(),
                TextButton(
                  onPressed: _downloadResume,
                  child: const Text(
                    'Download Resume',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          // Main content area
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(64),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome!',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: const Color(0xFF303030),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'I am a software developer passionate about creating innovative solutions.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 48),
                    Text(
                      'Projects',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xFF303030),
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
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white70,
            fontSize: 20,
          ),
        ),
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
