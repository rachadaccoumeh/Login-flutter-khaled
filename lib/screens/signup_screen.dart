import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'google_signin.dart';
class SignupSccreen extends StatefulWidget {
  const SignupSccreen({Key? key}) : super(key: key);

  @override
  State<SignupSccreen> createState() => _SignupSccreenState();
}

class _SignupSccreenState extends State<SignupSccreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController =TextEditingController();
  Future signUp() async {
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
      );
      Navigator.of(context).pushNamed('/');
    }
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim()==_confirmpasswordController.text.trim()){
      return true ;
    }else{
      return false ;
    }
  }
  void openSigninScreen (){
    Navigator.of(context).pushReplacementNamed('/');//rout of page
  }

  void dispoe(){//if the Controller not use
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
  }
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Title"),
          content: const Text("you are boot"),
          actions:[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('ok'),)

          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/cat.jpg',
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text('SING UP'),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _emailController ,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email'
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password'
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password'
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                // child: MaterialButton(
                //    onPressed:(){
                //      print('why you dont work ');
                //       FirebaseAuth.instance.signInWithEmailAndPassword(
                //          email: _emailController.text.trim(), password:_passwordController.text.trim(),);
                //    },
                //    color:Colors.amber,
                //    child: Text('sign in'),
                //),
                child: GestureDetector(
                  onTap:signUp,
                  child: Container(
                    padding: const EdgeInsets.all(16) ,
                    decoration:  BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),),
                    child:const Center(child: Text('Sign up')) ,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    _showAlertDialog(context);
                  },
                  child: const Text("Show Alert Dialog"),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('You alrardy a member',
                    style: TextStyle(fontSize: 15),),
                  GestureDetector(
                    onTap:openSigninScreen ,
                    child: const Text('Sign in Now',
                      style: TextStyle(
                          fontSize: 15 ,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed:() async{
                  await signInWithGoogle();
                },
                child: const

                Text('Sign with gogole',
                  style: TextStyle(
                      fontSize: 15 ,
                      color: Colors.blue
                ),
             ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
//

