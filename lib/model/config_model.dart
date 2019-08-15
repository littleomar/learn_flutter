class ConfigModel {
	String searchUrl;

	ConfigModel({this.searchUrl});

	ConfigModel.fromJson(Map<String, dynamic> json) {
		searchUrl = json['searchUrl'];
	}
}
