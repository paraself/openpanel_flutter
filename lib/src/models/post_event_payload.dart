import 'package:equatable/equatable.dart';

class PostEventPayload extends Equatable {
  final String name;
  final String timestamp;
  final String? deviceId;
  final String? profileId;
  final Map<String, dynamic> properties;

  const PostEventPayload({
    required this.name,
    required this.timestamp,
    this.deviceId,
    this.profileId,
    this.properties = const {},
  });

  factory PostEventPayload.fromJson(Map<String, dynamic> json) {
    return PostEventPayload(
      name: json['name'],
      timestamp: json['timestamp'],
      deviceId: json['deviceId'],
      profileId: json['profileId'],
      properties: json['properties'],
    );
  }

  Map<String, dynamic> toJson() {
    // OpenPanel server schema rejects explicit `null` for optional fields
    // (e.g. profileId before login). Omit them when unset.
    return {
      'name': name,
      'timestamp': timestamp,
      if (deviceId != null) 'deviceId': deviceId,
      if (profileId != null) 'profileId': profileId,
      'properties': properties,
    };
  }

  @override
  List<Object?> get props => [name, timestamp, deviceId, profileId, properties];
}
