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
  // Nature-inspired green color palette
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color accentGreen = Color(0xFF66BB6A);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color lightGreen = Color(0xFFA5D6A7);
  static const Color paleGreen = Color(0xFFE8F5E9);
  static const Color white = Colors.white;

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

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 3,
        behavior: SnackBarBehavior.floating,
        backgroundColor: primaryGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Row(
          children: [
            Icon(Icons.check_circle, color: white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Message sent successfully!',
                style: TextStyle(color: white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 3,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Row(
          children: [
            Icon(Icons.error_outline, color: white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                error.toString(),
                style: TextStyle(color: white),
              ),
            ),
          ],
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
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: paleGreen.withOpacity(0.3),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Header Section
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primaryGreen, darkGreen],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: primaryGreen.withOpacity(0.3),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.mail_outline_rounded,
                              color: white,
                              size: 40,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Get in Touch',
                            style: TextStyle(
                              color: white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'We\'d love to hear from you about Taiping',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: lightGreen,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),

                    // Form Container
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name Field
                          _buildFieldLabel('Your Name', Icons.person_outline),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _name,
                            style: TextStyle(
                              color: darkGreen,
                              fontSize: 16,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(phone);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            decoration: _buildInputDecoration('Enter your full name'),
                          ),
                          SizedBox(height: 20),

                          // Phone Field
                          _buildFieldLabel('Phone Number', Icons.phone_outlined),
                          SizedBox(height: 8),
                          TextFormField(
                            focusNode: phone,
                            controller: _phone,
                            style: TextStyle(
                              color: darkGreen,
                              fontSize: 16,
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(body);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                            decoration: _buildInputDecoration('e.g., +60 12-345 6789'),
                          ),
                          SizedBox(height: 20),

                          // Subject Dropdown
                          _buildFieldLabel('Subject', Icons.subject_outlined),
                          SizedBox(height: 8),
                          DropDownTextField(
                            controller: _subjectController,
                            clearOption: false,
                            textStyle: TextStyle(
                              color: darkGreen,
                              fontSize: 16,
                            ),
                            textFieldDecoration: InputDecoration(
                              hintText: 'Select a subject',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: paleGreen.withOpacity(0.3),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey[200]!,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: primaryGreen,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
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
                          SizedBox(height: 20),

                          // Message Field
                          _buildFieldLabel('Message', Icons.message_outlined),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _bodyController,
                            style: TextStyle(
                              color: darkGreen,
                              fontSize: 16,
                            ),
                            focusNode: body,
                            maxLines: 6,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Tell us what\'s on your mind...',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: paleGreen.withOpacity(0.3),
                              contentPadding: EdgeInsets.all(16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey[200]!,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: primaryGreen,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    // Submit Button
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primaryGreen, accentGreen],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: primaryGreen.withOpacity(0.4),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            send();
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.send_rounded,
                                  color: white,
                                  size: 20,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Send Message',
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    // Contact Info Card
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: lightGreen.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: primaryGreen,
                            size: 28,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Direct Email',
                            style: TextStyle(
                              color: darkGreen,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'enquiry@bluedale.com.my',
                            style: TextStyle(
                              color: primaryGreen,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: primaryGreen, size: 18),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: darkGreen,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontSize: 15,
      ),
      filled: true,
      fillColor: paleGreen.withOpacity(0.3),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: primaryGreen,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    );
  }
}