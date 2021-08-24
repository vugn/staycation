import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:staycation/data/blocs/bloc.dart';

class SkeletonLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 209,
          margin: EdgeInsets.only(top: 30),
          child: PageView.builder(
              controller: PageController(viewportFraction: .9),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonAnimation(
                        shimmerColor: Colors.white54,
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(right: 10, left: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SkeletonAnimation(
                                borderRadius: BorderRadius.circular(10.0),
                                shimmerColor: Colors.white54,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: 15, left: 15, top: 8),
                                  height: 14,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      color: Colors.grey[300]),
                                ),
                              ),
                              SkeletonAnimation(
                                borderRadius: BorderRadius.circular(10.0),
                                shimmerColor: Colors.white54,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 2, right: 15, left: 15),
                                  height: 10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      color: Colors.grey[300]),
                                ),
                              ),
                            ],
                          ),
                          SkeletonAnimation(
                            borderRadius: BorderRadius.circular(14.0),
                            child: Container(
                              margin: EdgeInsets.only(right: 15, left: 15),
                              height: 14,
                              width: MediaQuery.of(context).size.width * .15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 32),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonAnimation(
                        shimmerColor: Colors.white54,
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          height: 19,
                          width: MediaQuery.of(context).size.width * 0.45,
                          margin: EdgeInsets.only(
                              right: 30, left: 30, bottom: 12, top: 30),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return SkeletonAnimation(
                              shimmerColor: Colors.white54,
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                height: 100,
                                margin: EdgeInsets.only(
                                    right: 30, left: 30, top: 16),
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                            );
                          })
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}

class DetailSkeletonLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        SkeletonAnimation(
          shimmerColor: Colors.white54,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: 9999,
            height: 296,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(14)),
          ),
        ),
        Container(
          width: 9999,
          margin: EdgeInsets.only(top: 266, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonAnimation(
                shimmerColor: Colors.white54,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 30),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.white54,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  margin: EdgeInsets.only(top: 4, left: 30),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 17,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
              Container(
                height: 80,
                margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: index == 3 ? 0 : 12),
                        child: SkeletonAnimation(
                          shimmerColor: Colors.white54,
                          child: Container(
                            width: 144,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      );
                    }),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.white54,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  margin: EdgeInsets.only(top: 42, left: 16),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 17,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.only(
                              right: index == (index - 1) ? 0 : 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SkeletonAnimation(
                                shimmerColor: Colors.white54,
                                child: Container(
                                  width: 14,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              SkeletonAnimation(
                                shimmerColor: Colors.white54,
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  margin: EdgeInsets.only(top: 8),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height: 17,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(14)),
                                ),
                              )
                            ],
                          ));
                    }),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.white54,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  margin: EdgeInsets.only(top: 42, left: 16),
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 17,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
              Container(
                height: 110,
                margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.only(
                              right: index == (index - 1) ? 0 : 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SkeletonAnimation(
                                shimmerColor: Colors.white54,
                                child: Container(
                                  width: 144,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SkeletonAnimation(
                                shimmerColor: Colors.white54,
                                child: Container(
                                  margin: EdgeInsets.only(top: 3),
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(14)),
                                ),
                              ),
                              SkeletonAnimation(
                                shimmerColor: Colors.white54,
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  margin: EdgeInsets.only(top: 2),
                                  width:
                                      MediaQuery.of(context).size.width * 0.18,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(14)),
                                ),
                              ),
                            ],
                          ));
                    }),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.white54,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  margin: EdgeInsets.only(top: 42, left: 16),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 17,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.white54,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class ErrorSkeleton extends StatelessWidget {
  final bloc;

  ErrorSkeleton({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 209,
          margin: EdgeInsets.only(top: 30),
          child: PageView.builder(
              controller: PageController(viewportFraction: .9),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Container(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonAnimation(
                          shimmerColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            height: 150,
                            width: 99999,
                            margin: EdgeInsets.only(right: 10, left: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14),
                                )),
                            child: Icon(
                              Icons.refresh,
                              color: Colors.grey[500],
                              size: 52,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SkeletonAnimation(
                                  borderRadius: BorderRadius.circular(10.0),
                                  shimmerColor: Colors.transparent,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: 15, left: 15, top: 8),
                                    height: 14,
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        color: Colors.grey[300]),
                                  ),
                                ),
                                SkeletonAnimation(
                                  borderRadius: BorderRadius.circular(10.0),
                                  shimmerColor: Colors.transparent,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 2, right: 15, left: 15),
                                    height: 10,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        color: Colors.grey[300]),
                                  ),
                                ),
                              ],
                            ),
                            SkeletonAnimation(
                              borderRadius: BorderRadius.circular(14.0),
                              shimmerColor: Colors.transparent,
                              child: Container(
                                margin: EdgeInsets.only(right: 15, left: 15),
                                height: 14,
                                width: MediaQuery.of(context).size.width * .15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[300]),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    bloc.add(GetApiList());
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 32),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Container(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonAnimation(
                          shimmerColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            height: 19,
                            width: MediaQuery.of(context).size.width * 0.45,
                            margin: EdgeInsets.only(
                                right: 30, left: 30, bottom: 12, top: 30),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return SkeletonAnimation(
                                shimmerColor: Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  height: 100,
                                  width: 9999,
                                  margin: EdgeInsets.only(
                                      right: 30, left: 30, top: 16),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Icon(
                                    Icons.refresh,
                                    color: Colors.grey[500],
                                    size: 52,
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  onTap: () {
                    bloc.add(GetApiList());
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                );
              }),
        )
      ],
    );
  }
}

Widget detailSkeletonLoading(BuildContext context, DetailApiBloc bloc) {
  return SingleChildScrollView(
      child: Stack(
    children: [
      SkeletonAnimation(
        shimmerColor: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 9999,
          height: 296,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(14)),
        ),
      ),
      Container(
        width: 9999,
        margin: EdgeInsets.only(top: 266, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonAnimation(
              shimmerColor: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                width: MediaQuery.of(context).size.width * 0.45,
                height: 22,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            SkeletonAnimation(
              shimmerColor: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                margin: EdgeInsets.only(top: 4, left: 30),
                width: MediaQuery.of(context).size.width * 0.35,
                height: 17,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.only(top: 24, left: 16, right: 16),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: index == 3 ? 0 : 12),
                      child: SkeletonAnimation(
                        shimmerColor: Colors.transparent,
                        child: Container(
                          width: 144,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    );
                  }),
            ),
            SkeletonAnimation(
              shimmerColor: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                margin: EdgeInsets.only(top: 42, left: 16),
                width: MediaQuery.of(context).size.width * 0.35,
                height: 17,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 8),
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: EdgeInsets.only(
                            right: index == (index - 1) ? 0 : 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SkeletonAnimation(
                              shimmerColor: Colors.transparent,
                              child: Container(
                                width: 14,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                            SkeletonAnimation(
                              shimmerColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                margin: EdgeInsets.only(top: 8),
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: 17,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                            )
                          ],
                        ));
                  }),
            ),
            SkeletonAnimation(
              shimmerColor: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                margin: EdgeInsets.only(top: 42, left: 16),
                width: MediaQuery.of(context).size.width * 0.55,
                height: 17,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            Container(
              height: 110,
              margin: EdgeInsets.only(top: 8, left: 16, right: 16),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: EdgeInsets.only(
                            right: index == (index - 1) ? 0 : 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SkeletonAnimation(
                              shimmerColor: Colors.transparent,
                              child: Container(
                                width: 144,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            SkeletonAnimation(
                              shimmerColor: Colors.transparent,
                              child: Container(
                                margin: EdgeInsets.only(top: 3),
                                width: MediaQuery.of(context).size.width * 0.24,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                            ),
                            SkeletonAnimation(
                              shimmerColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                margin: EdgeInsets.only(top: 2),
                                width: MediaQuery.of(context).size.width * 0.18,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
            SkeletonAnimation(
              shimmerColor: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                margin: EdgeInsets.only(top: 42, left: 16),
                width: MediaQuery.of(context).size.width * 0.35,
                height: 17,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            SkeletonAnimation(
              shimmerColor: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ),
      ),
    ],
  ));
}
