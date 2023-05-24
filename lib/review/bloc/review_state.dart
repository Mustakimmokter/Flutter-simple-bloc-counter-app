import 'package:equatable/equatable.dart';

abstract class ReviewState extends Equatable {}


class ReviewsLoading extends ReviewState {
  @override
  List<Object?> get props => [];
}


class ReviewsNotFound extends ReviewState {
  @override
  List<Object?> get props => [];
}


class ReviewsLoaded extends ReviewState {
  ReviewsLoaded({required this.reviews});

  final List reviews;

  @override
  List<Object?> get props => [reviews];
}