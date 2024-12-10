import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/assets.dart';
import '../utils/asset_svg_finder.dart';
import 'game_notifier.dart';

class GameDetailsPage extends StatefulHookConsumerWidget {
  final int gameId;
  const GameDetailsPage({required this.gameId, super.key});
  @override
  ConsumerState<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends ConsumerState<GameDetailsPage> {
  bool isDescriptionExpanded = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    if (!_isInitialized) {
      _isInitialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(gameNotifierProvider.notifier).getGameDetails(widget.gameId);
        ref.read(gameNotifierProvider.notifier).getGameScreenshots(widget.gameId);
        ref.read(gameNotifierProvider.notifier).getGameDev(widget.gameId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameSingle =
        ref.watch(gameNotifierProvider.select((value) => value.gameSingle));
    final screenshots =
        ref.watch(gameNotifierProvider.select((value) => value.screenshots));
    final devTeam =
        ref.watch(gameNotifierProvider.select((value) => value.devTeam));
    List<String> arrayPlatforms = [];
    List<String> arrayPlatformsText = [];

    const int DESC_LENGTH_LIMIT = 500;
    final String cleanDescription = cleanHTML(gameSingle?.description);
    final String truncatedDescription = truncateText(cleanDescription, DESC_LENGTH_LIMIT);

    gameSingle?.platforms?.forEach((element) {
      final currentPlatform = getPlatformIcon(element.platform.slug);
      if (currentPlatform != "") {
        if (!arrayPlatforms.contains(currentPlatform)) {
          arrayPlatforms.add(currentPlatform);
        }
      } else {
        arrayPlatformsText.add(element.platform.name);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Game Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (screenshots != null && screenshots.isNotEmpty)
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: PageController(),
                  itemCount: screenshots.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: Image.network(
                        screenshots[index].imageURL!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text("Failed to load image"),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            else
              const Center(
                child: Text("No screenshots available"),
              ),
            Row(
              children: [
                ...arrayPlatforms.map(
                  (platformIcon) => Padding(
                    padding: EdgeInsets.all(4.0),
                    child: AppSvgAsset(
                      platformIcon,
                      width: 30,
                      height: 30,
                      color: Colors.black,
                      ),
                    // Icon(
                    //     IconData(platformIcon, fontFamily: 'MaterialIcons'),
                    //     size: 30.0),
                    // ),
                  ),
                ),
                ...arrayPlatformsText.map(
                  (platformText) => Padding(
                    padding: EdgeInsets.all(4.0),
                    child:
                        Text(platformText, style: TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            ),
            Text(
              gameSingle?.name ?? "",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20.0),
            Text("Description", style: Theme.of(context).textTheme.headlineSmall),

            GestureDetector(
              onTap: () {
                setState(() {
                  isDescriptionExpanded = !isDescriptionExpanded;
                });
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: isDescriptionExpanded || cleanDescription.length < DESC_LENGTH_LIMIT
                        ? cleanDescription
                        : truncatedDescription,
                    ),
                    if (!isDescriptionExpanded && cleanDescription.length >= DESC_LENGTH_LIMIT)
                      const TextSpan(
                        text: " SEE MORE",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Genre", style: Theme.of(context).textTheme.headlineSmall),
                      if (gameSingle?.genres != null && gameSingle!.genres!.isNotEmpty)
                        ...gameSingle.genres!.take(3).map((genre) => Text(genre.name))
                      else
                        const Text("N/A"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Release date", style: Theme.of(context).textTheme.headlineSmall),
                      Text(gameSingle?.released ?? "N/A"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Developer", style: Theme.of(context).textTheme.headlineSmall),
                      if (devTeam != null && devTeam.isNotEmpty)
                        ...devTeam.take(3).map((developer) =>
                            Text(developer.name),
                        )
                      else
                        const Text("N/A"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Publisher", style: Theme.of(context).textTheme.headlineSmall),
                      if (gameSingle?.publishers != null && gameSingle!.publishers!.isNotEmpty)
                        ...gameSingle.publishers!.take(3).map((publisher) =>
                            Text(publisher.name),
                        )
                      else
                        const Text("N/A"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text("Website", style: Theme.of(context).textTheme.headlineSmall),
            if (gameSingle?.website != "")
              LinkButton("Voir plus", true, gameSingle?.website)
            else
              const Text("Unknown"),
          ],
        ),
      ),
    );
  }
}

class LinkButton extends StatelessWidget {
  final String label;
  final bool icon;
  final String? url;
  const LinkButton(this.label, this.icon, this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print("url: \"$url\"");
        canLaunchUrl(Uri.parse(url!)).then((onValue) {
          launchUrl(Uri.parse(url!), mode: LaunchMode.externalApplication);
        });
      },
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(width: 10),
          if (icon) Icon(Icons.open_in_new),
        ],
      ),
    );
  }
}

String getPlatformIcon(String slug) {
  if (slug.contains("pc")) return Assets.assetsComputerSvgrepoCom;
  if (slug.contains("web")) return Assets.assetsWebSvgrepoCom;
  if (slug.contains("macos")) return Assets.assetsMacosSvgrepoCom;
  if (slug.contains("linux")) return Assets.assetsLinuxSvgrepoCom;
  if (slug.contains("xbox")) return Assets.assetsXboxSvgrepoCom;
  if (slug.contains("playstation")) return Assets.assetsPlaystationSvgrepoCom;
  if (slug.contains("switch")) return Assets.assetsSwitchFilledSvgrepoCom;
  if (slug.contains("ios")) return Assets.assetsIosSvgrepoOutlined;
  if (slug.contains("android")) return Assets.assetsAndroidSvgrepoCom;
  return "";
}

String cleanHTML(String? text) {
  if (text == null) return "";
  final document = html_parser.parse(text);
  final unescapedText = HtmlUnescape().convert(document.body?.text ?? "");
  return unescapedText;
}

String truncateText(String? text, int lengthLimit) {
  if (text == null || text.length <= lengthLimit) return text ?? "";
  final truncated = text.substring(0, lengthLimit).split(' ').sublist(0, text.substring(0, lengthLimit).split(' ').length - 1).join(' ').trim();
  return text.length > truncated.length ? "$truncated..." : truncated;
}