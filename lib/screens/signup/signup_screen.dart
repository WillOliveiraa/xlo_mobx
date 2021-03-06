import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/common/error_box.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar')),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Acessar com e-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Observer(builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ErrorBox(message: signupStore.error),
                            );
                          }),
                          const FieldTitle(
                            title: 'Apelido',
                            subtitle: 'Como aparecer?? em seus an??ncios.',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !signupStore.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: Jo??o S.',
                                  errorText: signupStore.nameError),
                              onChanged: signupStore.setName,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'E-mail',
                            subtitle: 'Enviaremos um e-mail de confirma????o.',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !signupStore.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: joao@gmail.com',
                                  errorText: signupStore.emailError),
                              onChanged: signupStore.setEmail,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'Celuar',
                            subtitle: 'Proteja sua conta.',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !signupStore.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: (99) 99999-9999',
                                  errorText: signupStore.phoneError),
                              keyboardType: TextInputType.phone,
                              onChanged: signupStore.setPhone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()
                              ],
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'Senha',
                            subtitle:
                                'Use letras, n??meros e caracteres especiais.',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !signupStore.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: signupStore.pass1Error),
                              obscureText: true,
                              onChanged: signupStore.setPass1,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'Confirmar Senha',
                            subtitle: 'Repita a Senha',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !signupStore.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: signupStore.pass2Error),
                              obscureText: true,
                              onChanged: signupStore.setPass2,
                            );
                          }),
                          Observer(builder: (_) {
                            return Container(
                              height: 40,
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 12),
                              child: RaisedButton(
                                color: Colors.orange,
                                disabledColor: Colors.orange.withAlpha(120),
                                child: signupStore.loading
                                    ? SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.white)),
                                      )
                                    : Text('Cadastrar'),
                                textColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed:
                                    signupStore.signUpPressed as Function(),
                              ),
                            );
                          }),
                          const Divider(color: Colors.black26),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const Text('J?? tem uma conta? ',
                                    style: TextStyle(fontSize: 16)),
                                GestureDetector(
                                  onTap: Navigator.of(context).pop,
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.purple,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
