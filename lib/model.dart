


class ChaptersModel {
  int? chapterNumber;
  int ?versesCount;
  String? name;
  String ?translation;
  String ?transliteration;
  Meaning? meaning;
  Meaning ?summary;

  ChaptersModel(
      {this.chapterNumber,
        this.versesCount,
        this.name,
        this.translation,
        this.transliteration,
        this.meaning,
        this.summary});

  ChaptersModel.fromJson(Map<String, dynamic> json) {
    chapterNumber = json['chapter_number'];
    versesCount = json['verses_count'];
    name = json['name'];
    translation = json['translation'];
    transliteration = json['transliteration'];
    meaning =
    json['meaning'] != null ? new Meaning.fromJson(json['meaning']) : null;
    summary =
    json['summary'] != null ? new Meaning.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapter_number'] = this.chapterNumber;
    data['verses_count'] = this.versesCount;
    data['name'] = this.name;
    data['translation'] = this.translation;
    data['transliteration'] = this.transliteration;
    if (this.meaning != null) {
      data['meaning'] = this.meaning?.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary?.toJson();
    }
    return data;
  }
}

class Meaning {
  String ?en;
  String? hi;

  Meaning({this.en, this.hi});

  Meaning.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    hi = json['hi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['hi'] = this.hi;
    return data;
  }
}
