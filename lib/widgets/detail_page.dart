import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:staycation/fonts/stc_icons.dart';
import 'package:staycation/globals/config.dart';
import 'package:staycation/models/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:staycation/pages/checkout.dart';

class DetailPageWrapper extends StatelessWidget {
  final DetailApi detailApi;
  final bloc;
  DetailPageWrapper({required this.detailApi, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        CachedNetworkImage(
            imageUrl: "$baseUrl${detailApi.images[0].imageUrl}",
            width: 9999,
            height: 296,
            fit: BoxFit.cover),
        Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Container(
              margin: EdgeInsets.only(top: 16, right: 16),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                  padding:
                      EdgeInsets.only(top: 12, right: 10, left: 12, bottom: 12),
                  alignment: Alignment.center,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    StcIcons.right_arrow,
                    size: 14,
                  )),
            )),
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
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  detailApi.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4, left: 30),
                child: Text(
                  "${detailApi.city}, ${detailApi.country}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFAFAFAF)),
                ),
              ),
              Container(
                height: 80,
                margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: detailApi.images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: index == 3 ? 0 : 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                                "$baseUrl${detailApi.images[index].imageUrl}",
                            width: 114,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => SkeletonAnimation(
                              shimmerColor: Colors.white54,
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 42),
                child: Text(
                  'Facility',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF253342),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: detailApi.features.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.only(
                              right: index == (detailApi.features.length - 1)
                                  ? 0
                                  : 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  child: CachedNetworkImage(
                                imageUrl:
                                    "$baseUrl${detailApi.features[index].imageUrl}",
                                width: 24,
                                height: 24,
                              )),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 3),
                                    child: Text(
                                        "${detailApi.features[index].qty}",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF152C5B),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Container(
                                    child: Text(
                                      detailApi.features[index].name,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFB0B0B0),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ));
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 42),
                child: Text(
                  'Treasure to choose',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF253342),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 110,
                margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: detailApi.activities.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.only(right: index == 3 ? 0 : 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "$baseUrl${detailApi.activities[index].imageUrl}",
                                  width: 114,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      SkeletonAnimation(
                                    shimmerColor: Colors.white54,
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Text(
                                    "${detailApi.activities[index].name}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF152C5B),
                                        fontWeight: FontWeight.w500)),
                              ),
                              Container(
                                child: Text(
                                  detailApi.activities[index].type,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFFB0B0B0),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ));
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 42),
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF253342),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  detailApi.description,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFB0B0B0),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 33, top: 24, right: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(),
                          child: Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFB0B0B0),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(),
                              child: Text(
                                "\$${detailApi.price}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF3252DF),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(),
                              child: Text(
                                "\/Night",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFFAFAFAF),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CheckoutPage(detailApi: detailApi)),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF3252DF)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 58, vertical: 16))),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
