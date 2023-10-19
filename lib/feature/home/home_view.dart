import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/constants/enums/widget_size.dart';
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
          children: const [
            _Header(),
            _CustomField(),
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

class _CustomField extends StatelessWidget {
  const _CustomField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
  const _BrowseListView();

  static const dummyImage =
      "https://firebasestorage.googleapis.com/v0/b/news-app-27351.appspot.com/o/white_house.png?alt=media&token=58ef83c6-e9da-4bf1-9111-12333174d6e5";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.3),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _HorizontalCard(dummyImage: dummyImage);
        },
      ),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  const _HorizontalCard({
    Key? key,
    required this.dummyImage,
  }) : super(key: key);

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.onlyRightPaddingNormal,
          child: Image.network(
            _BrowseListView.dummyImage,
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end ,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                    size: WidgetSize.iconNormal.value.toDouble(),
                  ),
                ),
                const Spacer(),

                Padding(
                  padding: context.paddingLow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubtitleText(value: 'Politics', color: ColorConstants.grayLighter,),
                      Text('The latest situation in the presidential election',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: Colors.white
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader({
    super.key,
  });

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

  static const dummyImage2 = 'https://firebasestorage.googleapis.com/v0/b/news-app-27351.appspot.com/o/simple_trick.png?alt=media&token=8e2e025d-61d3-4fe9-913f-e3e362865bbf';


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.network(dummyImage2, fit: BoxFit.fill,),
            title: Text('The simple trick to get rid of dark circles instantly'),
            subtitle: Text('Beauty'),
          ),
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
