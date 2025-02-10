import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(64),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projects',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Here are some of my notable projects:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 48),
            ProjectCard(
              title: 'Search Engine',
              description: 'A sophisticated search engine project built with advanced algorithms. '
                  'Implements efficient indexing and ranking mechanisms for improved search results.',
              technologies: ['Python', 'Data Structures', 'Algorithms'],
              link: 'https://github.com/Rohil1321/CS-600-Stevens/tree/main/Project/SearchEngine_CS600',
            ),
            const SizedBox(height: 32),
            ProjectCard(
              title: 'Captain Veggie',
              description: 'An engaging project developed for AAI 551. '
                  'Features interactive gameplay and demonstrates object-oriented programming principles.',
              technologies: ['Java', 'OOP', 'Game Development'],
              link: 'https://github.com/Rohil1321/AAI_551_Project',
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String link;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.link,
  });

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(link);
    try {
      if (await launcher.canLaunchUrl(url)) {
        await launcher.launchUrl(url, mode: launcher.LaunchMode.platformDefault);
      } else {
        throw 'Could not launch $link';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies
                  .map((tech) => Chip(
                        label: Text(tech),
                        backgroundColor: const Color(0xFF202020).withOpacity(0.1),
                        labelStyle: const TextStyle(color: Color(0xFF202020)),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _launchURL,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('View Project'),
                  SizedBox(width: 8),
                  Icon(Icons.open_in_new),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
