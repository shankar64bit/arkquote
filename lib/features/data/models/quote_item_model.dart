import '../../domain/entities/quote_item.dart';

class QuoteItemModel extends QuoteItem {
  const QuoteItemModel({
    final int id,
    final String quoteno,
    final String itemname,
    final int qty,
    final double unitprice,
  }) : super(
          id: id,
          quoteno: quoteno,
          itemname: itemname,
          qty: qty,
          unitprice: unitprice,
        );

  @override
  List<Object> get props => [
        id,
        quoteno,
        itemname,
        qty,
        unitprice,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quoteno': quoteno,
      'itemname': itemname,
      'qty': qty,
      'unitprice': unitprice,
    };
  }

  factory QuoteItemModel.fromJson(Map<String, dynamic> json) {
    return QuoteItemModel(
      id: json['id'],
      quoteno: json['quoteno'],
      itemname: json['itemname'],
      qty: json['qty'],
      unitprice: json['unitprice'],
    );
  }
}
