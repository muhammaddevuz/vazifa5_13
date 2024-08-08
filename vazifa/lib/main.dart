import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa/blocs/contacts_bloc/contacts_bloc.dart';
import 'package:vazifa/blocs/messages_bloc/messages_bloc.dart';
import 'package:vazifa/ui/screens/contacts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactsBloc()),
        BlocProvider(create: (context) => MessagesBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContactsScreen(),
      ),
    );
  }
}
