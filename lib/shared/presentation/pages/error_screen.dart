import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Wspólny ekran błędu dla błędnego URL i brakujących danych.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.title,
    required this.message,
    this.location,
  });

  final String title;
  final String message;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Błąd')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 72),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(message, textAlign: TextAlign.center),
              if (location != null) ...[
                const SizedBox(height: 8),
                Text('Adres: $location', textAlign: TextAlign.center),
              ],
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => context.go('/home'),
                icon: const Icon(Icons.home_outlined),
                label: const Text('Wróć do ekranu głównego'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}