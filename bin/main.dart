import 'package:discord_bot/discord_bot.dart' as discord_bot;
import 'package:discord_bot/my_constants.dart';
import 'package:nyxx/nyxx.dart';

void main(List<String> arguments) {

  final bot = NyxxFactory.createNyxxWebsocket(MyConstants.token, GatewayIntents.all)
    ..registerPlugin(Logging()) // Default logging plugin
    ..registerPlugin(CliIntegration()) // Cli integration for nyxx allows stopping application via SIGTERM and SIGKILl
    ..registerPlugin(IgnoreExceptions()) // Plugin that handles uncaught exceptions that may occur
    ..connect();
  
  bot.eventsWs.onReady.listen(((event) => print('started')));

  bot.intents;

  // Listen for message events
  bot.eventsWs.onMessageReceived.listen((event) {
    if (event.message.content.contains('invite')) {
      event.message.channel.sendMessage(MessageBuilder.content("Acesse o link abaixo para me convidar.\nhttps://discord.com/api/oauth2/authorize?client_id=704475647308726342&permissions=8&scope=bot"));
    }
  });

}
