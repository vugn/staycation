import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staycation/data/blocs/bloc.dart';
import 'package:staycation/widgets/detail_page.dart';
import 'package:staycation/widgets/skeleton_loading.dart';

class DetailPage extends StatefulWidget {
  final id;
  DetailPage({required this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailApiBloc _bloc = DetailApiBloc();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    _bloc.add(GetDetailApiList(id: widget.id));
  }

  void _onLoading() {
    _bloc.add(GetDetailApiList(id: widget.id));
    _refreshController.loadComplete();
  }

  void _onRefresh() {
    _bloc.add(GetDetailApiList(id: widget.id));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
          controller: _refreshController,
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
              child: SafeArea(
            child: BlocProvider(
              create: (_) => _bloc,
              child: BlocListener<DetailApiBloc, ApiState>(
                listener: (context, state) {
                  if (state is ApiError) {
                    Fluttertoast.showToast(msg: state.message);
                  }
                },
                child: BlocBuilder<DetailApiBloc, ApiState>(
                    builder: (context, state) {
                  if (state is ApiLoading) {
                    return Column(
                      children: [
                        DetailSkeletonLoading(),
                      ],
                    );
                  } else if (state is DetailApiLoaded) {
                    return detailPageWrapper(context, state.detailApi);
                  } else if (state is ApiError) {
                    return detailSkeletonLoading(
                      context,
                      _bloc,
                    );
                  }
                  return Container();
                }),
              ),
            ),
          ))),
    );
  }
}
