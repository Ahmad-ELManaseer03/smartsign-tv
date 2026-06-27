import 'package:dartz/dartz.dart';
import 'package:smartsign_tv/features/pairing/domain/failures/pairing_failures.dart';
import 'package:smartsign_tv/features/pairing/domain/repositories/i_pairing_repository.dart';

/// Use case for confirming device pairing with user/branch association.
/// 
/// This use case is triggered when the web dashboard successfully claims
/// the device and syncs the user and branch information back to the TV app.
class ConfirmPairing {
  final IPairingRepository repository;

  ConfirmPairing(this.repository);

  /// Executes the pairing confirmation use case.
  /// 
  /// Parameters:
  ///   - [userId] - The user ID who claimed the device
  ///   - [branchId] - The branch ID where the device is assigned
  /// 
  /// Returns [Either<Failure, void>] where:
  /// - [Left] contains a [PairingFailure] if confirmation fails
  /// - [Right] contains void on success
  Future<Either<PairingFailure, void>> call({
    required String userId,
    required String branchId,
  }) async {
    try {
      return await repository.markDeviceAsPaired(
        userId: userId,
        branchId: branchId,
      );
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
