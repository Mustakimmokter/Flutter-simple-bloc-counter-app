

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:practice_block_one/shared/internet/enum.dart';

@immutable
abstract class InternetConnectionState extends Equatable {}

class InternetConnectionChecking extends InternetConnectionState {
  InternetConnectionChecking();

  @override
  List<Object?> get props => [];
}

class InternetConnected extends InternetConnectionState {
  InternetConnected({required this.connectionType});

  final ConnectionType connectionType;

  @override
  List<Object?> get props => [connectionType];
}

class InternetDisconnected extends InternetConnectionState {
  @override
  List<Object?> get props => [];
}

class InternetConnectionRetrying extends InternetConnectionState {
  InternetConnectionRetrying();

  @override
  List<Object?> get props => [];
}