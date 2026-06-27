import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Main pairing screen for device registration and claiming.
/// 
/// This screen guides the user through the pairing process:
/// 1. Generates a 6-digit pairing code
/// 2. Displays the code for entry in the web dashboard
/// 3. Waits for web dashboard confirmation
/// 4. Navigates to the main player screen on success
class PairingScreen extends ConsumerWidget {
  const PairingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement pairing screen UI
    return Scaffold(
      appBar: AppBar(title: const Text('Device Pairing')),
      body: const Center(
        child: Text('Pairing Screen - Under Development'),
      ),
    );
  }
}
