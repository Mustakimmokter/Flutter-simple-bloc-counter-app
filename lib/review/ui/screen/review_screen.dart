import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/home/home_screen.dart';
import 'package:practice_block_one/review/bloc/review_bloc.dart';
import 'package:practice_block_one/review/bloc/review_event.dart';
import 'package:practice_block_one/review/bloc/review_state.dart';
import 'package:practice_block_one/shared/user_services/user_review.dart';
import 'package:practice_block_one/shared/widgets/custom_text.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ReviewBloc()..add(const GetReviews()),
      child: BuildReviewScreen(),
    );
  }
}

// ignore: must_be_immutable
class BuildReviewScreen extends StatelessWidget {
  BuildReviewScreen({Key? key}) : super(key: key);

  late ReviewBloc _reviewBloc;

  @override
  Widget build(BuildContext context) {
    _reviewBloc = BlocProvider.of<ReviewBloc>(context);
    return Scaffold(
      body: BlocListener<ReviewBloc, ReviewState>(
        bloc: _reviewBloc,
        listener: (context, state) {
          // if(state is ReviewsNotFound){
          //   print('Loading..............');
          //   _reviewBloc.add(const GetReviews());
          // }
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 25),
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.grey.shade200,
              child: const CustomText(text: 'Reviews', fontSize: 18),
            ),
            BlocBuilder<ReviewBloc, ReviewState>(
              builder: (context, state) {
                if (state is ReviewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                } else if (state is ReviewsLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: state.reviews[index].name),
                            CustomText(
                              text: state.reviews[index].review,
                              fontWeight: FontWeight.normal,
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CustomText(
                      text: 'No reviews',
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
