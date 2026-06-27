import 'package:smartsign_tv/features/pairing/data/models/pairing_code_model.dart';

/// Abstract interface for remote pairing data operations (Firestore).
/// 
/// This interface defines the contract for all Firestore operations
/// related to device pairing. Implementation will handle Firebase interactions.
abstract class IPairingRemoteDataSource {
  /// Uploads a pairing code to Firestore.
  Future<void> uploadPairingCode(String deviceId, String code);

  /// Watches pairing code updates from Firestore in real-time.
  Stream<PairingCodeModel> watchPairingCode(String deviceId);

  /// Retrieves the current pairing code from Firestore.
  Future<PairingCodeModel?> getPairingCode(String deviceId);

  /// Checks if a device is already paired in Firestore.
  Future<bool> isDevicePaired(String deviceId);

  /// Marks a device as paired and stores user/branch association.
  Future<void> markDeviceAsPaired({
    required String deviceId,
    required String userId,
    required String branchId,
  });
}
