import 'package:dartz/dartz.dart';
import 'package:smartsign_tv/features/pairing/domain/entities/pairing_code_entity.dart';
import 'package:smartsign_tv/features/pairing/domain/failures/pairing_failures.dart';
import 'package:smartsign_tv/features/pairing/domain/repositories/i_pairing_repository.dart';

/// Use case for watching pairing code updates from Firestore.
/// 
/// This use case sets up a real-time listener to Firestore for pairing code
/// updates, allowing the UI to react when the web dashboard claims the device.
class WatchPairingStatus {
  final IPairingRepository repository;

  WatchPairingStatus(this.repository);

  /// Executes the watch pairing status use case.
  /// 
  /// Parameters:
  ///   - [deviceId] - The device ID to watch for pairing updates
  /// 
  /// Returns a [Stream] that emits [Either<Failure, PairingCodeEntity>]:
  /// - [Left] contains a [PairingFailure] if Firestore read fails
  /// - [Right] contains the updated pairing code entity
  Stream<Either<PairingFailure, PairingCodeEntity>> call(String deviceId) {
    try {
      return repository.watchPairingCode(deviceId);
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(e.toString())));
    }
  }
}
