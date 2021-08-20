import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:staycation/fonts/stc_icons.dart';
import 'package:staycation/models/landing_page.dart';
import 'package:staycation/pages/detail.dart';
import 'package:cached_network_image/cached_network_image.dart';

const hostUrl = 'https://staycation-rand.herokuapp.com/';

class CategorySection extends StatelessWidget {
  final homeApi;
  final bloc;
  CategorySection({required this.homeApi, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: homeApi.category.length,
          itemBuilder: (BuildContext context, int index) {
            final Category category = homeApi.category[index];
            final List<CategoryItem> categoryItems =
                homeApi.category[index].items;
            return Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(category.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: categoryItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              child: Container(
                                  height: 100,
                                  margin: EdgeInsets.only(top: 16),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 2),
                                            blurRadius: 15,
                                            color: Color(0xFF616161)
                                                .withOpacity(.05))
                                      ],
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: ClipRRect(
                                              child: CachedNetworkImage(
                                                  imageUrl:
                                                      '$hostUrl${categoryItems[index].images[0].imageUrl}',
                                                  placeholder: (context, url) =>
                                                      SkeletonAnimation(
                                                        shimmerColor:
                                                            Colors.white54,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                        child: Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .grey[300],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14)),
                                                        ),
                                                      ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        child: Text(
                                                            categoryItems[index]
                                                                .title,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color(
                                                                    0xFF253342)))),
                                                    categoryItems[index]
                                                            .isPopular
                                                        ? Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 8),
                                                            alignment: Alignment
                                                                .center,
                                                            width: 55,
                                                            height: 24,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                                color: Color(
                                                                    0xFFFF498B)),
                                                            child: Text(
                                                              'Popular',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        : Container()
                                                  ],
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.only(top: 2),
                                                    child: Text(
                                                        categoryItems[index]
                                                            .city,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xFFAFAFAF)))),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 4),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          child: Text(
                                                              '\$${categoryItems[index].price}',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xFF253342)))),
                                                      Container(
                                                          child: Text('/Night',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xFFAFAFAF)))),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ]),
                                        Icon(StcIcons.right_arrow,
                                            size: 14, color: Colors.black)
                                      ],
                                    ),
                                  )),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          id: categoryItems[index].id)),
                                );
                              },
                            );
                          })),
                ],
              ),
            );
          }),
    );
  }
}
