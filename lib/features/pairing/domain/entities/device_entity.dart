import 'package:equatable/equatable.dart';

/// Represents a TV device in the pairing domain.
/// 
/// This entity encapsulates the core business logic for device identification,
/// pairing status, and local storage metadata.
class DeviceEntity extends Equatable {
  const DeviceEntity({
    required this.deviceId,
    required this.pairingCode,
    required this.createdAt,
    required this.isPaired,
  });

  /// Unique device identifier (UUID generated on first boot)
  final String deviceId;

  /// 6-digit pairing code for web dashboard claiming
  final String pairingCode;

  /// Timestamp when device was first initialized
  final DateTime createdAt;

  /// Whether the device has been successfully claimed by the web dashboard
  final bool isPaired;

  @override
  List<Object?> get props => [deviceId, pairingCode, createdAt, isPaired];

  /// Creates a copy of this entity with optional field overrides
  DeviceEntity copyWith({
    String? deviceId,
    String? pairingCode,
    DateTime? createdAt,
    bool? isPaired,
  }) {
    return DeviceEntity(
      deviceId: deviceId ?? this.deviceId,
      pairingCode: pairingCode ?? this.pairingCode,
      createdAt: createdAt ?? this.createdAt,
      isPaired: isPaired ?? this.isPaired,
    );
  }
}
