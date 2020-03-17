class Report {
  final String id;
  final String nickname;
  final String aboutme;

  Report({
    this.aboutme,
    this.nickname,
    this.id,
  });

  Report.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        nickname = parsedJson['nickname'],
        aboutme = parsedJson['aboutMe'];
}
