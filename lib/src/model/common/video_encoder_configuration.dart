import 'dart:convert';

import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_encoder_configuration.g.dart';

/// If the video encoder configuration token is already known, the encoder
/// configuration can be fetched through the GetVideoEncoderConfiguration
/// command.
@JsonSerializable()
class VideoEncoderConfiguration {
  /// Unique identifier of the profile.
  @JsonKey(name: '@token')
  final String? token;

  ///User readable name. Length up to 64 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  ///Number of internal references currently using this configuration.
  ///This informational parameter is read-only. Deprecated for Media2 Service.
  @JsonKey(name: 'UseCount', fromJson: OnvifUtil.mappedToInt)
  final int useCount;

  ///Used video codec, either Jpeg, H.264 or Mpeg4
  ///- enum { 'JPEG', 'MPEG4', 'H264' }
  @JsonKey(name: 'Encoding', fromJson: OnvifUtil.nullableMappedToString)
  final String? encoding;

  ///Configured video resolution
  @JsonKey(name: 'Resolution')
  final Resolution? resolution;

  ///Relative value for the video quantizers and the quality of the video. A
  ///high value within supported quality range means higher quality
  @JsonKey(name: 'Quality', fromJson: OnvifUtil.nullableMappedToDouble)
  final double? quality;

  ///Optional element to configure rate control related parameters.
  @JsonKey(name: 'RateControl')
  final RateControl? rateControl;

  ///Optional element to configure Mpeg4 related parameters.
  @JsonKey(name: 'MPEG4')
  final Mpeg4? mpeg4;

  ///Optional element to configure H.264 related parameters.
  @JsonKey(name: 'H264')
  final H264? h264;

  ///Defines the multicast settings that could be used for video streaming.
  @JsonKey(name: 'Multicast', fromJson: OnvifUtil.emptyMapToNull)
  final MulticastConfiguration? multiCast;

  ///The rtsp session timeout for the related video stream
  @JsonKey(name: 'SessionTimeout', fromJson: OnvifUtil.nullableMappedToString)
  final String? sessionTimeout;

  VideoEncoderConfiguration(
      {this.token,
      required this.name,
      required this.useCount,
      this.encoding,
      this.resolution,
      this.quality,
      this.rateControl,
      this.mpeg4,
      this.h264,
      this.multiCast,
      this.sessionTimeout});

  factory VideoEncoderConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VideoEncoderConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VideoEncoderConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
