import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'chat_message_create_params.g.dart';

@JsonSerializable()
class ChatMessageCreateParams extends Equatable {
  final int sender;
  final int receiver;
  final String message;

  const ChatMessageCreateParams({
    required this.sender,
    required this.receiver,
    required this.message,
  });

  factory ChatMessageCreateParams.fromJson(Map<String, dynamic> json) => _$ChatMessageCreateParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageCreateParamsToJson(this);

  @override
  List<Object?> get props => [sender, receiver, message];
}