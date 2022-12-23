class Card {
  final String card_no, exp_date, cvv;

  Card(this.card_no, this.exp_date, this.cvv);

  Card.fromJson(Map<String, dynamic> json)
      : card_no = json['card_no'],
        exp_date = json['exp_date'],
        cvv = json['cvv'];

  Map<String, dynamic> toJson() =>
      {card_no: card_no, exp_date: exp_date, cvv: cvv};
}
