import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/cep_store.dart';
import 'package:xlo_mobx/stores/create_store.dart';

class CepField extends StatelessWidget {
  CepField(this.createStore) : cepStore = createStore.cepStore;

  final CepStore cepStore;
  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(builder: (_) {
          return TextFormField(
            initialValue: cepStore.cep,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter()
            ],
            onChanged: cepStore.setCep,
            decoration: InputDecoration(
                labelText: 'CEP *',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                errorText: createStore.addressError,
                contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10)),
          );
        }),
        Observer(builder: (_) {
          if (cepStore.address == null &&
              cepStore.error == null &&
              !cepStore.loading) {
            return Container();
          } else if (cepStore.address == null && cepStore.error == null) {
            return const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple),
                backgroundColor: Colors.transparent);
          } else if (cepStore.error != null) {
            return Container(
              color: Colors.red.withAlpha(100),
              height: 50,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                cepStore.error,
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
              ),
            );
          } else {
            final a = cepStore.address;

            return Container(
              color: Colors.purple.withAlpha(150),
              height: 50,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                'Localiza????o: ${a.district}, ${a.city.name} - ${a.uf.initials}',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
          }
        }),
      ],
    );
  }
}
