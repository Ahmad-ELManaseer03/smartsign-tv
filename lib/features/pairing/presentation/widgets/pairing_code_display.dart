import 'package:flutter/material.dart';

/// Widget for displaying the 6-digit pairing code.
/// 
/// This widget shows the pairing code in a large, easy-to-read format
/// with copy-to-clipboard functionality.
class PairingCodeDisplay extends StatelessWidget {
  const PairingCodeDisplay({
    Key? key,
    required this.code,
  }) : super(key: key);

  /// The 6-digit pairing code to display
  final String code;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement pairing code display widget
    return Container(
      child: Text(code),
    );
  }
}
