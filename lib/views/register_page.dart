// import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  final String routeNameNext;
  const RegisterPage(this.routeNameNext, {Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  // final User account = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   padding: const EdgeInsets.all(20),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'Enregistrement',
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 40,
      //         ),
      //       ),
      //       const SizedBox(height: 30),
      //       Form(
      //         key: _formKey,
      //         child: Column(
      //           children: [
      //             Row(
      //               children: [
      //                 Expanded(
      //                   child: TextFormField(
      //                     validator: (value) {
      //                       if (value == null || value.isEmpty) {
      //                         return 'Entrez votre prénom';
      //                       }
      //                       return null;
      //                     },
      //                     maxLines: 1,
      //                     decoration: InputDecoration(
      //                       hintText: 'Prénom',
      //                       prefixIcon: const Icon(Icons.person),
      //                       border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                     ),
      //                     onSaved: (value) =>
      //                         setState(() => account.prenom = value!),
      //                   ),
      //                 ),
      //                 const SizedBox(width: 12.0),
      //                 Expanded(
      //                   child: TextFormField(
      //                     validator: (value) {
      //                       if (value == null || value.isEmpty) {
      //                         return 'Entrez votre nom';
      //                       }
      //                       return null;
      //                     },
      //                     maxLines: 1,
      //                     decoration: InputDecoration(
      //                       hintText: 'Nom',
      //                       prefixIcon: const Icon(Icons.person),
      //                       border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                     ),
      //                     onSaved: (value) =>
      //                         setState(() => account.nom = value!),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             const SizedBox(height: 12.0),
      //             TextFormField(
      //               validator: (value) => EmailValidator.validate(value!)
      //                   ? null
      //                   : "Entrez un email valide",
      //               maxLines: 1,
      //               decoration: InputDecoration(
      //                 hintText: 'Email',
      //                 prefixIcon: const Icon(Icons.email),
      //                 border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //               ),
      //               onSaved: (value) => setState(() => account.email = value!),
      //             ),
      //             const SizedBox(height: 12.0),
      //             TextFormField(
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Entrez un mot de passe';
      //                 }
      //                 return null;
      //               },
      //               maxLines: 1,
      //               obscureText: true,
      //               decoration: InputDecoration(
      //                 prefixIcon: const Icon(Icons.lock),
      //                 hintText: 'Mot de passe',
      //                 border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //               ),
      //               onSaved: (value) =>
      //                   setState(() => account.password = value!),
      //             ),
      //             CheckboxListTile(
      //               title: const Text("Se souvenir de moi"),
      //               contentPadding: EdgeInsets.zero,
      //               value: rememberValue,
      //               activeColor: Theme.of(context).colorScheme.primary,
      //               onChanged: (newValue) {
      //                 setState(() {
      //                   rememberValue = newValue!;
      //                 });
      //               },
      //               controlAffinity: ListTileControlAffinity.leading,
      //             ),
      //             const SizedBox(height: 12.0),
      //             ElevatedButton(
      //               onPressed: () {
      //                 if (_formKey.currentState!.validate()) {
      //                   _formKey.currentState!.save();
      //                   _registerUser(context);
      //                 }
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
      //               ),
      //               child: const Text(
      //                 'Enregister',
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 const Text('Déjà un compte ?'),
      //                 TextButton(
      //                   onPressed: () {
      //                     Navigator.pushReplacement(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) =>
      //                             LoginPage(widget.routeNameNext),
      //                       ),
      //                     );
      //                   },
      //                   child: const Text('Enregistrement'),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  void _registerUser(BuildContext context) {
    // TODO : faire l'enregistrement Utilisateur;
    // account
    // print('_registerUser: $account');
    Navigator.popAndPushNamed(context, widget.routeNameNext);
  }
}
