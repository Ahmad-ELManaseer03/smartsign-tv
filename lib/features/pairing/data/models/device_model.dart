import 'package:smartsign_tv/features/pairing/domain/entities/device_entity.dart';

/// Data Transfer Object (DTO) for device information.
/// 
/// This model extends the domain DeviceEntity and adds serialization
/// capabilities for local storage (Hive/Isar) operations.
class DeviceModel extends DeviceEntity {
  const DeviceModel({
    required super.deviceId,
    required super.pairingCode,
    required super.createdAt,
    required super.isPaired,
  });

  /// Creates a DeviceModel from a DeviceEntity.
  factory DeviceModel.fromEntity(DeviceEntity entity) {
    return DeviceModel(
      deviceId: entity.deviceId,
      pairingCode: entity.pairingCode,
      createdAt: entity.createdAt,
      isPaired: entity.isPaired,
    );
  }

  /// Converts this model to a JSON map for serialization.
  Map<String, dynamic> toJson() => {
    'deviceId': deviceId,
    'pairingCode': pairingCode,
    'createdAt': createdAt.toIso8601String(),
    'isPaired': isPaired,
  };

  /// Creates a DeviceModel from a JSON map.
  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceId: json['deviceId'] as String,
      pairingCode: json['pairingCode'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isPaired: json['isPaired'] as bool,
    );
  }

  /// Converts this model to a DeviceEntity.
  DeviceEntity toEntity() => DeviceEntity(
    deviceId: deviceId,
    pairingCode: pairingCode,
    createdAt: createdAt,
    isPaired: isPaired,
  );
}
