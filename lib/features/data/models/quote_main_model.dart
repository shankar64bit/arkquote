import '../../domain/entities/quote_main.dart';

class QuoteMainModel extends QuoteMain {
  const QuoteMainModel({
    final int id,
    final String client,
    final String address,
    final String quotename,
    final DateTime quotedate,
  }) : super(
          id: id,
          client: client,
          address: address,
          quotename: quotename,
          quotedate: quotedate,
        );

  @override
  List<Object> get props => [
        id,
        client,
        address,
        quotename,
        quotedate,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client': client,
      'address': address,
      'quotename': quotename,
      'quotedate': quotedate,
    };
  }

  factory QuoteMainModel.fromJson(Map<String, dynamic> json) {
    return QuoteMainModel(
      id: json['id'],
      client: json['client'],
      address: json['address'],
      quotename: json['quotename'],
      quotedate: json['quotedate'],
    );
  }
}
