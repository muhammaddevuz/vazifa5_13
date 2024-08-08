import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa/blocs/messages_bloc/message_event.dart';
import 'package:vazifa/blocs/messages_bloc/message_state.dart';
import 'package:vazifa/blocs/messages_bloc/messages_bloc.dart';
import 'package:vazifa/models/contact_model.dart';
import 'package:vazifa/models/message_model.dart';

class MessagesScreen extends StatelessWidget {
  final ContactModel contact;
  const MessagesScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(contact.contactName),
      ),
      body: BlocBuilder<MessagesBloc, MessageState>(
        bloc: context.read<MessagesBloc>()..add(GetMessagesEvent()),
        builder: (context, state) {
          if (state is MessageInitialState) {
            return Center(
              child: Text("Malumotlar yoq"),
            );
          }
          if (state is MessageLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MessageErrorState) {
            return Center(
              child: Text(state.error),
            );
          }

          List<MessageModel> messages = (state as MessageLoadedState).messages;

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final MessageModel message = messages[index];
              if (message.contactId == contact.contactId ||
                  message.contactId == "1") {
                return Row(
                  mainAxisAlignment: message.contactId == "1"
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: message.contactId == "1"
                            ? Colors.blue
                            : Colors.blue,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            message.messageText,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                "${message.createdTime.hour}:${message.createdTime.minute}",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          );
        },
      ),
    );
  }
}
