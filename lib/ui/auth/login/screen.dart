import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:signals/signals_flutter.dart';

import '../../provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late final username$ = createSignal<String?>(context, null);
  late final password$ = createSignal<String?>(context, null);
  late final hidePassword$ = createSignal(context, true);
  late final loading$ = createSignal(context, false);

  @override
  Widget build(BuildContext context) {
    // TODO: Dropdown with auth collection selection
    const authCollection = "users";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ListTile(
                title: TextFormField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  initialValue: username$(),
                  onChanged: username$.set,
                  autovalidateMode: AutovalidateMode.always,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
              ),
              ListTile(
                title: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffix: IconButton(
                      tooltip: 'Toggle visibility',
                      icon: Icon(hidePassword$()
                          ? Icons.visibility
                          : Icons.visibility),
                      onPressed: () {
                        hidePassword$.value = !hidePassword$();
                      },
                    ),
                  ),
                  obscureText: hidePassword$(),
                  initialValue: password$(),
                  onChanged: password$.set,
                  autovalidateMode: AutovalidateMode.always,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              if (loading$()) const LinearProgressIndicator(),
              ListTile(
                title: Builder(
                  builder: (context) {
                    return OutlinedButton(
                      onPressed: loading$.value
                          ? null
                          : () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                final messenger = ScaffoldMessenger.of(context);
                                final pb = Provider.of<PocketBase>(context)!;
                                try {
                                  loading$.value = true;
                                  final col = pb.collection(authCollection);
                                  await col.authWithPassword(
                                    username$()!,
                                    password$()!,
                                  );
                                } catch (e) {
                                  log('error login: $e');
                                  messenger.showSnackBar(SnackBar(
                                    content: Text('Error logging in: $e'),
                                  ));
                                } finally {
                                  loading$.value = false;
                                }
                              }
                            },
                      child: const Text('Submit'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
