import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage extends Equatable {
  final int id;
  final int sender;
  final int receiver;
  final String message;
  final String timestamp;

  const ChatMessage({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  @override
  List<Object?> get props => [id, sender, receiver, message, timestamp];
}