import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await launcher.canLaunchUrl(url)) {
        await launcher.launchUrl(url, mode: launcher.LaunchMode.platformDefault);
      } else {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

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
              'Contact',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Let\'s connect! Feel free to reach out through any of these platforms:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 48),
            _buildContactCard(
              context,
              icon: Icons.email,
              title: 'Email',
              subtitle: 'rshah49@stevens.edu',
              onTap: () => _launchURL('mailto:rshah49@stevens.edu'),
            ),
            const SizedBox(height: 24),
            _buildContactCard(
              context,
              icon: Icons.link,
              title: 'LinkedIn',
              subtitle: 'linkedin.com/in/rohil13',
              onTap: () => _launchURL('https://linkedin.com/in/rohil13'),
            ),
            const SizedBox(height: 24),
            _buildContactCard(
              context,
              icon: Icons.code,
              title: 'GitHub',
              subtitle: 'github.com/Rohil1321',
              onTap: () => _launchURL('https://github.com/Rohil1321'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Icon(icon, size: 32, color: const Color(0xFF202020)),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xFF202020),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF515151),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Color(0xFF202020)),
            ],
          ),
        ),
      ),
    );
  }
}
