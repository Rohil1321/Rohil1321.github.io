import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'pages/home_page.dart';
import 'pages/projects_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Romil Shah',
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

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  Widget _currentPage = const HomePage();

  void _navigateToPage(Widget page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _downloadResume() async {
    const String resumeUrl = 'https://github.com/Rohil1321/Rohil1321.github.io/raw/main/assets/Rohil_Resume.pdf';
    try {
      final Uri url = Uri.parse(resumeUrl);
      if (!await launcher.launchUrl(url)) {
        throw Exception('Could not launch $resumeUrl');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error downloading resume')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left sidebar
          Container(
            width: 300,
            color: const Color(0xFF202020),
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Romil Shah',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'Software Developer',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 32),
                _buildNavButton('Home', const HomePage()),
                _buildNavButton('Projects', const ProjectsPage()),
                _buildNavButton('Contact', const ContactPage()),
                const Spacer(),
                TextButton.icon(
                  onPressed: _downloadResume,
                  icon: const Icon(Icons.download, color: Colors.white70),
                  label: const Text(
                    'Download Resume',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          // Main content area
          Expanded(
            child: _currentPage,
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(String title, Widget page) {
    final bool isSelected = _currentPage.runtimeType == page.runtimeType;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextButton(
        onPressed: () => _navigateToPage(page),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
