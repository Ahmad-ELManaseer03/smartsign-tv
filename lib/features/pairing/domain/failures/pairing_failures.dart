import 'package:equatable/equatable.dart';

/// Base class for all failures in the Pairing feature.
abstract class PairingFailure extends Equatable {
  const PairingFailure(this.message);

  /// Human-readable error message
  final String message;

  @override
  List<Object?> get props => [message];
}

/// Failure when Firebase Authentication operations fail.
class FirebaseAuthFailure extends PairingFailure {
  const FirebaseAuthFailure(String message) : super(message);
}

/// Failure when device storage operations fail (Hive/Isar).
class DeviceStorageFailure extends PairingFailure {
  const DeviceStorageFailure(String message) : super(message);
}

/// Failure when Firestore operations fail.
class FirestoreFailure extends PairingFailure {
  const FirestoreFailure(String message) : super(message);
}

/// Failure for unexpected/unknown errors.
class UnexpectedFailure extends PairingFailure {
  const UnexpectedFailure(String message) : super(message);
}

/// Failure when device is already paired.
class DeviceAlreadyPairedFailure extends PairingFailure {
  const DeviceAlreadyPairedFailure(String message) : super(message);
}

/// Failure when pairing code has expired.
class PairingCodeExpiredFailure extends PairingFailure {
  const PairingCodeExpiredFailure(String message) : super(message);
}

/// Failure when network is unavailable.
class NetworkFailure extends PairingFailure {
  const NetworkFailure(String message) : super(message);
}
