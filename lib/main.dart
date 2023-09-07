// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:hng_mobile_task_1/webview_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'HNG PERSONAL DETAILS',
//             style: TextStyle(
//                  fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const CircleAvatar(
//                 backgroundImage:
//                     AssetImage('assets/image_assets/profile_image.jpg'),
//                 radius: 100.0,
//               ),
//               const SizedBox(height: 20.0),
//               const Text(
//                 'ADEBAYO',
//                 style: TextStyle(
//                     fontSize: 24.0,
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const WebViewPage()),
//                   );
//                 },
//                 child: const Text('Open GitHub'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.green), // Plant shade of green
      ),
      home: SplashScreen(), // Set the initial route to the SplashScreen
      routes: {
        '/home': (context) => HomeScreen(), // Define the HomeScreen route
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any necessary initialization code here
    // Example: You can add a delay before navigating to the HomeScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green, // Green background
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: 1.0, // Fully opaque
          child: Text(
            'ADEBAYO',
            style: TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text color
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text(
          'HNG PERSONAL DETAILS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text color
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/image_assets/profile_image.jpg'),
              radius: 120.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'ADEBAYO',
              style: TextStyle(
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.green, // White text color
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebViewPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set the background color to green
              ),
              child: const Text('Open GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}
