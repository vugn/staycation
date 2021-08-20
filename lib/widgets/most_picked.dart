import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:staycation/models/landing_page.dart';
import 'package:staycation/pages/detail.dart';

const hostUrl = 'https://staycation-rand.herokuapp.com/';

class MostPickedSection extends StatelessWidget {
  final HomeApi homeApi;
  final bloc;
  MostPickedSection({required this.homeApi, required this.bloc});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 209,
        margin: EdgeInsets.only(top: 30),
        child: PageView.builder(
            controller: PageController(viewportFraction: .9),
            scrollDirection: Axis.horizontal,
            itemCount: homeApi.mostPicked.length,
            itemBuilder: (BuildContext context, int index) {
              final MostPicked mostPicked = homeApi.mostPicked[index];
              final List<MostPickedImage> mostPickedImage =
                  homeApi.mostPicked[index].images;

              return InkWell(
                child: Container(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: ClipRRect(
                            child: CachedNetworkImage(
                                imageUrl:
                                    '$hostUrl${mostPickedImage[0].imageUrl}',
                                placeholder: (context, url) =>
                                    SkeletonAnimation(
                                      shimmerColor: Colors.white54,
                                      borderRadius: BorderRadius.circular(14),
                                      child: Container(
                                        height: 150,
                                        margin: EdgeInsets.only(
                                            right: 10, left: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(14),
                                              topRight: Radius.circular(14),
                                            )),
                                      ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                width: 99999,
                                height: 150,
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 8, left: 15),
                                child: Text(
                                  mostPicked.title,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF253342)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2, left: 15),
                                child: Text(
                                  mostPicked.city,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFAFAFAF)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8, right: 30),
                            child: Row(
                              children: [
                                Text(
                                  '\$${mostPicked.price}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF253342)),
                                ),
                                Text(
                                  '/Night',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFAFAFAF)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(id: mostPicked.id)),
                  );
                },
              );
            }));
  }
}
