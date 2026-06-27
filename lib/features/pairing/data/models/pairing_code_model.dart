import 'package:smartsign_tv/features/pairing/domain/entities/pairing_code_entity.dart';

/// Data Transfer Object (DTO) for pairing code information.
/// 
/// This model extends the domain PairingCodeEntity and adds serialization
/// capabilities for Firestore operations.
class PairingCodeModel extends PairingCodeEntity {
  const PairingCodeModel({
    required super.code,
    required super.deviceId,
    required super.createdAt,
    required super.expiresAt,
    required super.isClaimed,
    super.claimedAt,
    super.claimedBy,
  });

  /// Creates a PairingCodeModel from a PairingCodeEntity.
  factory PairingCodeModel.fromEntity(PairingCodeEntity entity) {
    return PairingCodeModel(
      code: entity.code,
      deviceId: entity.deviceId,
      createdAt: entity.createdAt,
      expiresAt: entity.expiresAt,
      isClaimed: entity.isClaimed,
      claimedAt: entity.claimedAt,
      claimedBy: entity.claimedBy,
    );
  }

  /// Converts this model to a JSON map for Firestore.
  Map<String, dynamic> toJson() => {
    'code': code,
    'deviceId': deviceId,
    'createdAt': createdAt.toIso8601String(),
    'expiresAt': expiresAt.toIso8601String(),
    'isClaimed': isClaimed,
    'claimedAt': claimedAt?.toIso8601String(),
    'claimedBy': claimedBy,
  };

  /// Creates a PairingCodeModel from a JSON map.
  factory PairingCodeModel.fromJson(Map<String, dynamic> json) {
    return PairingCodeModel(
      code: json['code'] as String,
      deviceId: json['deviceId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      isClaimed: json['isClaimed'] as bool,
      claimedAt: json['claimedAt'] != null
          ? DateTime.parse(json['claimedAt'] as String)
          : null,
      claimedBy: json['claimedBy'] as String?,
    );
  }

  /// Converts this model to a PairingCodeEntity.
  PairingCodeEntity toEntity() => PairingCodeEntity(
    code: code,
    deviceId: deviceId,
    createdAt: createdAt,
    expiresAt: expiresAt,
    isClaimed: isClaimed,
    claimedAt: claimedAt,
    claimedBy: claimedBy,
  );
}
