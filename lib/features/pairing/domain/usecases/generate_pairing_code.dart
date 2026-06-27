import 'package:dartz/dartz.dart';
import 'package:smartsign_tv/features/pairing/domain/failures/pairing_failures.dart';
import 'package:smartsign_tv/features/pairing/domain/repositories/i_pairing_repository.dart';

/// Use case for generating a pairing code for device registration.
/// 
/// This use case orchestrates the generation of a unique 6-digit code that
/// the web dashboard will use to claim/pair the TV device.
class GeneratePairingCode {
  final IPairingRepository repository;

  GeneratePairingCode(this.repository);

  /// Executes the pairing code generation use case.
  /// 
  /// Returns [Either<Failure, String>] where:
  /// - [Left] contains a [PairingFailure] if generation fails
  /// - [Right] contains the generated 6-digit code
  Future<Either<PairingFailure, String>> call() async {
    try {
      return await repository.generatePairingCode();
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
