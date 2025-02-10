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
              'Hi, I\'m Rohil Shah',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'I am a passionate software developer with a strong foundation in computer science. '
              'Currently pursuing my Master\'s degree, I specialize in creating efficient and innovative solutions '
              'to complex problems. My expertise includes web development, algorithms, and software engineering.',
              style: Theme.of(context).textTheme.bodyLarge,
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
                _buildSkillChip('Flutter'),
                _buildSkillChip('Python'),
                _buildSkillChip('Java'),
                _buildSkillChip('JavaScript'),
                _buildSkillChip('React'),
                _buildSkillChip('Node.js'),
                _buildSkillChip('SQL'),
                _buildSkillChip('Git'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: const Color(0xFF202020).withOpacity(0.1),
      labelStyle: const TextStyle(color: Color(0xFF202020)),
    );
  }
}
