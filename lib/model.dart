class channelModel {
  num? id;
  String? title;
  String? videoUrl;
  String? coverPicture;

  channelModel(
      {required this.id,
      required this.title,
      required this.videoUrl,
      required this.coverPicture});

  channelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['videoUrl'];
    coverPicture = json['coverPicture'];
  }
}
