import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LogInPage();
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var backgrounds = [Colors.white, const Color(0x262626FF)];
  var input = [Colors.grey, Colors.white];
  var text = [Colors.black, Colors.white];
  int theme = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: backgrounds[theme],
            appBar: AppBar(
              leading: const BackButton(),
              title: const Center(child: Text("My App")),
              actions: const [Icon(Icons.more_vert)],
              bottom: const TabBar(
                tabs: [
                  Tab(child: Icon(Icons.login)),
                  Tab(child: Icon(Icons.app_registration),)
                ],
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      'assets/Flutter.svg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 350,
                        height: 65,
                        child: TextField(
                          style: TextStyle(color: text[theme]),
                          obscureText: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: input[theme], width: 2.5)
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: text[theme]),
                            prefixIcon: Icon(Icons.email, color: input[theme])
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350,
                        height: 65,
                        child: TextField(
                          style: TextStyle(color: text[theme]),
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: input[theme], width: 2.5)
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: text[theme]),
                            prefixIcon: Icon(Icons.key, color: input[theme])
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint("Logged in Successfully.");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF42A5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(100, 40)
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            color: text[theme]
                          )),
                      TextButton(
                          onPressed: () {debugPrint('Move to Sign Up page.');},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent
                            ),
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {setState(() {
                  theme = (theme+1)%2;
                });
              },
              child: Icon(Icons.nights_stay_rounded, color: text[1]),
            ),
          ),
        ),
      ),
    );
  }
}

