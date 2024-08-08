import 'package:bloc/bloc.dart';
import 'package:vazifa/blocs/messages_bloc/message_event.dart';
import 'package:vazifa/blocs/messages_bloc/message_state.dart';
import 'package:vazifa/models/message_model.dart';
import 'package:vazifa/services/message_services.dart';

class MessagesBloc extends Bloc<MessageEvent, MessageState> {
  MessagesBloc() : super(MessageInitialState()) {
    on<GetMessagesEvent>(_onFecthMessages);
  }

  void _onFecthMessages(GetMessagesEvent event, emit) async {
    emit(MessageLoadingState());
    try {
      final messageServices = MessageServices();
      List<MessageModel> messages = await messageServices.fetchMessages();
      emit(MessageLoadedState(messages: messages));
    } catch (error) {
      emit(MessageErrorState(error: error.toString()));
    }
  }
}
