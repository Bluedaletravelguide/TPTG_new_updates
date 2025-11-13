import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Data/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class Transportation extends StatelessWidget {
  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

  final String id;
  final String title;
  final String description;
  final String tel;
  final String image;

  const Transportation(
      this.id, this.title, this.description, this.tel, this.image);

  Object textSpan(BuildContext context, String text) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: primaryGreen,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Object textSpanNo(BuildContext context, String phoneno) {
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: softGreen.withOpacity(0.4),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: lightGreen.withOpacity(0.15),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section with decorative border
              Container(
                width: SizeConfig.blockSizeHorizontal * 28,
                height: SizeConfig.blockSizeVertical * 18,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        image,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Subtle gradient overlay
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        width: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0),
                                Colors.white.withOpacity(0.3),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title with icon
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [accentGreen, softGreen],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.directions_bus,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              title,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: primaryGreen,
                                fontSize: SizeConfig.safeBlockHorizontal * 4.2,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      // Description
                      Container(
                        child: Text(
                          description,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                          style: TextStyle(
                            color: primaryGreen.withOpacity(0.8),
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                            height: 1.4,
                          ),
                        ),
                      ),

                      // Phone number section
                      if (tel != '-') ...[
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: paleGreen.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: softGreen.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 16,
                                color: accentGreen,
                              ),
                              SizedBox(width: 6),
                              Flexible(
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: SizeConfig.safeBlockHorizontal * 3.2,
                                    ),
                                    children: <TextSpan>[
                                      textSpan(context, 'Helpline: ') as TextSpan,
                                      textSpanNo(context, tel) as TextSpan,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}