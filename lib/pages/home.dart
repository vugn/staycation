import 'package:flutter/material.dart';
import 'package:staycation/data/api_response.dart';
import 'package:staycation/fonts/stc_icons.dart';
import 'package:staycation/models/landing_page.dart';
import 'package:staycation/widgets/category.dart';
import 'package:staycation/widgets/most_picked.dart';
import 'package:staycation/widgets/skeleton_loading.dart';
import 'package:staycation/data/landing_page_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const hostUrl = 'https://staycation-rand.herokuapp.com/';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late HomeApiBloc _bloc;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    _bloc = HomeApiBloc();
  }

  void _onLoading() async {
    // monitor network fetch
    await _bloc.fetchLandingPage();
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    await _bloc.fetchLandingPage();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: Drawer(),
        body: SmartRefresher(
            controller: _refreshController,
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
                child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: IconButton(
                        onPressed: () => _key.currentState!.openDrawer(),
                        icon: Icon(
                          StcIcons.fries_bar,
                          size: 18,
                        )),
                  ),
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
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 35, right: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 15,
                              color: Color(0xFF616161).withOpacity(.05))
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Find your staycation',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFFAFAFAF),
                            fontWeight: FontWeight.w400),
                        contentPadding: EdgeInsets.all(20),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Container(
                          margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
                          width: 39,
                          height: 39,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xFF3252DF)),
                          child: IconButton(
                            icon: Icon(
                              StcIcons.search,
                              color: Colors.white,
                              size: 16,
                            ),
                            onPressed: () => {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(27.5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(27.5))),
                      ),
                    ),
                  ),
                  StreamBuilder<ApiResponse<HomeApi>>(
                    stream: _bloc.landingPageStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return Column(
                              children: [
                                SkeletonLoading(),
                              ],
                            );
                          case Status.COMPLETED:
                            return Column(
                              children: [
                                MostPickedSection(
                                  homeApi: snapshot.data!.data,
                                  bloc: _bloc,
                                ),
                                CategorySection(
                                  homeApi: snapshot.data!.data,
                                  bloc: _bloc,
                                ),
                              ],
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
                ],
              ),
            ))));
  }
}
