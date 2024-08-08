import 'package:vazifa/models/contact_model.dart';

sealed class ContactsState {}

class ContactsInitialState extends ContactsState {}

class ContactsLoadingState extends ContactsState{}

class ContactsLoadedState extends ContactsState{
  final List<ContactModel> contacts;
  ContactsLoadedState({required this.contacts});
}

class ContactsErrorState extends ContactsState{
   String error;
  ContactsErrorState({required this.error});
}
