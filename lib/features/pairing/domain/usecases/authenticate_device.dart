import 'package:dartz/dartz.dart';
import 'package:smartsign_tv/features/pairing/domain/failures/pairing_failures.dart';
import 'package:smartsign_tv/features/pairing/domain/repositories/i_pairing_repository.dart';

/// Use case for authenticating the device anonymously with Firebase.
/// 
/// This use case establishes anonymous Firebase authentication for the device,
/// enabling it to communicate with Firestore for pairing operations.
class AuthenticateDevice {
  final IPairingRepository repository;

  AuthenticateDevice(this.repository);

  /// Executes the device authentication use case.
  /// 
  /// Returns [Either<Failure, String>] where:
  /// - [Left] contains a [PairingFailure] if authentication fails
  /// - [Right] contains the Firebase user ID
  Future<Either<PairingFailure, String>> call() async {
    try {
      return await repository.authenticateAnonymously();
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
