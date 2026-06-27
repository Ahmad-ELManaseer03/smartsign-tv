import 'package:smartsign_tv/features/pairing/data/models/device_model.dart';

/// Abstract interface for local pairing data operations (Hive/Isar).
/// 
/// This interface defines the contract for all local storage operations
/// related to device pairing. Implementation will use Hive or Isar.
abstract class IPairingLocalDataSource {
  /// Saves device information to local storage.
  Future<void> saveDevice(DeviceModel device);

  /// Retrieves device information from local storage.
  Future<DeviceModel?> getDevice();

  /// Checks if device exists in local storage.
  Future<bool> hasDevice();

  /// Clears all device information from local storage.
  Future<void> clearDevice();
}
