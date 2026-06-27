import 'package:dartz/dartz.dart';
import 'package:smartsign_tv/features/pairing/domain/entities/device_entity.dart';
import 'package:smartsign_tv/features/pairing/domain/entities/pairing_code_entity.dart';
import 'package:smartsign_tv/features/pairing/domain/failures/pairing_failures.dart';

/// Abstract repository interface for pairing operations.
/// 
/// This interface defines the contract for all pairing-related data operations.
/// Implementation details (Firebase, local storage) are hidden in the data layer.
abstract class IPairingRepository {
  /// Generates a unique 6-digit pairing code for the device.
  /// 
  /// Returns [Either<Failure, String>] where:
  /// - [Left] contains a [PairingFailure] if generation fails
  /// - [Right] contains the generated 6-digit code
  Future<Either<PairingFailure, String>> generatePairingCode();

  /// Retrieves the current device information from local storage.
  /// 
  /// Returns [Either<Failure, DeviceEntity>] where:
  /// - [Left] contains a [PairingFailure] if retrieval fails
  /// - [Right] contains the device entity
  Future<Either<PairingFailure, DeviceEntity>> getLocalDevice();

  /// Saves device information to local storage (Hive/Isar).
  /// 
  /// Parameters:
  ///   - [device] - The device entity to save
  /// 
  /// Returns [Either<Failure, void>] where:
  /// - [Left] contains a [PairingFailure] if save fails
  /// - [Right] contains void on success
  Future<Either<PairingFailure, void>> saveLocalDevice(DeviceEntity device);

  /// Listens to pairing code updates from Firestore for the current device.
  /// 
  /// Returns a [Stream] that emits [Either<Failure, PairingCodeEntity>]:
  /// - [Left] contains a [PairingFailure] if Firestore read fails
  /// - [Right] contains the pairing code entity
  Stream<Either<PairingFailure, PairingCodeEntity>> watchPairingCode(
    String deviceId,
  );

  /// Uploads the pairing code to Firestore for the device.
  /// 
  /// Parameters:
  ///   - [code] - The 6-digit pairing code to upload
  /// 
  /// Returns [Either<Failure, void>] where:
  /// - [Left] contains a [PairingFailure] if upload fails
  /// - [Right] contains void on success
  Future<Either<PairingFailure, void>> uploadPairingCode(String code);

  /// Authenticates the device anonymously with Firebase.
  /// 
  /// Returns [Either<Failure, String>] where:
  /// - [Left] contains a [PairingFailure] if auth fails
  /// - [Right] contains the Firebase user ID
  Future<Either<PairingFailure, String>> authenticateAnonymously();

  /// Checks if the current device is already paired.
  /// 
  /// Returns [Either<Failure, bool>] where:
  /// - [Left] contains a [PairingFailure] if check fails
  /// - [Right] contains true if paired, false otherwise
  Future<Either<PairingFailure, bool>> isDevicePaired();

  /// Marks the device as paired and stores the user/branch association.
  /// 
  /// Parameters:
  ///   - [userId] - The user ID who claimed the device
  ///   - [branchId] - The branch ID where the device is assigned
  /// 
  /// Returns [Either<Failure, void>] where:
  /// - [Left] contains a [PairingFailure] if marking fails
  /// - [Right] contains void on success
  Future<Either<PairingFailure, void>> markDeviceAsPaired({
    required String userId,
    required String branchId,
  });
}
