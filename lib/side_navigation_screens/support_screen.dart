import 'package:flutter/material.dart';
import 'package:ludo/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Text("Contact with admin",style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(height: 20,),
        GestureDetector(
          onTap: (){
            _makePhoneCall("03224022942");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.call,color: appLightBlueColor,),
              const SizedBox(width: 10,),
              Text("+92XXXXXXXXXX",style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
        ),const SizedBox(height: 10,),GestureDetector(
          onTap: (){
            _sendMail();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mail,color: appLightBlueColor,),
              const SizedBox(width: 10,),
              Text("xyz@gmail.com",style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
        ),
      ],
    );
  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  _sendMail() async {
    // Android and iOS
    const uri =
        'mailto:test@example.org?subject=Greetings&body=Hello%20World';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
