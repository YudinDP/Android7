import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справка'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Информация о разработчике:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildInfoRow('Ф.И.:', 'Юдин Данила'),
            buildInfoRow('Группа:', 'ВМК-22'),
            buildInfoRow('Email:', 'yudindanilap@gmail.com'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => launchGitHubProfile(context),
              child: const Text('Перейти на гитхаб'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Text(value),
        ],
      ),
    );
  }

  Future<void> launchGitHubProfile(BuildContext context) async {
    const url = 'https://github.com/YudinDP';
    try {
      if (!await launchUrl(Uri.parse(url))) {
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not launch GitHub. Please try again later.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
        ),
      );
    }
  }
}