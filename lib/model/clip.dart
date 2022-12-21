class Clip {
  final int id;
  final String clipPath;
  final String title;
  final String subTitle;
  final String avatarImagePath;
  final bool isFavorite;

  Clip(
    {
      required this.id,
      required this.clipPath,
      required this.title,
      this.subTitle = "",
      this.avatarImagePath = "assets/images/mgs_main_logo.jpg",
      this.isFavorite = false,
    }
  );
}