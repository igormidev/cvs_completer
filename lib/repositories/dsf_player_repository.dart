import 'package:cvs_completer/data/dsf_mobile_user.dart';
import 'package:cvs_completer/data/players/player.dart';
import 'package:cvs_completer/providers/csv_maneger_providers.dart';
import 'package:cvs_completer/providers/native_providers.dart';
import 'package:cvs_completer/providers/progress_provider.dart';
import 'package:cvs_completer/repositories/restfull_client.dart';
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/pool_player.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/general/v3/dsf_ms_scout.pbgrpc.dart';

class DsfPlayerRepository {
  DsfPlayerRepository(this.ref);
  final Ref ref;

  Future<void> getProUsers(List<String> ids) async {
    ref.read(csvProLoadingProvider.notifier).state = true;

    final idToken = ref.read(logInProDataProvider);

    final client = ref.read(playerServiceClientProvider(idToken!));
    final int total = ids.length;
    int quantity = 0;
    // final lista =
    //     await client.listPoolPlayers(ListPoolPlayersRequest());
    // debugPrint('list: ${lista.poolPlayers.map((e) => e.id).toList()}');
    // for (final id in lista.poolPlayers.map((e) => e.id.toString()).toList()) {
    for (final id in ids) {
      try {
        if (id.toLowerCase().contains('BASE')) {
          quantity += 1;
          continue;
        }
        await Future.delayed(const Duration(milliseconds: 300));
        final castedId = int.parse(id);

        final response = await client
            .getPoolPlayer(GetPoolPlayerRequest(id: Int64(castedId)));
        final ProPlayer player = response.poolPlayer.toPlayer();
        ref.read(csvProDataProvider.notifier).state = {
          ...ref.read(csvProDataProvider.notifier).state,
          id: player,
        };
      } catch (e) {
        ref.read(csvProErrorProvider.notifier).state = [
          ...ref.read(csvProErrorProvider.notifier).state,
          'ID: $id, $e',
        ];
      } finally {
        quantity += 1;
        ref.read(progressDSFProApiProvider.notifier).state =
            Progress(total: total, amount: quantity);
      }
    }

    ref.read(csvProLoadingProvider.notifier).state = false;
  }

  Future<void> getBaseUsers(List<String> ids) async {
    ref.read(csvBaseLoadingProvider.notifier).state = true;
    final int total = ids.length;
    int quantity = 0;
    for (final id in ids) {
      await Future.delayed(const Duration(milliseconds: 600));
      quantity += 1;
      if (id.toLowerCase().contains('BASE')) {
        continue;
      }
      final response = await ref.read(restfullBaseClient).get(
            path: '/users/$id',
            fromMapFunction: (map) {
              final json = map['item'];
              return DSFMobileUser.fromJson(json);
            },
          );

      response.fold(
        (String error) {
          ref.read(csvProErrorProvider.notifier).state = [
            ...ref.read(csvProErrorProvider.notifier).state,
            'ID: $id, $error',
          ];
        },
        (DSFMobileUser user) {
          ref.read(csvBaseDataProvider.notifier).state = {
            ...ref.read(csvBaseDataProvider.notifier).state,
            id: user,
          };
        },
      );

      ref.read(progressDSFProApiProvider.notifier).state =
          Progress(total: total, amount: quantity);
    }

    ref.read(csvBaseLoadingProvider.notifier).state = false;
  }
}

/// 選手リストから選手詳細ページに選手情報を渡すためのprovider
final placeholderPlayerProvider =
    StateProvider.family<ProPlayer?, int>((ref, _) => null);

final playerServiceClientProvider =
    Provider.family<PoolPlayerServiceClient, String>((ref, idToken) {
  final channel = ref.watch(v3ClientChannelProvider);
  final options = ref.refresh(v3PrivateCallOptionsProvider(idToken));
  return PoolPlayerServiceClient(channel, options: options);
});

final v3ClientChannelProvider = Provider<ClientChannel>(
  (ref) {
    return ClientChannel('grpc-api.dsfootball.io');
  },
);

final v3PrivateCallOptionsProvider =
    Provider.autoDispose.family<CallOptions, String?>(
  (ref, idToken) {
    return CallOptions(
      metadata: {
        if (idToken != null) 'Authorization': 'Bearer $idToken',
        // 以下無くてもよいはずだがエラーが出るため解決されるまで残す
        'x-dsf-ms-host': 'dsf-ms-scoutbox',
      },
    );
  },
);
