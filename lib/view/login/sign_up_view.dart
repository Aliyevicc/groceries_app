import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool vision = false;
  bool checkBox = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
              child: Image.asset(
            "assets/images/red_carrot.png",
            height: 70,
            width: 60,
            fit: BoxFit.cover,
          )),
          const SizedBox(
            height: 80,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 290.0),
            child: Text(
              "Sign Up",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color(0xff181725),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 120.0),
            child: Text(
              "Enter your credentials to continue",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color(0xff7C7C7C),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 300.0),
            child: Text(
              "Username",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff7C7C7C),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter your name",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                hintStyle: TextStyle(
                  color: Color(0xff181725),
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 340.0),
            child: Text(
              "Email",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff7C7C7C),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter your email",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                hintStyle: TextStyle(
                  color: Color(0xff181725),
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 310.0),
            child: Text(
              "Password",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff7C7C7C),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              obscureText: vision,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Enter your password",
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      vision = !vision;
                      setState(() {});
                    },
                    icon: vision
                        ? const Icon(Icons.visibility_rounded,
                            color: Color(0xFFADADAD))
                        : const Icon(Icons.visibility_off_sharp,
                            color: Color(0xFFADADAD))),
                hintStyle: const TextStyle(
                  color: Color(0xff181725),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              const Text(
                "By continuing you agree to our ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                child: const Text(
                  "Terms of Service",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Color(0xff53B175),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 32,
              ),
              const Text(
                " and ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                  child: const Text(
                "Privacy Policy.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color(0xff53B175),
                ),
              )),
            ],
          ),
          const SizedBox(height: 25),
          MaterialButton(
            onPressed: () {},
            color: const Color(0xff53B175),
            minWidth: 370,
            height: 67,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 110,
              ),
              const Text(
                "Don’t have an account?",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff181725),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "  Log in",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff53B175),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
