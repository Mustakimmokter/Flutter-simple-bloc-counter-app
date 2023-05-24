import 'package:equatable/equatable.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent ();
}


class GetReviews extends ReviewEvent {
  const GetReviews();
  @override
  List<Object?> get props => [];
}
