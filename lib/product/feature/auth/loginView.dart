import 'package:flutter/material.dart';


/*

class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  State<loginView> createState() => _LoginPageState();
}

class _LoginPageState extends State<loginView> {
  //
  final _loginFormKey = GlobalKey<FormState>();

  late String username;
  late String code;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton( backgroundColor: Colors.black,mini: true,onPressed:() {
          Navigator.pop(context);

        },
          child : Icon(Icons.arrow_back),
        ),
        backgroundColor:Color(0xffe71d73),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50),),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        const PageHeading(title: 'Giriş Yapın',),
                        CustomInputField(
                            labelText: 'Kullanıcı Adı',
                            hintText: 'Kullanıcı Adı Giriniz',
                            onSaved: (textValue){

                              username = textValue!;
                            },
                            validator: (textValue) {


                              if(textValue!.isEmpty){
                                return 'This part can not be null';
                              }


                              return null;
                            }


                        ),
                        const SizedBox(height: 16,),
                        CustomInputField(
                          labelText: 'Şifre',
                          hintText: 'Şifre Giriniz',
                          obscureText: true,
                          suffixIcon: true,
                          onSaved: (textValue){

                            code = textValue!;
                          },
                          validator: (textValue) {

                            if(textValue!.isEmpty){
                              return 'This part can not be null';
                            }


                            return null;
                          },
                        ),
                        const SizedBox(height: 16,),

                        CustomFormButton(innerText: 'Giriş Yap', onPressed: _handleLoginUser,),

                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}


class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  //
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.labelText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          TextFormField(
            autocorrect: false,
            obscureText: (widget.obscureText && _obscureText),
            decoration: InputDecoration(
              isDense: (widget.isDense != null) ? widget.isDense : false,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.remove_red_eye : Icons.visibility_off_outlined,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ): null,
              suffixIconConstraints: (widget.isDense != null) ? const BoxConstraints(
                  maxHeight: 33
              ): null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            onSaved: widget.onSaved,
          ),
        ],
      ),
    );
  }
}



class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  const CustomFormButton({Key? key, required this.innerText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color:Color(0xfffeda46),
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(innerText, style: const TextStyle(color:Colors.black, fontSize: 20,fontWeight: FontWeight.normal),),
      ),
    );
  }
}

class PageHeading extends StatelessWidget {
  final String title;
  const PageHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}



 */