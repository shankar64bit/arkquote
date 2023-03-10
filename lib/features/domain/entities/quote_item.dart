// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class QuoteItem extends Equatable {
  final int id;
  final String quoteno;
  final String itemname;
  final int qty;
  final double unitprice;

  const QuoteItem({
    @required this.id,
    @required this.quoteno,
    @required this.itemname,
    @required this.qty,
    @required this.unitprice,
  });

  @override
  List<Object> get props => [
        id,
        quoteno,
        itemname,
        qty,
        unitprice,
      ];
}
