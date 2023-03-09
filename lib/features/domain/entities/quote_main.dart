// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class QuoteMain extends Equatable {
  final int id;
  final String client;
  final String address;
  final String quotename;
  final DateTime quotedate;

  const QuoteMain({
    @required this.id,
    @required this.client,
    @required this.address,
    @required this.quotename,
    @required this.quotedate,
  });

  @override
  List<Object> get props => [
        id,
        client,
        address,
        quotename,
        quotedate,
      ];
}
