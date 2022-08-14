import 'package:nyxx/nyxx.dart';

class Economy {
  final INyxxWebsocket bot;
  final String prefix;
  final List listenableChannels;
  Economy(this.bot, this.prefix, this.listenableChannels);

  init() => ouvirComandos();

  ouvirComandos() {
    bot.eventsWs.onMessageReceived.listen((event) {
      var channelId = event.message.channel.id;
      var message = event.message;

      if (!listenableChannels.contains(channelId)) return;

      // mostra o saldo
      if (message.content.contains('${prefix}saldo')) {
        message.channel.sendMessage(
          MessageBuilder.content("ainda não implementado."),
        );
      }
    });
  }
}
