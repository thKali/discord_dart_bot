import 'package:discord_bot/commands/economy.dart';
import 'package:discord_bot/commands/miscellaneous.dart';
import 'package:discord_bot/commands/moderation.dart';
import 'package:discord_bot/my_constants.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';

void main(List<String> arguments) {
  final bot =
      NyxxFactory.createNyxxWebsocket(MyConstants.token, GatewayIntents.all)
        ..registerPlugin(Logging()) // Default logging plugin
        ..registerPlugin(
            CliIntegration()) // Cli integration for nyxx allows stopping application via SIGTERM and SIGKILl
        ..registerPlugin(
            IgnoreExceptions()) // Plugin that handles uncaught exceptions that may occur
        ..connect();

  //slash
  final singleCommand =
      SlashCommandBuilder("help", "This is example help command", [])
        ..registerHandler((event) async {
          await event.respond(MessageBuilder.content("Work in progress"));
        });

  IInteractions.create(WebsocketInteractionBackend(bot))
    ..registerSlashCommand(
        singleCommand) // Register created before slash command
    ..syncOnReady(); // This is needed if you want to sync commands on bot startup.

  String prefix = '!';
  List listenableChannels = [];

  //inicializar modulos de comandos
  Economy(bot, prefix, listenableChannels).init();
  Moderation(bot, prefix, listenableChannels).init();
  Micellaneous(bot, prefix, listenableChannels).init();
}

  // List<String> admin = ['338739607044620288'];