import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa/blocs/contacts_bloc/contacts_bloc.dart';
import 'package:vazifa/blocs/contacts_bloc/contacts_event.dart';
import 'package:vazifa/blocs/contacts_bloc/contacts_states.dart';
import 'package:vazifa/models/contact_model.dart';
import 'package:vazifa/ui/screens/messages_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Contacts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<ContactsBloc, ContactsState>(
        bloc: context.read<ContactsBloc>()..add(GetContactsEvent()),
        builder: (context, state) {
          if (state is ContactsInitialState) {
            return Center(
              child: Text("Malumotlar Topilmadi"),
            );
          }
          if (state is ContactsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ContactsErrorState) {
            return Center(child: Text(state.error));
          }

          final contactsList = (state as ContactsLoadedState).contacts;

          return ListView.builder(
            itemCount: contactsList.length,
            itemBuilder: (context, index) {
              final ContactModel contact = contactsList[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MessagesScreen(contact: contact)));
                },
                minLeadingWidth: 70,
                minTileHeight: 70,
                leading: SizedBox(
                  height: 200,
                  width: 70,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: 60,
                          width: 60,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(contact.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      if (contact.isOnline)
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: Icon(
                            Icons.circle,
                            size: 15,
                            color: Colors.green,
                          ),
                        ),
                    ],
                  ),
                ),
                title: Text(
                  "${contact.contactName} ${contact.contactLastname}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
