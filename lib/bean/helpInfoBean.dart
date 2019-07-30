class BgImageInfo {
    final int id;
    final int type;
    final String question;
    final String answer;
    BgImageInfo({this.id, this.type, this.question, this.answer});
    factory BgImageInfo.fromJson(Map<String, dynamic> json){
        return BgImageInfo(
            id: json['id'],
            type: json['type'],
            question: json['question'],
            answer: json['answer'],
        );
    }
}