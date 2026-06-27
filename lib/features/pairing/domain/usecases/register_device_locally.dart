import 'package:dartz/dartz.dart';
import 'package:smartsign_tv/features/pairing/domain/entities/device_entity.dart';
import 'package:smartsign_tv/features/pairing/domain/failures/pairing_failures.dart';
import 'package:smartsign_tv/features/pairing/domain/repositories/i_pairing_repository.dart';

/// Use case for registering device information locally on first boot.
/// 
/// This use case creates and stores the initial device record with a unique
/// device ID and pairing code to local storage (Hive/Isar).
class RegisterDeviceLocally {
  final IPairingRepository repository;

  RegisterDeviceLocally(this.repository);

  /// Executes the local device registration use case.
  /// 
  /// Parameters:
  ///   - [device] - The device entity to register locally
  /// 
  /// Returns [Either<Failure, void>] where:
  /// - [Left] contains a [PairingFailure] if registration fails
  /// - [Right] contains void on success
  Future<Either<PairingFailure, void>> call(DeviceEntity device) async {
    try {
      return await repository.saveLocalDevice(device);
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
