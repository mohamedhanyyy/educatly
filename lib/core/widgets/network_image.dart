
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme/color_system/app_colors.dart';
import '../../core/extensions/string.dart';
import 'shimmer.dart';

/// Wrapper widget around a [CachedNetworkImage]
///
/// See: https://pub.dev/packages/cached_network_image
class AppCachedNetworkImage extends StatelessWidget {
  /// Creates a new instance of [AppCachedNetworkImage]
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
    this.colorBlendMode,
    this.isLoaderShimmer = true,
  });

  /// The image url
  final String imageUrl;

  /// An optional custom error widget builder
  final LoadingErrorWidgetBuilder? customErrorWidgetBuilder;

  /// An optional custom error widget
  ///
  /// Default to an [ErrorView] widget
  final Widget? customErrorWidget;

  /// An optional custom loader widget
  ///
  /// Defaults to a [Shimmer] widget if [isLoaderShimmer] is true
  /// Defaults to a [AppLoader] widget if [isLoaderShimmer] is false
  final Widget? loaderWidget;

  /// Forces a null placeholder
  final bool noLoader;

  /// Image height
  final double? height;

  /// Image width
  final double? width;

  /// Image fit
  final BoxFit fit;

  /// Image alignment
  final Alignment alignment;

  /// Image overlay color
  final Color? color;

  /// Image overlay color blend mode
  final BlendMode? colorBlendMode;

  /// Indicates what loading widget to render
  ///
  /// [AppLoader] or [Shimmer]
  /// Defaults to true
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
                                : Center(
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
              colorBlendMode: colorBlendMode,
              placeholder: noLoader
                  ? null
                  : (_, __) => Center(
                        child: loaderWidget ??
                            (isLoaderShimmer
                                ? Shimmer(width: width, height: height)
                                : Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )),
                      ),
              errorWidget: customErrorWidgetBuilder ??
                  // coverage:ignore-start
                  (BuildContext context, String url, dynamic error) {
                    // log('🖼 🖼 🖼 🖼 🖼 Error Fetching Image 🖼 🖼 🖼 🖼 🖼');
                    // log('Image url: $url');
                    return Container(
                      color: Theme.of(context).cardColor,
                      child: customErrorWidget ??
                          Icon(
                            Icons.error,
                            color: AppColors.colors.error,
                          ),
                    );
                  },
            ),
    );
  }
}
