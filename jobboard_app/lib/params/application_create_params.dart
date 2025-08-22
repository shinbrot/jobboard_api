import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'application_create_params.g.dart';

@JsonSerializable()
class ApplicationCreateParams extends Equatable {
  final int job;
  final int applicant;
  final String message;

  const ApplicationCreateParams({
    required this.job,
    required this.applicant,
    required this.message,
  });

  factory ApplicationCreateParams.fromJson(Map<String, dynamic> json) => _$ApplicationCreateParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationCreateParamsToJson(this);

  @override
  List<Object?> get props => [job, applicant, message];
}