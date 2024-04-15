import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:cvs_completer/pages/main_widget.dart';
import 'package:cvs_completer/providers/native_providers.dart';
import 'package:cvs_completer/providers/two_cvs_data_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseTwoFileCard extends ConsumerStatefulWidget {
  const ChooseTwoFileCard({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChooseTwoFileCardState();
}

class _ChooseTwoFileCardState extends ConsumerState<ChooseTwoFileCard> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(twoCvsDataProvider);
    final has1 = state?.file1 != null;
    final has2 = state?.file2 != null;

    return Center(
      child: SizedBox(
        width: 420,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Opacity(
                    opacity: !has1 ? 1 : 0.5,
                    child: FilledButton.icon(
                      icon: const Icon(Icons.file_copy_sharp),
                      label: Text(has1 ? 'Change CVS 1' : 'Choose CVS 1'),
                      onPressed: () async {
                        try {
                          final picked = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            // allowedExtensions: ['.cvs'],
                          );
                          if (picked?.files.isNotEmpty != true) {
                            showNoFilePickerError(context);
                            return;
                          }
                          if (!picked!.files.first.name.endsWith('csv')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('File must be csv'),
                              ),
                            );
                            return;
                          }
                          const cvsConverter = CsvToListConverter();
                          // Get csv

                          // final reader = webFile.FileReader();
                          final text =
                              await picked.files.first.xFile.readAsString();

                          final csvBundle = [
                            ...cvsConverter.convert(
                              text,
                            )
                          ];

                          ref.read(twoCvsDataProvider.notifier).state =
                              TwoCvsData(
                            file1: csvBundle,
                            file2: state?.file2,
                          );
                        } catch (e) {
                          showErrorWithFile(context, e);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Opacity(
                    opacity: !has2 ? 1 : 0.5,
                    child: FilledButton.icon(
                      icon: const Icon(Icons.file_copy_sharp),
                      label: Text(has2 ? 'Change CVS 2' : 'Choose CVS 2'),
                      onPressed: () async {
                        try {
                          final picked = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            // allowedExtensions: ['.cvs'],
                          );
                          if (picked?.files.isNotEmpty != true) {
                            showNoFilePickerError(context);
                            return;
                          }

                          if (!picked!.files.first.name.endsWith('csv')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('File must be csv'),
                              ),
                            );
                            return;
                          }
                          const cvsConverter = CsvToListConverter();
                          // Get csv

                          // final reader = webFile.FileReader();
                          final text =
                              await picked.files.first.xFile.readAsString();

                          final csvBundle = [
                            ...cvsConverter.convert(
                              text,
                            )
                          ];

                          ref.read(twoCvsDataProvider.notifier).state =
                              TwoCvsData(
                            file1: state?.file1,
                            file2: csvBundle,
                          );
                        } catch (e) {
                          showErrorWithFile(context, e);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (has1 && has2) ...{
              const SizedBox(height: 16),
              FilledButton.icon(
                icon: const Icon(Icons.file_copy_sharp),
                label: const Text('Join CVS\'s'),
                onPressed: () async {
                  try {
                    final state = ref.read(twoCvsDataProvider.notifier).state;
                    if (state == null) return;
                    final file1 = state.file1;
                    final file2 = state.file2;
                    if (file1 == null || file2 == null) return;
                    if (file1.isEmpty || file2.isEmpty) return;
                    final initialLine = [
                      ...?(file1.firstWhereOrNull((element) =>
                              element.first.toString().trim() == 'ID') ??
                          file2.firstWhereOrNull((element) =>
                              element.first.toString().trim() == 'ID')),
                    ];
                    if (initialLine.isEmpty) {
                      throw 'No ID column found';
                    }

                    if (file1.first.first.toString().trim() == 'ID') {
                      file1.removeAt(0);
                    }
                    if (file2.first.first.toString().trim() == 'ID') {
                      file2.removeAt(0);
                    }

                    final isPro = ref.read(isProSelected);

                    if (isPro) {
                      initialLine.add('CURRENT TEAM ICON');
                      initialLine.add('CURRENT TEAM NAME');
                      initialLine.add('CURRENT TEAM COUNTRY CODE');
                      initialLine.add('CURRENT TEAM CONTRACT ENDED AT');
                      initialLine.add('CURRENT TEAM LEAGUE ICON');
                      initialLine.add('CURRENT TEAM LEAGUE NAME');
                      initialLine.add('CURRENT TEAM LEAGUE COUNTRY CODE');

                      initialLine.add('LENDER TEAM ICON');
                      initialLine.add('LENDER TEAM NAME');
                      initialLine.add('LENDER TEAM COUNTRY CODE');
                      initialLine.add('LENDER TEAM CONTRACT ENDED AT');
                      initialLine.add('LENDER TEAM LEAGUE ICON');
                      initialLine.add('LENDER TEAM LEAGUE NAME');
                      initialLine.add('LENDER TEAM LEAGUE COUNTRY CODE');

                      initialLine.add('FORMER TEAM ICON');
                      initialLine.add('FORMER TEAM NAME');
                      initialLine.add('FORMER TEAM COUNTRY CODE');
                      initialLine.add('FORMER TEAM CONTRACT ENDED AT');
                      initialLine.add('FORMER TEAM LEAGUE ICON');
                      initialLine.add('FORMER TEAM LEAGUE NAME');
                      initialLine.add('FORMER TEAM LEAGUE COUNTRY CODE');

                      initialLine.add('PLAYER STAT');
                    } else {
                      initialLine.add('PLAYER PHOTO');
                      initialLine.add('PLAYER BIO');
                    }

                    final joined = [
                      initialLine,
                      ...file1,
                      ...file2,
                    ];

                    final String csv =
                        const ListToCsvConverter().convert(joined);
                    final now = DateTime.now();
                    await FileSaver.instance.saveFile(
                      name:
                          '${isPro ? 'pro' : 'base'}_joinedtwo_atday_${now.day}_hour-${now.hour}_${now.minute}',
                      ext: 'csv',
                      bytes: utf8.encode(csv),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Complete!'),
                      ),
                    );
                  } catch (e) {
                    showErrorHappend(context, e);
                  }
                },
              )
            }
          ],
        ),
      ),
    );
  }
}

void showErrorWithFile(BuildContext context, Object e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Error with file happend\n$e'),
    ),
  );
}

void showErrorHappend(BuildContext context, Object e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Error!\n$e'),
    ),
  );
}
