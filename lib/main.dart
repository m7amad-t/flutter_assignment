import 'package:flutter/material.dart';
import 'package:lab/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        scaffoldBackgroundColor: Colors.purple[50],
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),

        

        filledButtonTheme: const FilledButtonThemeData(
          
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(

             ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
             )
            ),       
            backgroundColor: WidgetStatePropertyAll(
              Colors.deepPurple,
            ),
            
          ),
        ),

        

        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true ,

    
          // outlineBorder: BorderSide( color : Colors.red),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),


          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            
            borderSide: const BorderSide(color: Colors.red, ), 
          ),
          labelStyle: const  TextStyle(
            color : Colors.grey, 
            

          )
        )
      ),
      home: const LoginPage(),
    );
  }
}
