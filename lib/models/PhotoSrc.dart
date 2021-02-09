class PhotoSrc {
  String portrait;
  String large;
  String landscape;
  String medium;

  PhotoSrc({
    this.portrait,
    this.landscape,
    this.large,
    this.medium
  });

  factory PhotoSrc.fromMap(Map<String,dynamic> srcJson){
    return PhotoSrc(landscape: 
    srcJson["landscape"],
    large:srcJson["large"],
    portrait: srcJson["portrait"],
    medium: srcJson["medium"]);
  }

  


}