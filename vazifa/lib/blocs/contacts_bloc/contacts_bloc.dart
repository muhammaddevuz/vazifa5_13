import 'package:bloc/bloc.dart';
import 'package:vazifa/blocs/contacts_bloc/contacts_event.dart';
import 'package:vazifa/blocs/contacts_bloc/contacts_states.dart';
import 'package:vazifa/models/contact_model.dart';
import 'package:vazifa/services/contacts_services.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsInitialState()) {
    on<GetContactsEvent>(_onFetchContacts);
  }

  void _onFetchContacts(GetContactsEvent event, emit) async {
    emit(ContactsLoadingState());
    try {
      final contactsServices = ContactsServices();
      List<ContactModel> contacts = await contactsServices.fetchContacts();
      emit(ContactsLoadedState(contacts: contacts));
    } catch (error) {
      emit(ContactsErrorState(error: error.toString()));
    }
  }
}
