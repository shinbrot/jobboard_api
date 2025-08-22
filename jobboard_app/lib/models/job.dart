import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'job.g.dart';

@JsonSerializable()
class Job extends Equatable {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'posted_by')
  final int postedBy;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const Job({
    required this.id,
    required this.title,
    required this.description,
    required this.postedBy,
    required this.createdAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);

  @override
  List<Object?> get props => [id, title, description, postedBy, createdAt];
}