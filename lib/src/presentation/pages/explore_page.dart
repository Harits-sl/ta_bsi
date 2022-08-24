import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/data/models/article_model.dart';
import 'package:ta_bsi/src/data/models/youtube_model.dart';
import 'package:ta_bsi/src/presentation/cubit/article/article_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/youtube/youtube_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/card_article.dart';
import 'package:ta_bsi/src/presentation/widgets/card_youtube.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    super.initState();
    context.read<YoutubeCubit>().fetchListYoutube();
    context.read<ArticleCubit>().fetchListArticle();
  }

  @override
  Widget build(BuildContext context) {
    void onTapForYoutube(YoutubeModel youtube) {
      Go.routeWithPath(
        context: context,
        path: '/youtube',
        arguments: youtube,
      );
    }

    void onTapForArticle(ArticleModel article) {
      Go.routeWithPath(
        context: context,
        path: '/detail-article',
        arguments: article,
      );
    }

    Widget titleAndSeeAll(String title) {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Text(
              '',
              style: primaryTextStyle.copyWith(
                fontSize: 10,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget youtube(List<YoutubeModel> datas) {
      Widget listViewYoutube() {
        int _index = 0;

        return SizedBox(
          height: 192,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: datas.map((data) {
              _index++;
              return Container(
                margin: EdgeInsets.only(
                  top: 12,
                  left: _index == 1 ? defaultMargin : 16,
                  right: _index == datas.length ? defaultMargin : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    onTapForYoutube(data);
                  },
                  child: CardYoutube(
                    youtube: data,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleAndSeeAll('Youtube'),
          listViewYoutube(),
        ],
      );
    }

    Widget article(List<ArticleModel> datas) {
      Widget listViewArticle() {
        return Container(
          margin: EdgeInsets.only(
            top: 12,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Column(
            children: datas.map((data) {
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    onTapForArticle(data);
                  },
                  child: CardArticle(
                    article: data,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleAndSeeAll('Article'),
          listViewArticle(),
        ],
      );
    }

    Widget body() {
      return SafeArea(
        child: BlocBuilder<YoutubeCubit, YoutubeState>(
          builder: (context, youtubeState) {
            return BlocBuilder<ArticleCubit, ArticleState>(
              builder: (context, articleState) {
                if (youtubeState is YoutubeLoading &&
                    articleState is ArticleLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (youtubeState is YoutubeSuccess &&
                    articleState is ArticleSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      youtube(youtubeState.youtube),
                      article(articleState.article),
                    ],
                  );
                }
                return const SizedBox();
              },
            );
          },
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
