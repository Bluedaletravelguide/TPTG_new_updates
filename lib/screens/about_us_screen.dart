import 'dart:ui';
import '../Data/SizeConfig.dart';
import '../Data/about_us.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about';
  final CarouselSliderController buttonCarouselController = CarouselSliderController();

  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

  TextSpan textSpan(BuildContext context, String text) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: primaryGreen,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  TextSpan textSpanNo(BuildContext context, String phoneno) {
    return TextSpan(
      text: phoneno,
      style: TextStyle(
        color: accentGreen,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          String phone = "tel:" + phoneno;
          if (await canLaunch(phone)) {
            await launch(phone);
          } else {
            throw 'Could not launch $phone';
          }
        },
    );
  }

  Widget clientButton(BuildContext context, String image, String clientUrl) {
    SizeConfig().init(context);

    return InkWell(
      splashColor: softGreen,
      onTap: () async {
        final url = clientUrl;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: lightGreen.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(color: softGreen, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: double.infinity,
            width: SizeConfig.blockSizeVertical * 23,
          ),
        ),
      ),
    );
  }

  Widget sectionHeader(BuildContext context, String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [lightGreen, accentGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: lightGreen.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget contentCard(BuildContext context, Widget child, {double? height}) {
    return Container(
      height: height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: softGreen.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: lightGreen.withOpacity(0.15),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget socialMedia(BuildContext context, String url, Icon icon, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: paleGreen,
        shape: BoxShape.circle,
        border: Border.all(color: softGreen, width: 2),
        boxShadow: [
          BoxShadow(
            color: lightGreen.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        icon: icon,
        iconSize: SizeConfig.blockSizeVertical * 3.5,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final carsoulData = ClientCarsoulData;
    final socialData = SocialMediaData;

    return PlatformScaffold(
      iosContentPadding: true,
      appBar: PlatformAppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        material: (_, __) => MaterialAppBarData(
          backgroundColor: primaryGreen,
          elevation: 0,
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(
          backgroundColor: primaryGreen,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [creamWhite, paleGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8),

                    // Our Story Section
                    sectionHeader(context, 'Our Story', Icons.auto_stories),
                    SizedBox(height: 16),

                    contentCard(
                      context,
                      SingleChildScrollView(
                        child: Text(
                          'Taiping The Guide is a free travel guidebook encompassing the town of Taiping. First published in 2017, we help travellers to navigate and make plans around Taiping city with ease. Taiping still upholds its sleepy town charm with its quaint colonial buildings still intact. Get directions to the places of your choice right here to make your travel plans as easy as 1, 2, 3...',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width > 500 ? 18 : 15,
                            color: primaryGreen,
                            height: 1.6,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      height: constraints.maxHeight * 0.28,
                    ),

                    SizedBox(height: 24),

                    // Find Us Section
                    sectionHeader(context, 'Find Us', Icons.location_on),
                    SizedBox(height: 16),

                    Material(
                      color: Colors.transparent,
                      child: contentCard(
                        context,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Address with location icon
                            Expanded(
                              flex: 4,
                              child: InkWell(
                                onTap: () async {
                                  const url = 'https://goo.gl/maps/TMu5YuBTU54epbmu6';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: paleGreen.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: softGreen.withOpacity(0.3)),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_city, color: accentGreen, size: 28),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'No.31-2, Block F2, Level 2, Jalan PJU 1/42a, Dataran Prima, 47301 Petaling Jaya, Selangor.',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width > 500 ? 16 : 14,
                                                color: primaryGreen,
                                                fontWeight: FontWeight.w500,
                                                height: 1.4,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Icon(Icons.access_time, color: accentGreen, size: 18),
                                                SizedBox(width: 6),
                                                Expanded(
                                                  child: Text(
                                                    'Monday-Friday: 9:00AM - 6:00PM',
                                                    style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.width > 500 ? 15 : 13,
                                                      color: lightGreen,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Divider(color: softGreen, thickness: 1, height: 24),

                            // Contact Numbers
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.phone_android, color: accentGreen, size: 20),
                                        SizedBox(width: 8),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.6),
                                            children: <TextSpan>[
                                              textSpan(context, 'Mobile: '),
                                              textSpanNo(context, '+60122200622'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.phone, color: accentGreen, size: 20),
                                        SizedBox(width: 8),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.6),
                                            children: <TextSpan>[
                                              textSpan(context, 'Tel: '),
                                              textSpanNo(context, '+60378869219'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Divider(color: softGreen, thickness: 1, height: 16),

                            // Social Media Icons
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 8,
                                  children: List.generate(
                                    socialData.length,
                                        (index) => socialMedia(
                                      context,
                                      socialData[index].url,
                                      socialData[index].icon,
                                      socialData[index].color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: constraints.maxHeight * 0.42,
                      ),
                    ),

                    SizedBox(height: 24),

                    // Partners Carousel
                    sectionHeader(context, 'Our Partners', Icons.handshake),
                    SizedBox(height: 16),

                    Material(
                      color: Colors.transparent,
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: softGreen.withOpacity(0.3), width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: lightGreen.withOpacity(0.15),
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider.builder(
                              carouselController: buttonCarouselController,
                              options: CarouselOptions(
                                height: 150,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.easeInOut,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                                viewportFraction: 0.7,
                              ),
                              itemCount: ClientCarsoulData.length,
                              itemBuilder: (context, index, realIdx) {
                                return clientButton(
                                  context,
                                  carsoulData[index].image,
                                  carsoulData[index].url,
                                );
                              },
                            ),
                            Positioned(
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: paleGreen.withOpacity(0.9),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () => buttonCarouselController.previousPage(),
                                  icon: Icon(Icons.arrow_back_ios_new, color: primaryGreen),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: paleGreen.withOpacity(0.9),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () => buttonCarouselController.nextPage(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.linear,
                                  ),
                                  icon: Icon(Icons.arrow_forward_ios, color: primaryGreen),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}