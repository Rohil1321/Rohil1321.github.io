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
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color(0xFF303030),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNumberedPoint(
                  context,
                  '1',
                  'Maintained the company\'s website, ensuring 99.9% uptime for a high-traffic platform showcasing diamond jewelry inventory, directly contributing to customer engagement and sales opportunities for the business.',
                ),
                const SizedBox(height: 12),
                _buildNumberedPoint(
                  context,
                  '2',
                  'Implemented a Python-based automated inventory tracking system, streamlining the process of updating the website with current diamond jewelry availability, reducing manual data entry errors by 95% and saving 10 hours of staff time weekly.',
                ),
                const SizedBox(height: 12),
                _buildNumberedPoint(
                  context,
                  '3',
                  'Provided rapid response IT support, diagnosing and resolving hardware and software issues within an average of 2 hours, minimizing downtime and maintaining a 98% operational efficiency for all office computers and network infrastructure.',
                ),
              ],
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
                _buildSkillChip('System Administration'),
                _buildSkillChip('IT Infrastructure'),
                _buildSkillChip('Website Maintenance'),
                _buildSkillChip('Automation'),
                _buildSkillChip('Java'),
                _buildSkillChip('Network Management'),
                _buildSkillChip('Technical Support'),
              ],
            ),
          ],
        ),
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
