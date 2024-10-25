import 'package:flutter/material.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
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
            padding: EdgeInsets.only(right: 310.0),
            child: Text(
              "Loging",
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
            padding: EdgeInsets.only(right: 140.0),
            child: Text(
              "Enter your emails and password",
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
              obscureText: vision,
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter your email",
                focusedBorder:  UnderlineInputBorder(
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
          Padding(
            padding: const EdgeInsets.only(left: 280.0),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Color(0xff181725),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
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
              "Log In",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
              ),
              Text(
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
                  "  Sign up",
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

