import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';

import '../../config/theme/color_system/app_colors.dart';
import '../../core/extensions/string.dart';
import 'shimmer.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage(
    this.imageUrl, {
    super.key,
    this.customErrorWidgetBuilder,
    this.noLoader = false,
    this.customErrorWidget,
    this.loaderWidget,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.color,
    this.isLoaderShimmer = true,
  });

  final String imageUrl;

  final LoadingErrorWidgetBuilder? customErrorWidgetBuilder;
  final Widget? customErrorWidget;
  final Widget? loaderWidget;

  final bool noLoader;
  final double? height;
  final double? width;
  final BoxFit fit;

  final Alignment alignment;

  final Color? color;

  final bool isLoaderShimmer;
  @override
  Widget build(BuildContext context) {
    final memCacheHeight = height != null ? (height! * 2).ceil() : null;
    final memCacheWidth = width != null ? (width! * 2).ceil() : null;
    return RepaintBoundary(
      child: imageUrl.isSVG
          ? SvgPicture.network(
              imageUrl,
              fit: fit,
              width: width,
              height: height,
              placeholderBuilder: noLoader
                  ? null
                  : (_) => Center(
                        child: loaderWidget ??
                            (isLoaderShimmer
                                ? Shimmer(width: width, height: height)
                                : const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )),
                      ),
            )
          : CachedNetworkImage(
              fit: fit,
              width: width,
              color: color,
              height: height,
              imageUrl: imageUrl,
              alignment: alignment,
              memCacheWidth: memCacheWidth,
              memCacheHeight: memCacheHeight,
              placeholder: noLoader
                  ? null
                  : (_, __) => Center(
                        child: loaderWidget ??
                            (isLoaderShimmer
                                ? Shimmer(width: width, height: height)
                                : const CustomLoadingWidget()),
                      ),
              errorWidget: customErrorWidgetBuilder ??
                  (BuildContext context, String url, error) {
                    return Container(
                      color: Theme.of(context).cardColor,
                      child: customErrorWidget ??
                          Icon(Icons.error, color: AppColors.colors.error),
                    );
                  },
            ),
    );
  }
}
