class ContactModel {
  String contactId;
  String contactName;
  String contactLastname;
  bool isOnline;
  String imageUrl;
  DateTime lastOnlineTime;

  ContactModel({
    required this.contactId,
    required this.contactName,
    required this.contactLastname,
    required this.isOnline,
    required this.imageUrl,
    required this.lastOnlineTime,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      contactId: json['contactId'].toString(),
      contactName: json['contactName'],
      contactLastname: json['contactLastname'],
      isOnline: json['isOnline'],
      imageUrl: json['imageUrl'],
      lastOnlineTime: DateTime.parse(json['lastOnlineTime']),
    );
  }
}
