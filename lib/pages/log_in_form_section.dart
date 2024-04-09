import 'package:cvs_completer/providers/native_providers.dart';
import 'package:cvs_completer/providers/repository_sign_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogInFormSection extends StatefulHookConsumerWidget {
  const LogInFormSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      LogInFormSectionState();
}

class LogInFormSectionState extends ConsumerState<LogInFormSection> {
  @override
  Widget build(BuildContext context) {
    final proEmail =
        useTextEditingController(text: 'marcelo+dsadmin@dreamstock.co.jp');
    final proPassword = useTextEditingController(text: '12345678a');
    final baseEmail = useTextEditingController(text: '+5521967103488');
    final basePassword = useTextEditingController(text: 'Teste@123');

    return Center(
      child: Builder(builder: (context) {
        final isLoading = ref.watch(logInProLoadingProvider) ||
            ref.watch(logInBaseLoadingProvider);
        if (isLoading) {
          return const Center(
            child: Text('Loading...'),
          );
        }
        final error = ref.watch(logInProErrorProvider) ??
            ref.watch(logInBaseErrorProvider);
        if (error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 55),
                const SizedBox(height: 16),
                Text('Error: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(logInProDataProvider.notifier).state = null;
                    ref.read(logInBaseDataProvider.notifier).state = null;

                    ref.read(logInProErrorProvider.notifier).state = null;
                    ref.read(logInBaseErrorProvider.notifier).state = null;

                    ref.read(logInProLoadingProvider.notifier).state = false;
                    ref.read(logInBaseLoadingProvider.notifier).state = false;
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 220,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ref.watch(logInProDataProvider) != null
                  ? Center(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Text(
                              ref.read(logInProDataProvider).toString(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              child: IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: ref
                                          .read(logInProDataProvider)
                                          .toString(),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.copy),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        TextField(
                          controller: proEmail,
                          decoration: const InputDecoration(
                            labelText: 'Pro email',
                          ),
                        ),
                        TextField(
                          controller: proPassword,
                          decoration: const InputDecoration(
                            labelText: 'Pro password',
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            ref.read(logInProLoadingProvider.notifier).state =
                                true;
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await ref.read(proSignInRepositoryProvider).begin(
                                  username: proEmail.text,
                                  password: proPassword.text,
                                  ref: ref,
                                );
                            ref.read(logInProLoadingProvider.notifier).state =
                                false;
                          },
                          child: const Text('Log In with PRO'),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 400,
              height: 220,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ref.watch(logInBaseDataProvider) != null
                  ? Center(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Text(
                              ref.read(logInBaseDataProvider).toString(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              child: IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: ref
                                          .read(logInBaseDataProvider)
                                          .toString(),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.copy),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        TextField(
                          controller: baseEmail,
                          decoration: const InputDecoration(
                            labelText: 'Base number',
                          ),
                        ),
                        TextField(
                          controller: basePassword,
                          decoration: const InputDecoration(
                            labelText: 'Base password',
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            ref.read(logInBaseLoadingProvider.notifier).state =
                                true;
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await ref.read(baseSignInRepositoryProvider).signIn(
                                  username: baseEmail.text,
                                  password: basePassword.text,
                                  ref: ref,
                                );
                            ref.read(logInBaseLoadingProvider.notifier).state =
                                false;
                          },
                          child: const Text('Log in with BASE'),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
            ),
          ],
        );
      }),
    );
  }
}
