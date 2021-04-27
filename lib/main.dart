import 'package:flutter/material.dart';

// Images
const userImage = 'https://i.ibb.co/GF18dgS/jamiu.jpg';

// Colors
const accentColor = Colors.redAccent;
const onAccentColor = Colors.white;

// Styles
const tinyHeight = SizedBox(height: 4);
const smallHeight = SizedBox(height: 8);
const mediumHeight = SizedBox(height: 16);
const tinyWidth = SizedBox(width: 4);
const smallWidth = SizedBox(width: 8);
const mediumWidth = SizedBox(width: 16);

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w900,
);

const titleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const subtitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w300,
);

const bodyText1Style = TextStyle(
  fontSize: 16,
);

const bodyText2Style = TextStyle(
  fontSize: 14,
  height: 1.3,
  fontWeight: FontWeight.w300,
);

// Utilities
void showSnackbar(BuildContext context, {String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 10),
    ),
  );
}

// Models
@immutable
class SocialDetails {
  final String title;
  final String value;
  final String url;

  const SocialDetails({this.title, this.value, this.url});
}

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: PortfolioView(),
    );
  }
}

class PortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UserSnapshot(),
                mediumHeight,
                AboutUser(),
                mediumHeight,
                UserSocialDetails(),
                mediumHeight,
                UserSkills(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: Colors.redAccent,
            onPressed: () => showSnackbar(
              context,
              text: 'Call: +2348108627764',
            ),
            child: Icon(Icons.phone, color: onAccentColor),
          ),
          FloatingActionButton(
            mini: true,
            backgroundColor: Colors.redAccent,
            onPressed: () => showSnackbar(
              context,
              text: 'Send an email to developerjamiu@gmail.com',
            ),
            child: Icon(Icons.mail, color: onAccentColor),
          ),
        ],
      ),
    );
  }
}

class UserSnapshot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                userImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        mediumWidth,
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jamiu Okanlawon', style: headingStyle),
              tinyHeight,
              Text('Mobile Developer', style: subtitleStyle),
              tinyHeight,
              Text(
                '57, Marina Street, Lagos Island, Lagos',
                style: bodyText2Style,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AboutUser extends StatelessWidget {
  const AboutUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About', style: titleStyle),
        tinyHeight,
        Text(
          'Jamiu Okanlawon is a Software Engineer with a Mobile Development background. He like learning new things and also sharing his knowledge with others. He is currently exploring how to manage teams.',
          style: bodyText2Style,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class UserSocialDetails extends StatelessWidget {
  final userDetails = <SocialDetails>[
    SocialDetails(
      title: 'Github',
      value: '@developerjamiu',
      url: 'https://www.github.com/developerjamiu',
    ),
    SocialDetails(
      title: 'Twitter',
      value: '@developerjamiu',
      url: 'https://www.twitter.com/developerjamiu',
    ),
    SocialDetails(
      title: 'Instagram',
      value: '@developerjamiu',
      url: 'https://www.instagram.com/developerjamiu',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Social', style: titleStyle),
        tinyHeight,
        ...userDetails
            .map(
              (userDetail) => Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                elevation: 5,
                child: ListTile(
                  onTap: () => showSnackbar(
                    context,
                    text: 'Visit ${userDetail.url}',
                  ),
                  title: Text(userDetail.title, style: titleStyle),
                  subtitle: Text(userDetail.value, style: bodyText1Style),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}

class UserSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills', style: titleStyle),
        smallHeight,
        Row(
          children: [
            FlutterLogo(),
            tinyWidth,
            Text('Flutter', style: bodyText2Style),
            mediumWidth,
            Icon(Icons.android, color: Colors.greenAccent),
            tinyWidth,
            Text('Android', style: bodyText2Style),
            mediumWidth,
            Icon(Icons.cloud, color: Colors.amberAccent),
            tinyWidth,
            Text('Firebase', style: bodyText2Style),
          ],
        ),
      ],
    );
  }
}
