class MessageModel {
  int messageId;
  String messageText;
  bool isFile;
  DateTime createdTime;
  String contactId;
  int status;

  MessageModel({
    required this.messageId,
    required this.messageText,
    required this.isFile,
    required this.createdTime,
    required this.contactId,
    required this.status,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageId'],
      messageText: json['messageText'],
      isFile: json['isFile'],
      createdTime: DateTime.parse(json['createdTime']),
      contactId: json['contactId'].toString(),
      status: json['status'],
    );
  }
}
