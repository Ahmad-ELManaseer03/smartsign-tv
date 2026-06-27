import 'package:flutter/material.dart';

/// Widget showing the waiting state while the web dashboard claims the device.
/// 
/// This widget displays a loading animation and status message while
/// the app waits for the web dashboard to complete the pairing process.
class WaitingForClaim extends StatelessWidget {
  const WaitingForClaim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Implement waiting for claim widget
    return Container(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
