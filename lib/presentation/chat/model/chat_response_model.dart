class ChatResponseModel {
  ChatResponseModel({
    this.data,
    this.message,
  });

  ChatResponseModel.fromJson(final Map<String, dynamic>? json)
      : data = (json?['data'] as List?)
            ?.map((final dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        message = json?['message'] as String?;
  final List<Data>? data;
  final String? message;

  Map<String, dynamic> toJson() =>
      {'data': data?.map((final e) => e.toJson()).toList(), 'message': message};
}

class Data {
  Data({
    this.id,
    this.title,
    this.messages,
    this.createdAt,
    this.v,
  });

  Data.fromJson(final Map<String, dynamic>? json)
      : id = json?['_id'] as String?,
        title = json?['title'] as String?,
        messages = (json?['messages'] as List?)
            ?.map((final dynamic e) => MessagesList.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt = json?['createdAt'] as String?,
        v = json?['__v'] as int?;
  final String? id;
  final String? title;
  final List<MessagesList>? messages;
  final String? createdAt;
  final int? v;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'messages': messages?.map((final e) => e.toJson()).toList(),
        'createdAt': createdAt,
        '__v': v,
      };
}

class MessagesList {
  MessagesList({
    this.user,
    this.createdAt,
    this.text,
    this.medias,
    this.quickReplies,
    this.customProperties,
    this.mentions,
    this.status,
    this.replyTo,
    this.isMarkdown,
    this.id,
  });

  MessagesList.fromJson(final Map<String, dynamic>? json)
      : user = (json?['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json?['user'] as Map<String, dynamic>)
            : null,
        createdAt = json?['createdAt'] as String?,
        text = json?['text'] as String?,
        medias = json?['medias'],
        quickReplies = json?['quickReplies'],
        customProperties = json?['customProperties'],
        mentions = json?['mentions'],
        status = json?['status'] as String?,
        replyTo = json?['replyTo'],
        isMarkdown = json?['isMarkdown'] as bool?,
        id = json?['_id'] as String?;
  final User? user;
  final String? createdAt;
  final String? text;
  final dynamic medias;
  final dynamic quickReplies;
  final dynamic customProperties;
  final dynamic mentions;
  final String? status;
  final dynamic replyTo;
  final bool? isMarkdown;
  final String? id;

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'createdAt': createdAt,
        'text': text,
        'medias': medias,
        'quickReplies': quickReplies,
        'customProperties': customProperties,
        'mentions': mentions,
        'status': status,
        'replyTo': replyTo,
        'isMarkdown': isMarkdown,
        '_id': id,
      };
}

class User {
  User({
    this.id,
    this.profileImage,
    this.firstName,
    this.lastName,
    this.customProperties,
    this.mongoId,
  });

  User.fromJson(final Map<String, dynamic>? json)
      : id = json?['id'] as String?,
        profileImage = json?['profileImage'],
        firstName = json?['firstName'] as String?,
        lastName = json?['lastName'],
        customProperties = json?['customProperties'],
        mongoId = json?['_id'] as String?;
  final String? id;
  final dynamic profileImage;
  final String? firstName;
  final dynamic lastName;
  final dynamic customProperties;
  final String? mongoId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'profileImage': profileImage,
        'firstName': firstName,
        'lastName': lastName,
        'customProperties': customProperties,
        '_id': mongoId,
      };
}
