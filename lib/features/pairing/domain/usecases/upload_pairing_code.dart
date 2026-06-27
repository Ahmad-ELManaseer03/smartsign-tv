import 'package:dartz/dartz.dart';
import 'package:smartsign_tv/features/pairing/domain/failures/pairing_failures.dart';
import 'package:smartsign_tv/features/pairing/domain/repositories/i_pairing_repository.dart';

/// Use case for uploading the pairing code to Firestore.
/// 
/// This use case syncs the locally generated pairing code to Firestore,
/// making it available for the web dashboard to discover and claim.
class UploadPairingCode {
  final IPairingRepository repository;

  UploadPairingCode(this.repository);

  /// Executes the pairing code upload use case.
  /// 
  /// Parameters:
  ///   - [code] - The 6-digit pairing code to upload
  /// 
  /// Returns [Either<Failure, void>] where:
  /// - [Left] contains a [PairingFailure] if upload fails
  /// - [Right] contains void on success
  Future<Either<PairingFailure, void>> call(String code) async {
    try {
      return await repository.uploadPairingCode(code);
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
