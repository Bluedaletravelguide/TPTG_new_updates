import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../Data/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Data/ebook-data.dart';

class FirstPage extends StatefulWidget {
  static const routeName = '/ebooks';

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int bookIndex = 39;
  late String edition;

  String bookEdition() {
    setState(() {
      bookIndex--;
    });
    if (bookIndex < 2 && bookIndex > 0) {
      return edition = bookIndex.toString();
    }
    return (bookIndex = 1).toString();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('E-book'),
      ),
      body: SafeArea(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Text(
                  'Taiping the Guide Editions',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: EbookData.map(
                          (con) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          splashColor: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                          onTap: () => _launchURL(con.bookPdf),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 10,
                                shadowColor: Colors.black,
                                borderRadius: BorderRadius.circular(9),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Container(
                                    height: SizeConfig.blockSizeVertical * 30,
                                    child: Image.asset(
                                      con.bookcover,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: SizeConfig.blockSizeVertical * 9,
                                width: SizeConfig.blockSizeHorizontal * 6,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff103783),
                                        Color(0xff9bafd9),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Text(
                                        bookEdition(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
