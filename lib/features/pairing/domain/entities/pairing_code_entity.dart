import 'package:equatable/equatable.dart';

/// Represents a pairing code entity in the domain layer.
/// 
/// This entity encapsulates the pairing code lifecycle: generation,
/// expiration, and claiming status.
class PairingCodeEntity extends Equatable {
  const PairingCodeEntity({
    required this.code,
    required this.deviceId,
    required this.createdAt,
    required this.expiresAt,
    required this.isClaimed,
    this.claimedAt,
    this.claimedBy,
  });

  /// The 6-digit pairing code
  final String code;

  /// Device ID associated with this code
  final String deviceId;

  /// Timestamp when the code was generated
  final DateTime createdAt;

  /// Timestamp when the code expires (typically 10 minutes after creation)
  final DateTime expiresAt;

  /// Whether the code has been claimed by the web dashboard
  final bool isClaimed;

  /// Timestamp when the code was claimed (null if not claimed)
  final DateTime? claimedAt;

  /// User ID of who claimed the code (null if not claimed)
  final String? claimedBy;

  /// Returns true if the code has expired
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Returns true if the code is valid (not expired and not claimed)
  bool get isValid => !isExpired && !isClaimed;

  @override
  List<Object?> get props => [
    code,
    deviceId,
    createdAt,
    expiresAt,
    isClaimed,
    claimedAt,
    claimedBy,
  ];

  /// Creates a copy of this entity with optional field overrides
  PairingCodeEntity copyWith({
    String? code,
    String? deviceId,
    DateTime? createdAt,
    DateTime? expiresAt,
    bool? isClaimed,
    DateTime? claimedAt,
    String? claimedBy,
  }) {
    return PairingCodeEntity(
      code: code ?? this.code,
      deviceId: deviceId ?? this.deviceId,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      isClaimed: isClaimed ?? this.isClaimed,
      claimedAt: claimedAt ?? this.claimedAt,
      claimedBy: claimedBy ?? this.claimedBy,
    );
  }
}
