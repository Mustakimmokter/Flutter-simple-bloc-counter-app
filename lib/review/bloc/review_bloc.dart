import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/review/bloc/review_event.dart';
import 'package:practice_block_one/review/bloc/review_state.dart';
import 'package:practice_block_one/shared/user_services/user_review.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState>{
      ReviewBloc(): super(ReviewsNotFound()){
        const GetReviews();

        on<GetReviews>(_getReviews);
      }



      Future<void> _getReviews(GetReviews event, Emitter<ReviewState> emit)async{
        emit(ReviewsLoading());
        await Future.delayed(const Duration(seconds: 3),(){
          emit(ReviewsLoaded(reviews: UserReview.userReviewList));
          print('loaded.................');
        });

      }
}