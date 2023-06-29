import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Failure extends Equatable {
  const Failure({required this.message, required this.timestamp});

  final String message;
  final int timestamp;

  @override
  List<Object?> get props => <Object>[message, timestamp];
}
