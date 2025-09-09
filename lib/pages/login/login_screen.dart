import 'package:cadastro_cliente/pages/navigation_menu.dart';
import 'package:flutter/material.dart';
import '../home/home_page.dart';

circleImage() {
  return Center(
    child: new Container(
      width: 80.0,
      height: 90.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/logo.png"),
        ),
      ),
    ),
  );
}

validarLogin(String user, String password) {
  if (user == 'admin' && password == 'admin') {
  } else {}
}

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(78, 73, 73, 73),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 116, 2, 0.902),
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  //////
                ],
              ),
              circleImage(),
              const SizedBox(height: 30),
              /*email*/ SizedBox(
                width: double.infinity,
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 214, 255, 202),
                      ),
                    ),

                    prefixIcon: const Icon(Icons.account_circle),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              /*password*/ SizedBox(
                width: double.infinity,
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 214, 255, 202),
                      ),
                    ),

                    suffixIcon: const Icon(Icons.remove_red_eye),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              /*login*/ Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 116, 2, 0.902),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 50,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigationMenu()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              const SizedBox(height: 10),
              const Opacity(opacity: 0.5),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
