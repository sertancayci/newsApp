import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:news_app/widget/text/subtitle_text.dart';
import 'package:news_app/widget/text/title_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: context.paddingNormal,
          children: [
            const _Header(),
            SizedBox(
              height: 56,
              child: TextField(
                  decoration: InputDecoration(
                hintText: StringConstants.search,
                filled: true,
                fillColor: ColorConstants.grayLighter,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              )),
            ),
            _Tags(),
            _BrowseListView(),
            _RecommendedHeader(),
            _RecommendedListView()
          ],
        ),
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.1),
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index.isEven) {
            return Chip(
              label: Text(
                'label',
                style: context.textTheme.bodySmall?.copyWith(
                  color: ColorConstants.grayPrimary,
                ),
              ),
              backgroundColor: ColorConstants.grayLighter,
              padding: context.paddingLow,
            );
          } else {
            return Chip(
              label: Text(
                'label',
                style: context.textTheme.bodySmall?.copyWith(
                  color: ColorConstants.white,
                ),
              ),
              backgroundColor: ColorConstants.purplePrimary,
              padding: context.paddingLow,
            );
          }
        },
      ),
    );
  }
}

class _BrowseListView extends StatelessWidget {
  const _BrowseListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.2),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: context.onlyRightPaddingNormal,
            child: Placeholder(),
          );
        },
      ),
    );
  }
}

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: TitleText(value: StringConstants.homePopular)),
        TextButton(
          onPressed: () {},
          child: Text(StringConstants.seeAll),
        ),
      ],
    );
  }
}

class _RecommendedListView extends StatelessWidget {
  const _RecommendedListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: context.verticalPaddingLow,
          child: Placeholder(),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TitleText(value: StringConstants.homeBrowse),
        SizedBox(height: 8),
        SubtitleText(value: StringConstants.homeSubtitle)
      ],
    );
  }
}
