import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'job_create_params.g.dart';

@JsonSerializable()
class JobCreateParams extends Equatable {
  final String title;
  final String description;
  @JsonKey(name: 'posted_by')
  final int postedBy;

  const JobCreateParams({
    required this.title,
    required this.description,
    required this.postedBy,
  });

  factory JobCreateParams.fromJson(Map<String, dynamic> json) => _$JobCreateParamsFromJson(json);
  Map<String, dynamic> toJson() => _$JobCreateParamsToJson(this);

  @override
  List<Object?> get props => [title, description, postedBy];
}