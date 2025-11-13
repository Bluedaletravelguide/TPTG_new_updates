import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/contact';
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  List<String> attachments = [];
  bool isHTML = false;
  final body = FocusNode();
  final phone = FocusNode();

  final _recipientController = TextEditingController(
    text: 'enquiry@bluedale.com.my',
  );

  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _bodyController = TextEditingController();
  SingleValueDropDownController _subjectController =
      SingleValueDropDownController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final form = GlobalKey<FormState>();
  Future<void> send() async {
    final validate = form.currentState?.validate();
    if (!validate!) {
      return;
    }

    final Email email = Email(
        body: 'Name: ' +
            _name.text +
            '\n' +
            'Contact: ' +
            _phone.text +
            '\n' +
            'Message: ' +
            _bodyController.text,
        subject: _subjectController.dropDownValue?.value ?? '',
        recipients: [_recipientController.text]);

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 1000,
        behavior: SnackBarBehavior.floating,
        content: Text(
          error.toString(),
          textAlign: TextAlign.center,
        ),
      ));
    }
    _name.clear();
    _phone.clear();
    _bodyController.clear();
    setState(() {
      _subjectController = SingleValueDropDownController();
    });

    if (!mounted) return;
  }

  @override
  void dispose() {
    body.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: form,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: constraints.maxHeight * 0.15,
                          child: TextFormField(
                            controller: _name,
                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(phone);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Valid Name!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.black), // optional
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // 👈 when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 2.0), // 👈 when focused
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: constraints.maxHeight * 0.15,
                          child: TextFormField(
                            focusNode: phone,
                            controller: _phone,
                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(body);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Valid Phone Number!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              labelStyle: TextStyle(color: Colors.black), // optional
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // 👈 when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 2.0), // 👈 when focused
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: constraints.maxHeight * 0.30,
                          child: DropDownTextField(
                            controller: _subjectController,
                            clearOption: false,
                            textStyle: TextStyle(color: Colors.black),
                            textFieldDecoration: InputDecoration(
                              labelText: 'Subject',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // 👈 when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 2.0), // 👈 when focused
                              ),
                            ),
                            dropDownList: const [
                              DropDownValueModel(
                                  name: 'Feedback', value: 'Feedback'),
                              DropDownValueModel(
                                  name: 'Business Collaboration',
                                  value: 'Business Collaboration'),
                              DropDownValueModel(
                                  name: 'Survey', value: 'Survey'),
                            ],
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a subject';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.20,
                          child: TextFormField(
                            controller: _bodyController,
                            style: TextStyle(color: Colors.black),
                            focusNode: body,
                            maxLines: 8,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Valid Message!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Message',
                              labelStyle: TextStyle(color: Colors.black), // optional
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // 👈 when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange, width: 2.0), // 👈 when focused
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 4,
                          ),
                          child: PlatformElevatedButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              send();
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 143, 0, 1),
                                    Color.fromRGBO(255, 143, 0, 0.5),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              alignment: Alignment.center,
                              child: Text(
                                'Submit',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                      ]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
