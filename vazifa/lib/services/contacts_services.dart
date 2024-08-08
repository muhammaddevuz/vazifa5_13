import 'package:dio/dio.dart';
import 'package:vazifa/models/contact_model.dart';

class ContactsServices {
  final dio = Dio();

  Future<List<ContactModel>> fetchContacts() async {
    List<ContactModel> contacts = [];

    try {
      final response = await dio.get(
          "https://oy-3-dars-6-default-rtdb.firebaseio.com/contacts.json");
      response.data.forEach((key, value) {
        for (var item in value) {
          contacts.add(ContactModel.fromJson(item));
        }
      });
      print(contacts);
      return contacts;
    } on DioException catch (error) {
      throw error.message.toString();
    } catch (error) {
      rethrow;
    }
  }
}
