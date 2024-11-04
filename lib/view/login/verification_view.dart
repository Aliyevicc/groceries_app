import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../common/style/color_extensions/color_extensions.dart';
import '../../common/widgets/customKeyBoard.dart';


class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  TextEditingController pinC = TextEditingController();

  get user => null;
  Future<void> login(BuildContext context, String controllerE, String controllerP) async {
    String email = controllerE;
    String pass = controllerP;

    if (email.isEmpty || email.length < 3 || !email.contains("@")) {
     // Utils.fireSnackBar("Email is badly formatted", context);
    } else if (pass.isEmpty || pass.length < 5) {
    //  Utils.fireSnackBar("Password should be more than 6 char", context);
    } else {
    //  User? user = await AuthService.loginUser(context, email: email, password: pass);
      if (user != null) {
     //   Utils.fireSnackBar("Successfully registered", context);
       // context.go(AppRouteName.home);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    pinC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 70,
      margin: const EdgeInsets.only(left: 6, right: 6),
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: TColor.backgroundColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(      color: TColor.placeholder,
            width: 1),
      ),
    );

   // final state = GoRouter.of(context).routerDelegate.currentConfiguration!;
   // final myData = state.extra as UserModel;
    return Scaffold(
      backgroundColor: TColor.backgroundColor.withOpacity(0.9),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const Spacer(),
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
              Text("Please,Enter your 4-digit code",
              style: TextStyle(
                color: TColor.primaryText,
                fontSize: 23,
                fontWeight: FontWeight.w500
              ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Pinput(
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      controller: pinC,
                      keyboardType: TextInputType.number,
                      onCompleted: (pin){
                       // login(context, myData.email.toString(), myData.password.toString());
                      },
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: Colors.green),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Row(
                  children: [
                    Text(
                      "Send again after",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: TColor.textTitle,
                      ),
                    ),
                    Text(
                      " ( 59 seconds )",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: TColor.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 272,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "1");
                            }
                          },
                          text: "1",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "2");
                            }
                          },
                          text: "2",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "3");
                            }
                          },
                          text: "3",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "4");
                            }
                          },
                          text: "4",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "5");
                            }
                          },
                          text: "5",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "6");
                            }
                          },
                          text: "6",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "7");
                            }
                          },
                          text: "7",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "8");
                            }
                          },
                          text: "8",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "9");
                            }
                          },
                          text: "9",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomKeyboardButton(
                          onPressed: () {
                            pinC.clear();
                           // context.pop();
                          },
                          icon: Icons.arrow_back_rounded,
                          iconSize: 24,
                          iconColor:  TColor.darkGrey,

                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if (pinC.text.length < 4) {
                              setState(() => pinC.text += "0");
                            }
                          },
                          text: "0",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            pinC.text =
                                pinC.text.substring(0, pinC.text.length - 1);
                          },
                          icon: Icons.backspace_outlined,
                          iconSize: 24,
                          iconColor: TColor.darkGrey
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
