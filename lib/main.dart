import 'package:flutter/material.dart';
import 'package:ppt/provider/custom_provider.dart';

void main() {
  runApp(const MyApp());
}


class User {
  String name;
  String email;

  User({required this.name, required this.email});
}

class UserController extends ChangeNotifier {
  User? user;

  void signIn(String email, String name) {
    user = User(name: name, email: email);
    notifyListeners();
  }

  void signUp(String email, String name) {
    user = User(name: name, email: email);
    notifyListeners();
  }

  void signOut() {
    user = null;
    notifyListeners();
  }

  bool get isAuth => user != null;
}

class ThemeController extends ChangeNotifier {
  bool isLight = true;

  void changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotifierProvider<UserController>(
      value: UserController(),
      child: NotifierProvider<ThemeController>(
        value: ThemeController(),
        child: Builder(builder: (context) {
          return MaterialApp(
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: context.watch<ThemeController>().isLight ? ThemeMode.light : ThemeMode.dark,
            home: const SplashPage(),
          );
        }),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          },
          style: Theme.of(context).elevatedButtonTheme.style,
          child: const Text("Get Stated"),
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                  context.read<UserController>().signIn(emailController.text, nameController.text);
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: const Text("SignIn"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: const Text("Go SingUp"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NotifierProvider.of<UserController>(context)
                      .signUp(emailController.text, nameController.text);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: const Text("SignUp"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Consumer<ThemeController>(builder: (context, provider, _) {
            return IconButton(
              onPressed: () {
                provider.changeTheme();
              },
              icon: Icon(provider.isLight ? Icons.sunny : Icons.dark_mode),
            );
          })
        ],
      ),
      body: Center(
        child: Consumer<UserController>(
          builder: (context, controller, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.user?.name ?? "",
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 100),
                Text(controller.user?.email ?? "",
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    controller.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text("SingOut"),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
