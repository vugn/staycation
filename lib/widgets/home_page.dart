import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:staycation/data/blocs/api_bloc/bloc.dart';
import 'package:staycation/widgets/category.dart';
import 'package:staycation/widgets/most_picked.dart';
import 'package:staycation/widgets/skeleton_loading.dart';

class HomePageSection extends StatefulWidget {
  const HomePageSection({Key? key}) : super(key: key);

  @override
  _HomePageSectionState createState() => _HomePageSectionState();
}

class _HomePageSectionState extends State<HomePageSection> {
  final HomeApiBloc _bloc = HomeApiBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, top: 35),
              width: 257,
              child: Text(
                'Forget Busy Work, Start Next Vacation',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            BlocProvider<HomeApiBloc>(
              create: (_) => _bloc..add(GetApiList()),
              child: BlocListener<HomeApiBloc, ApiState>(
                listener: (context, state) {
                  if (state is ApiError) {
                    Fluttertoast.showToast(msg: state.message);
                  }
                },
                child: BlocBuilder<HomeApiBloc, ApiState>(
                    builder: (context, state) {
                  if (state is ApiLoading) {
                    return Column(
                      children: [
                        SkeletonLoading(),
                      ],
                    );
                  } else if (state is HomeApiLoaded) {
                    return Column(
                      children: [
                        mostPickedSection(context, state.homeApi),
                        CategorySection(category: state.homeApi.category),
                      ],
                    );
                  } else if (state is ApiError) {
                    return ErrorSkeleton(
                      bloc: _bloc,
                    );
                  }
                  return Container();
                }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
