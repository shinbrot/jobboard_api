import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'application.g.dart';

@JsonSerializable()
class Application extends Equatable {
  final int id;
  final int job;
  final int applicant;
  final String message;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const Application({
    required this.id,
    required this.job,
    required this.applicant,
    required this.message,
    required this.createdAt,
  });

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

  @override
  List<Object?> get props => [id, job, applicant, message, createdAt];
}