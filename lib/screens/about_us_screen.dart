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
  // final CarouselController buttonCarouselController = CarouselController();
  final CarouselSliderController buttonCarouselController = CarouselSliderController();

  TextSpan textSpan(BuildContext context, String text) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  TextSpan textSpanNo(BuildContext context, String phoneno) {
    return TextSpan(
      text: phoneno,
      style: TextStyle(
        color: Colors.blue,
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
      splashColor: Colors.blueGrey[600],
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
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(image,
              fit: BoxFit.fill,
              height: double.infinity,
              width: SizeConfig.blockSizeVertical * 23)),
    );
  }

  Widget contentText(BuildContext context, String text, TextStyle style) {
    return Container(
      alignment: Alignment.center,
      child: Text(text, style: style, textAlign: TextAlign.justify),
    );
  }

  Widget textBorder(BuildContext context, Widget child) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }

  Widget socialMedia(BuildContext context, String url, Icon icon, Color color) {
    return IconButton(
      onPressed: () async {
        url = url;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      icon: icon,
      iconSize: SizeConfig.blockSizeVertical * 4,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final carsoulData = ClientCarsoulData;
    final socialData = SocialMediaData;
    return PlatformScaffold(
        iosContentPadding: true,
        appBar: PlatformAppBar(
          title: Text('About Us'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/aboutUs.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop)),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: constraints.maxHeight * 0.06,
                            child: contentText(
                              context,
                              'Our Story',
                              Theme.of(context).textTheme.displayLarge!,
                            )),
                        Container(
                            height: constraints.maxHeight * 0.34,
                            child: SingleChildScrollView(
                              child: textBorder(
                                  context,
                                  contentText(
                                    context,
                                    'Taiping The Guide is a free travel guidebook encompassing the town of Taiping. First published in 2017, we help travellers to navigate and make plans around Taiping city with ease. Taiping still upholds its sleepy town charm with its quaint colonial buildings still intact. Get directions to the places of your choice right here to make your travel plans as easy as 1, 2, 3...',
                                    MediaQuery.of(context).size.width > 500
                                        ? Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium!,
                                  )),
                            )),
                        Container(
                            height: constraints.maxHeight * 0.06,
                            child: contentText(
                              context,
                              'Find Us',
                              Theme.of(context).textTheme.displayLarge!,
                            )),
                        Material(
                          color: Colors.transparent,
                          child: Container(
                            height: constraints.maxHeight * 0.34,
                            child: textBorder(
                              context,
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: constraints.maxHeight * 0.4,
                                          child: InkWell(
                                              onTap: () async {
                                                const url =
                                                    'https://goo.gl/maps/TMu5YuBTU54epbmu6';
                                                if (await canLaunch(url)) {
                                                  await launch(url);
                                                } else {
                                                  throw 'Could not launch $url';
                                                }
                                              },
                                              child: contentText(
                                                context,
                                                'No.31-2, Block F2, Level 2, Jalan PJU 1/42a, Dataran Prima, 47301 Petaling Jaya, Selangor. \nOpening Hours: Monday-Friday: 9:00AM - 6:00PM',
                                                MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        500
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium!
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!,
                                              )),
                                        ),
                                        //Divider(),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            height: constraints.maxHeight * 0.3,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                              text: TextSpan(
                                                style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        3.4),
                                                children: <TextSpan>[
                                                  textSpan(context, '\n'),
                                                  textSpan(
                                                      context, 'Mobile no:'),
                                                  textSpanNo(
                                                      context, '+60122200622'),
                                                  textSpan(
                                                      context, '\nTel No: '),
                                                  textSpanNo(
                                                      context, '+60378869219'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          child: Container(
                                            height: constraints.maxHeight * 0.1,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: socialData.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return socialMedia(
                                                    context,
                                                    socialData[index].url,
                                                    socialData[index].icon,
                                                    socialData[index].color,
                                                  );
                                                }),
                                          ),
                                        ),
                                      ]);
                                },
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Container(
                            height: constraints.maxHeight * 0.2,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              CarouselSlider.builder(
                                  carouselController: buttonCarouselController,
                                  options: CarouselOptions(
                                    height: 150,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    aspectRatio: 16 / 9,
                                    autoPlayCurve: Curves.linearToEaseOut,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 1000),
                                    viewportFraction: 0.8,
                                  ),
                                  itemCount: ClientCarsoulData.length,
                                  itemBuilder: (context, index, realIdx) {
                                    return clientButton(
                                      context,
                                      carsoulData[index].image,
                                      carsoulData[index].url,
                                    );
                                  }),
                              Positioned(
                                left: 0,
                                height: 150,
                                child: IconButton(
                                  onPressed: () =>
                                  //     buttonCarouselController.previousPage(
                                  //         duration: Duration(milliseconds: 100),
                                  //         curve: Curves.linear),
                                  buttonCarouselController.previousPage(),
                                  icon: Icon(Icons.arrow_back_ios),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                height: 150,
                                child: IconButton(
                                  onPressed: () =>
                                      buttonCarouselController.nextPage(
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.linear),
                                  icon: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ]);
                },
              )),
        ));
  }
}
