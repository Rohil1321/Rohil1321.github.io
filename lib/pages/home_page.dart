import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              'Welcome!',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Hi, I\'m Romil Shah',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'IT Administrator at Dianco Inc, New York City, NY',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF303030),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'I am an IT Administrator with a passion for technology and automation. '
              'With expertise in Python development and system administration, I specialize in creating '
              'efficient solutions to streamline IT operations and enhance business processes. '
              'My strong technical background and problem-solving skills enable me to effectively '
              'manage IT infrastructure while developing innovative automation solutions.',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color(0xFF303030),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 48),
            Text(
              'Skills',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildSkillChip('Python', isPrimary: true),
                _buildSkillChip('Network Security', isPrimary: true),
                _buildSkillChip('IT Infrastructure', isPrimary: true),
                _buildSkillChip('System Administration'),
                _buildSkillChip('Website Maintenance'),
                _buildSkillChip('Java'),
                _buildSkillChip('Network Management'),
                _buildSkillChip('Technical Support'),
                _buildSkillChip('Cybersecurity'),
                _buildSkillChip('Flutter'),
                _buildSkillChip('Database Management'),
                _buildSkillChip('Object-Oriented Programming'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String label, {bool isPrimary = false}) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: isPrimary ? Colors.white : Colors.black87,
        ),
      ),
      backgroundColor: isPrimary ? Colors.red : Colors.grey[200],
    );
  }
}
