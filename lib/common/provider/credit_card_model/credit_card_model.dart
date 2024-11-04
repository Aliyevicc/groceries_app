class CardModel {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  CardModel({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
  });


  Map<String, dynamic> toJson() => {
    'cardNumber': cardNumber,
    'cardHolder': cardHolder,
    'expiryDate': expiryDate,
  };

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    cardNumber: json['cardNumber'],
    cardHolder: json['cardHolder'],
    expiryDate: json['expiryDate'],
  );
}
