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
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 48),
            ProjectCard(
              title: 'Search Engine',
              descriptions: [
                'Designed and implemented a simplified search engine for a small website using Java, employing a Trie data structure for efficient word storage and retrieval, and Hashmaps for word occurrence tracking.',
                'Developed web scraping functionality using jsoup to extract content from 13 defense news links, implementing stop word filtering to improve search relevance and reduce noise in the index.',
                'Created ranking algorithms based on word occurrence frequency and implemented multi-keyword search capabilities, using merge sort for efficient result ranking and displaying search results with relevant scores.',
              ],
              technologies: ['Java', 'Data Structures', 'Web Scraping'],
              link: 'https://github.com/Rohil1321/CS-600-Stevens/tree/main/Project/SearchEngine_CS600',
            ),
            const SizedBox(height: 32),
            ProjectCard(
              title: 'Captain Veggie',
              descriptions: [
                'Developed a simulation game in Python where players control Captain Veggie to harvest vegetables while avoiding rabbits, implementing object-oriented programming principles with classes like FieldInhabitant, Veggie, Creature, Captain, and Rabbit.',
                'Created a game engine that initializes the field, manages game state, handles character movements, and processes player input, utilizing file I/O for game configuration and high score management.',
                'Implemented game mechanics including random vegetable placement, rabbit movement algorithms, score tracking, and a high score system, demonstrating skills in algorithm design and data structure manipulation.',
              ],
              technologies: ['Python', 'OOP', 'Game Development'],
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
  final List<String> descriptions;
  final List<String> technologies;
  final String link;

  const ProjectCard({
    required this.title,
    required this.descriptions,
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
          ...List.generate(descriptions.length, (index) => Column(
            children: [
              _buildNumberedPoint(context, (index + 1).toString(), descriptions[index]),
              if (index < descriptions.length - 1) const SizedBox(height: 12),
            ],
          )),
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
            TextButton.icon(
              onPressed: () async {
                final Uri url = Uri.parse(link);
                if (!await launcher.launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              icon: const Icon(Icons.open_in_new),
              label: const Text('View Project'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNumberedPoint(BuildContext context, String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF303030),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
