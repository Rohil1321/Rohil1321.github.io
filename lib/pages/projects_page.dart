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
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF515151),
              ),
            ),
            const SizedBox(height: 48),
            ProjectCard(
              title: 'IT Infrastructure Automation',
              description: 'Developed comprehensive Python scripts to automate routine IT tasks '
                  'and system maintenance. Implemented monitoring solutions and automated reporting '
                  'systems to improve operational efficiency.',
              technologies: ['Python', 'Automation', 'System Administration'],
              link: 'https://github.com/Rohil1321/CS-600-Stevens/tree/main/Project/SearchEngine_CS600',
            ),
            const SizedBox(height: 32),
            ProjectCard(
              title: 'Network Management System',
              description: 'Created a centralized network management solution using Python '
                  'to monitor and manage network devices. Implemented automated alerts and '
                  'reporting features for proactive issue resolution.',
              technologies: ['Python', 'Networking', 'System Monitoring'],
              link: 'https://github.com/Rohil1321/AAI_551_Project',
            ),
            const SizedBox(height: 32),
            ProjectCard(
              title: 'IT Asset Management Tool',
              description: 'Developed a custom IT asset management system to track and '
                  'maintain hardware and software inventory. Automated asset lifecycle '
                  'management and reporting processes.',
              technologies: ['Python', 'Database Management', 'Asset Tracking'],
              link: '#',
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
    required this.title,
    required this.description,
    required this.technologies,
    required this.link,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: const Color(0xFF303030),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF515151),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies.map((tech) => Chip(
              label: Text(
                tech,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              backgroundColor: Colors.red,
            )).toList(),
          ),
          if (link != '#') ...[
            const SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(link);
                if (!await launcher.launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text('View Project'),
            ),
          ],
        ],
      ),
    );
  }
}
