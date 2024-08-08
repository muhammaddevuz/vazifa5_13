import 'package:vazifa/models/message_model.dart';

sealed class MessageState {}

class MessageInitialState extends MessageState {}

class MessageLoadingState extends MessageState {}

class MessageLoadedState extends MessageState {
  final List<MessageModel> messages;
  MessageLoadedState({required this.messages});
}

class MessageErrorState extends MessageState {
  final String error;
  MessageErrorState({required this.error});
}
