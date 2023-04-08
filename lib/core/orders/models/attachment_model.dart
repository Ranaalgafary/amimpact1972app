import 'dart:convert';

class AttachmentModel {
  String? name;
  String? type;
  int? error;
  int? size;
  String? file;
  bool? success;
  String? url;
  String? preview;
  String? download;
  String? attachmentId;
  String? hash;
  String? comment;

  AttachmentModel({
    this.name,
    this.type,
    this.error,
    this.size,
    this.file,
    this.success,
    this.url,
    this.preview,
    this.download,
    this.attachmentId,
    this.hash,
    this.comment,
  });

  factory AttachmentModel.fromMap(Map<String, dynamic> data) {
    return AttachmentModel(
      name: data['name'] as String?,
      type: data['type'] as String?,
      error: data['error'] as int?,
      size: data['size'] as int?,
      file: data['file'] as String?,
      success: data['success'] as bool?,
      url: data['url'] as String?,
      preview: data['preview'] as String?,
      download: data['download'] as String?,
      attachmentId: data['attachment_id'] as String?,
      hash: data['hash'] as String?,
      comment: data['comment'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'type': type,
        'error': error,
        'size': size,
        'file': file,
        'success': success,
        'url': url,
        'preview': preview,
        'download': download,
        'attachment_id': attachmentId,
        'hash': hash,
        'comment': comment,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AttachmentModel].
  factory AttachmentModel.fromJson(String data) {
    return AttachmentModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AttachmentModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
