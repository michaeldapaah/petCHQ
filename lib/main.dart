import 'package:agora_uikit/agora_uikit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petchqapp/constants.dart';

import 'screens/home/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetschqApp',
     
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      home: SignInScreen(),
      
    );
    
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AgoraClient client = AgoraClient(agoraConnectionData: AgoraConnectionData(appId: "94d28a185917451fa684759d547d698a", channelName: "test"), enabledPermission: [Permission.camera, Permission.microphone ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack (
        children: [
        AgoraVideoViewer(
        client: client,
        ),
        AgoraVideoButtons(
          client: client)
    ])
    );
  }
}