// ignore_for_file: equal_elements_in_set, use_build_context_synchronously

import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:cvs_completer/data/dsf_mobile_user.dart';
import 'package:cvs_completer/data/players/player.dart';
import 'package:cvs_completer/data/players/pro_csv_mapper.dart';
import 'package:cvs_completer/data/result_player.dart';
import 'package:cvs_completer/pages/log_in_form_section.dart';
import 'package:cvs_completer/providers/csv_maneger_providers.dart';
import 'package:cvs_completer/providers/mode_provider.dart';
import 'package:cvs_completer/providers/native_providers.dart';
import 'package:cvs_completer/providers/players_repository.dart';
import 'package:cvs_completer/providers/progress_provider.dart';
import 'package:cvs_completer/providers/wy_scout_provider.dart';
import 'package:cvs_completer/widgets/choose_two_file_button.dart';
import 'package:cvs_completer/widgets/choose_two_mode.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainWidget extends HookConsumerWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressDSFPro = ref.watch(progressDSFProApiProvider);
    final progressWyScout = ref.watch(progressWyScoutApiProvider);
    final TextEditingController minEC = useTextEditingController(text: '');
    final TextEditingController maxEC = useTextEditingController(text: '');
    final isLoggedData = progressWyScout != null ||
        progressDSFPro != null ||
        (ref.watch(logInProDataProvider) == null &&
            ref.watch(logInBaseDataProvider) == null);

    final isInCompletionData = ref.read(generatorModeStateProvider) ==
        GeneratorMode.completeAditionalData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          progressDSFPro == null
              ? progressWyScout == null
                  ? 'CSV Completer'
                  : 'WyScout data fetch -> ${progressWyScout.amount}/${progressWyScout.total} (${progressWyScout.percentage})'
              : 'DSF PRO data fetch -> ${progressDSFPro.amount}/${progressDSFPro.total} (${progressDSFPro.percentage})',
        ),
      ),
      body: ListView(
        children: [
          Opacity(
            opacity: isInCompletionData ? 1 : 0.5,
            child: IgnorePointer(
              ignoring: isInCompletionData == false,
              child: const LogInFormSection(),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 20),
          const Center(
            child: Text(
              'Completer mode:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: ChooseTwoMode(
              selectedIndex: ref.watch(generatorModeStateProvider).index,
              textOne: 'Get full data (need wyscoutid)',
              textTwo: 'Get wyscoutid based on\nplayers name',
              textThree: 'Join two cvs',
              oneOnTap: () {
                if (ref.read(generatorModeStateProvider) ==
                    GeneratorMode.completeAditionalData) return;
                ref.read(generatorModeStateProvider.notifier).state =
                    GeneratorMode.completeAditionalData;
                if (!isLoggedData) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You need to log in to get full data'),
                    ),
                  );
                }
              },
              twoOnTap: () {
                if (ref.read(generatorModeStateProvider) ==
                    GeneratorMode.getWysoutId) return;
                ref.read(generatorModeStateProvider.notifier).state =
                    GeneratorMode.getWysoutId;
              },
              threeOnTap: () {
                if (ref.read(generatorModeStateProvider) ==
                    GeneratorMode.joinTwoCVS) return;
                ref.read(generatorModeStateProvider.notifier).state =
                    GeneratorMode.joinTwoCVS;
              },
            ),
          ),
          const SizedBox(height: 8),
          const Center(child: SizedBox(width: 420, child: Divider(height: 8))),
          const SizedBox(height: 8),
          if (ref.read(generatorModeStateProvider) ==
              GeneratorMode.joinTwoCVS) ...{
            const SwitchProBase(),
            const Center(
                child: SizedBox(width: 420, child: Divider(height: 8))),
            const SizedBox(height: 8),
            const ChooseTwoFileCard(),
          } else ...{
            Center(
              child: SizedBox(
                width: 420,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: minEC,
                        decoration: const InputDecoration(
                          labelText: 'Min (Optional)',
                          border: OutlineInputBorder(),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: maxEC,
                        decoration: const InputDecoration(
                          labelText: 'Max (Optional)',
                          border: OutlineInputBorder(),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: SizedBox(
                width: 420,
                child: Divider(height: 8),
              ),
            ),
            const SizedBox(height: 8),
            Opacity(
              opacity: (!isLoggedData || !isInCompletionData) ? 1 : 0.5,
              child: IgnorePointer(
                ignoring: isLoggedData && (isInCompletionData == true),
                child: ChooseFileWidget(
                  minEC: minEC,
                  maxEC: maxEC,
                ),
              ),
            ),
          },
          const SizedBox(height: 8),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Error List:',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          ...ref.watch(csvProErrorProvider).map(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SelectableText(e),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: e));
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ...ref.watch(csvBaseErrorProvider).map(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SelectableText(e),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: e));
                        },
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

class ChooseFileWidget extends ConsumerStatefulWidget {
  final TextEditingController minEC;
  final TextEditingController maxEC;
  const ChooseFileWidget({
    super.key,
    required this.minEC,
    required this.maxEC,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChooseFileWidgetState();
}

class _ChooseFileWidgetState extends ConsumerState<ChooseFileWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Column(
        children: [
          const SwitchProBase(),
          FilledButton.icon(
            icon: const Icon(Icons.file_copy_sharp),
            label: const Text('Choose File'),
            onPressed: () async {
              final picked = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                // allowedExtensions: ['.cvs'],
              );
              if (picked?.files.isNotEmpty != true) {
                showNoFilePickerError(context);
                return;
              }
              const cvsConverter = CsvToListConverter();
              // Get csv

              // final reader = webFile.FileReader();
              final text = await picked!.files.first.xFile.readAsString();

              final csvBundle = [
                ...cvsConverter.convert(
                  text,
                )
              ];

              final csvMapper = CsvMapper.fromIdentifierLines(csvBundle.first);
              final mapper = csvMapper.targetColumnAndCorrespondingIndexInRow;
              final int typedMaxNumber = widget.maxEC.text.trim().isEmpty
                  ? 10000
                  : int.tryParse(widget.maxEC.text) ?? 10000;
              final int typedMinNumber = widget.minEC.text.trim().isEmpty
                  ? 0
                  : int.tryParse(widget.minEC.text) ?? 0;

              final alreadyExitsIds = [];

              csvBundle.removeWhere((row) {
                if (row.first.toString().trim().contains('ID')) return false;

                // <====> REMOVE THIS LINE <====>
                // We will remove that is not in the range
                final number = int.tryParse('${row[mapper[CSVColumns.id]!]}');
                if (number == null) return true;
                if (alreadyExitsIds.contains(number)) {
                  return true;
                } else {
                  alreadyExitsIds.add(number);
                }

                final espectedRange =
                    typedMinNumber <= number && number <= typedMaxNumber;
                if (!espectedRange) return true;
                return false;
                // <====> REMOVE THIS LINE <====>
              });

              final allIds = <String>[];
              final allNames = <String>[];
              final wyIds = <String>[];

              final isPro = ref.read(isProSelected);
              for (final row in csvBundle) {
                final cvsColumn = isPro ? CSVColumns.id : CSVColumns.baseUUID;
                final id = row[mapper[cvsColumn]!] == null
                    ? null
                    : '${row[mapper[cvsColumn]!]}';

                if (id != null && id.replaceAll(' ', '').isNotEmpty) {
                  allIds.add(id.toString());
                }

                const wyIdsCvsColumn = CSVColumns.idWyscout;
                final wyId = row[mapper[wyIdsCvsColumn]!];
                if (wyId != null &&
                    wyId.toString().replaceAll(' ', '').isNotEmpty &&
                    wyId.toString().trim().contains(' ') == false) {
                  wyIds.add(wyId.toString());
                }

                const userNameColumn = CSVColumns.fullName;
                final name = row[mapper[userNameColumn]!];
                if (name != null &&
                    name.toString().replaceAll(' ', '').isNotEmpty &&
                    name != 'Full name') {
                  allNames.add(name.toString());
                }
              }
              if (allIds.isEmpty) return;

              final playerRepo = ref.read(playersRepositoryProvider);
              final wyRepo = ref.read(wyScoutRepositoryProvider);

              List<List<dynamic>> newList = [];

              if (ref.read(generatorModeStateProvider) ==
                  GeneratorMode.getWysoutId) {
                newList = await getIdScoutByName(
                  isPro,
                  allNames,
                  mapper,
                  csvBundle,
                );
              } else {
                await wyRepo.getProUsersStats(wyIds);
                final playersStats = getPlayerStats();
                if (isPro) {
                  // await playerRepo.getProUsers(allIds);
                  if (isProCVSEmpty() && isWiseScoutEmpty()) {
                    return;
                  }
                  final proPlayers = getProPlayerData();

                  int index = 0;
                  for (final rawLine in csvBundle) {
                    final line = [...rawLine];
                    if (index == 0) {
                      line.add('CURRENT TEAM ICON');
                      line.add('CURRENT TEAM NAME');
                      line.add('CURRENT TEAM COUNTRY CODE');
                      line.add('CURRENT TEAM CONTRACT ENDED AT');
                      line.add('CURRENT TEAM LEAGUE ICON');
                      line.add('CURRENT TEAM LEAGUE NAME');
                      line.add('CURRENT TEAM LEAGUE COUNTRY CODE');

                      line.add('LENDER TEAM ICON');
                      line.add('LENDER TEAM NAME');
                      line.add('LENDER TEAM COUNTRY CODE');
                      line.add('LENDER TEAM CONTRACT ENDED AT');
                      line.add('LENDER TEAM LEAGUE ICON');
                      line.add('LENDER TEAM LEAGUE NAME');
                      line.add('LENDER TEAM LEAGUE COUNTRY CODE');

                      line.add('FORMER TEAM ICON');
                      line.add('FORMER TEAM NAME');
                      line.add('FORMER TEAM COUNTRY CODE');
                      line.add('FORMER TEAM CONTRACT ENDED AT');
                      line.add('FORMER TEAM LEAGUE ICON');
                      line.add('FORMER TEAM LEAGUE NAME');
                      line.add('FORMER TEAM LEAGUE COUNTRY CODE');

                      line.add('PLAYER STAT');
                    } else {
                      final index = mapper[CSVColumns.baseUUID];
                      final wyindex = mapper[CSVColumns.idWyscout];
                      final player =
                          index == null ? null : proPlayers['${line[index]}'];
                      final inner = wyindex == null ? null : '${line[wyindex]}';
                      final stat = inner == null ? null : playersStats[inner];
                      if (player == null) {
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');

                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');

                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                        line.add('');
                      } else {
                        // <=======> CURRENT TEAM <=======>
                        line.add(
                            player.currentTeam?.team.icon.toString() ?? '');
                        line.add(player.currentTeam?.team.name ?? '');
                        line.add(player.currentTeam?.team.country.code ?? '');
                        line.add(player.currentTeam?.contractEndedAt
                                ?.toIso8601String() ??
                            '');
                        line.add(player.currentTeam?.team.league?.icon ?? '');
                        line.add(player.currentTeam?.team.league?.name ?? '');
                        line.add(
                            player.currentTeam?.team.league?.country.code ??
                                '');
                        // <=======> CURRENT TEAM <=======>

                        // <=======> LENDER TEAM <=======>
                        line.add(player.lenderTeam?.team.icon.toString() ?? '');
                        line.add(player.lenderTeam?.team.name ?? '');
                        line.add(player.lenderTeam?.team.country.code ?? '');
                        line.add(player.lenderTeam?.contractEndedAt
                                ?.toIso8601String() ??
                            '');
                        line.add(player.lenderTeam?.team.league?.icon ?? '');
                        line.add(player.lenderTeam?.team.league?.name ?? '');
                        line.add(
                            player.lenderTeam?.team.league?.country.code ?? '');
                        // <=======> LENDER TEAM <=======>

                        // <=======> FORMER TEAM <=======>
                        line.add(player.formerTeam?.team.icon.toString() ?? '');
                        line.add(player.formerTeam?.team.name ?? '');
                        line.add(player.formerTeam?.team.country.code ?? '');
                        line.add(player.formerTeam?.contractEndedAt
                                ?.toIso8601String() ??
                            '');
                        line.add(player.formerTeam?.team.league?.icon ?? '');
                        line.add(player.formerTeam?.team.league?.name ?? '');
                        line.add(
                          player.formerTeam?.team.league?.country.code ?? '',
                        );
                        // <=======> FORMER TEAM <=======>
                      }

                      // <=======> USER STATS <=======>
                      if (stat == null) {
                        line.add('');
                      } else {
                        line.add(stat.toJson());
                      }
                      // <=======> USER STATS <=======>
                    }
                    index++;
                    newList.add(line);
                  }
                } else {
                  await playerRepo.getBaseUsers(allIds);
                  if (isBaseCVSEmpty() && isWiseScoutEmpty()) {
                    return;
                  }
                  final basePlayers = getBasePlayerData();
                  int index = 0;
                  for (final rawLine in csvBundle) {
                    final line = [...rawLine];
                    if (index == 0) {
                      line.add('PLAYER PHOTO');
                      line.add('PLAYER BIO');
                      line.add('PLAYER STAT');
                    } else {
                      final index = mapper[CSVColumns.baseUUID];
                      final player =
                          index == null ? null : basePlayers[line[index]];

                      final wyindex = mapper[CSVColumns.idWyscout];
                      final inner = wyindex == null ? null : '${line[wyindex]}';
                      final stat = inner == null ? null : playersStats[inner];
                      if (player == null) {
                        line.add('');
                        line.add('');
                        line.add('');
                      } else {
                        line.add(player.icon?.toString() ?? '');
                        line.add(player.bio);
                        if (stat == null) {
                          line.add('');
                        } else {
                          line.add(stat.toJson());
                        }
                      }
                    }
                    index++;
                    newList.add(line);
                  }
                }
              }

              if (newList.isEmpty) return;

              final String csv = const ListToCsvConverter().convert(newList);
              final now = DateTime.now();
              await FileSaver.instance.saveFile(
                name:
                    '${isPro ? 'pro' : 'base'}-${typedMinNumber}_to_${typedMaxNumber}_atday_${now.day}_hour_${now.hour}_${now.minute}',
                ext: 'csv',
                bytes: utf8.encode(csv),
              );

              await Future.delayed(const Duration(seconds: 6), () {
                ref.read(progressDSFProApiProvider.notifier).state = null;
                ref.read(progressWyScoutApiProvider.notifier).state = null;
              });

              // File f = File("$dir/filename.csv");

              // f.writeAsString(csv);

              // final rawData = f.readAsBytesSync();
              // // final rawData = f.readAsBytesSync();
              // final content = base64Encode(rawData);
              // final anchor = AnchorElement(
              //     href:
              //         "data:application/octet-stream;charset=utf-16le;base64,$content")
              //   ..setAttribute("download", "file.txt")
              //   ..click();
            },
          ),
        ],
      ),
    );
  }

  bool isBaseCVSEmpty() => ref.read(csvBaseDataProvider.notifier).state.isEmpty;
  bool isProCVSEmpty() => ref.read(csvProDataProvider.notifier).state.isEmpty;
  bool isWiseScoutEmpty() => ref.read(wyScoutStateProvider).isEmpty;

  Map<String, DSFMobileUser> getBasePlayerData() =>
      ref.read(csvBaseDataProvider.notifier).state;
  Map<String, ProPlayer> getProPlayerData() =>
      ref.read(csvProDataProvider.notifier).state;

  Map<String, ResultPlayer> getPlayerStats() =>
      ref.read(wyScoutStateProvider.notifier).state;

  Future<List<List<dynamic>>> getIdScoutByName(
    bool isPro,
    List<String> allNames,
    Map<CSVColumns, int> mapper,
    List<List<dynamic>> csvBundle,
  ) async {
    final List<List<dynamic>> newList = [];
    int index = 0;
    await ref
        .read(wyScoutRepositoryProvider)
        .getAllPlayerWyScoutIDByName(allNames);
    for (final rawLine in csvBundle) {
      final line = [...rawLine];
      final name = line[mapper[CSVColumns.fullName]!];
      if (index == 0) {
        // if (isPro) {
        //   line.add('CURRENT TEAM ICON');
        //   line.add('CURRENT TEAM NAME');
        //   line.add('CURRENT TEAM COUNTRY CODE');
        //   line.add('CURRENT TEAM CONTRACT ENDED AT');
        //   line.add('CURRENT TEAM LEAGUE ICON');
        //   line.add('CURRENT TEAM LEAGUE NAME');
        //   line.add('CURRENT TEAM LEAGUE COUNTRY CODE');

        //   line.add('LENDER TEAM ICON');
        //   line.add('LENDER TEAM NAME');
        //   line.add('LENDER TEAM COUNTRY CODE');
        //   line.add('LENDER TEAM CONTRACT ENDED AT');
        //   line.add('LENDER TEAM LEAGUE ICON');
        //   line.add('LENDER TEAM LEAGUE NAME');
        //   line.add('LENDER TEAM LEAGUE COUNTRY CODE');

        //   line.add('FORMER TEAM ICON');
        //   line.add('FORMER TEAM NAME');
        //   line.add('FORMER TEAM COUNTRY CODE');
        //   line.add('FORMER TEAM CONTRACT ENDED AT');
        //   line.add('FORMER TEAM LEAGUE ICON');
        //   line.add('FORMER TEAM LEAGUE NAME');
        //   line.add('FORMER TEAM LEAGUE COUNTRY CODE');

        //   line.add('PLAYER STAT');
        // } else {
        //   line.add('PLAYER PHOTO');
        //   line.add('PLAYER BIO');
        // }
      } else {
        final state = ref.read(wyScoutNameIdStateProvider.notifier).state;
        final wyScoutId = state[name];
        line[mapper[CSVColumns.idWyscout]!] = wyScoutId ?? '';
      }
      index++;
      newList.add(line);
    }
    return newList;
  }

  Future<List<List<dynamic>>> joinTwoFiles(
    List<String> allNames,
    Map<CSVColumns, int> mapper,
    List<List<dynamic>> csvBundle,
  ) async {
    final List<List<dynamic>> newList = [];
    int index = 0;
    await ref
        .read(wyScoutRepositoryProvider)
        .getAllPlayerWyScoutIDByName(allNames);
    for (final rawLine in csvBundle) {
      final line = [...rawLine];
      final name = line[mapper[CSVColumns.fullName]!];
      if (index != 0) {
        final state = ref.read(wyScoutNameIdStateProvider.notifier).state;
        final wyScoutId = state[name];
        line[mapper[CSVColumns.idWyscout]!] = wyScoutId ?? '';
      }
      index++;
      newList.add(line);
    }
    return newList;
  }
}

void showNoFilePickerError(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('No file selected'),
    ),
  );
}

class SwitchProBase extends ConsumerWidget {
  const SwitchProBase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 340,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Pro'),
          Switch(
            inactiveThumbColor: Colors.purple[100],
            inactiveTrackColor: Colors.deepPurple,
            value: !ref.watch(isProSelected),
            onChanged: (value) {
              ref.read(isProSelected.notifier).state =
                  !ref.read(isProSelected.notifier).state;
            },
          ),
          const Text('Base'),
        ],
      ),
    );
  }
}
