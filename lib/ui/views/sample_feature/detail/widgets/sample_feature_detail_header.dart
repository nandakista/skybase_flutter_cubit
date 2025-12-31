import 'package:flutter/material.dart';
import 'package:skybase/core/extension/build_context_extension.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

class SampleFeatureDetailHeader extends StatelessWidget {
  const SampleFeatureDetailHeader({
    super.key,
    required this.avatar,
    required this.repositoryCount,
    required this.followerCount,
    required this.followingCount,
  });

  final String avatar;
  final int repositoryCount;
  final int followerCount;
  final int followingCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SkyImage(
            size: 45,
            shapeImage: ShapeImage.circle,
            src: '$avatar&s=200',
            enablePreview: true,
          ),
          Column(
            children: [
              Text(
                repositoryCount.toString(),
                style: context.typography.headline3,
              ),
              const Text('Repository'),
            ],
          ),
          Column(
            children: [
              Text(
                followerCount.toString(),
                style: context.typography.headline3,
              ),
              const Text('Follower'),
            ],
          ),
          Column(
            children: [
              Text(
                followingCount.toString(),
                style: context.typography.headline3,
              ),
              const Text('Following'),
            ],
          ),
        ],
      ),
    );
  }
}
