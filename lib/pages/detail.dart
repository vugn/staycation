import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staycation/data/api_response.dart';
import 'package:staycation/data/bloc.dart';
import 'package:staycation/models/detail_page.dart';
import 'package:staycation/widgets/detail_page.dart';
import 'package:staycation/widgets/skeleton_loading.dart';

class DetailPage extends StatefulWidget {
  final id;
  DetailPage({required this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailApiBloc _bloc;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    _bloc = DetailApiBloc(widget.id);
  }

  void _onLoading() async {
    // monitor network fetch
    await _bloc.fetchDetailPage(widget.id);
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    await _bloc.fetchDetailPage(widget.id);
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
            child: StreamBuilder<ApiResponse<DetailApi>>(
              stream: _bloc.detailPageStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return Center(
                        child: DetailSkeletonLoading(),
                      );
                    case Status.COMPLETED:
                      return DetailPageWrapper(
                        bloc: _bloc,
                        detailApi: snapshot.data!.data,
                      );
                    case Status.ERROR:
                      Fluttertoast.showToast(msg: snapshot.data!.message);
                      return ErrorSkeleton(
                        bloc: _bloc,
                      );
                  }
                }
                return Container();
              },
            ),
          ))),
    );
  }
}
