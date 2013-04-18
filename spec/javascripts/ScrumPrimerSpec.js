
describe("Scrum Primer Overview translation buttons", function() {

  beforeEach(function() {
	loadFixtures("change_language.html");
  });

  it("Should load the proper overview image when calling changeLanguage", function() {
	changeLanguage('kl');
	expect($('#overview_translated')).toHaveAttr("src", "/overview/kl_scrum_overview.png");
  });

  it("Should switch the URL for the primer when calling changeLanguage", function() {
	changeLanguage('eo');
	expect($('#overview_pic_1')).toHaveAttr("href", "/overview/eo_scrum_overview1.pdf");
	expect($('#overview_pic_2')).toHaveAttr("href", "/overview/eo_scrum_overview2.pdf");
  });
});

describe("The original hashtag way of referring to the page redirects to a path", function () {

  var stubbedLocation;

  beforeEach(function() {
	stubbedLocation = {
		protocol: "http:",
		hash: '',
		host: 'localhost:8888',
		pathname: '/',
		search: '',
		replace: function(url) {}
	};
	spyOn(stubbedLocation, "replace");
  });

  it("Should replace #home and redirect to /home", function() {
	stubbedLocation.hash = "#home";
	stubbedLocation.search = '?foo=bar';
	replaceHashWithRedirect(stubbedLocation);
	expect(stubbedLocation.replace).toHaveBeenCalledWith('http://localhost:8888/home?foo=bar');
  });

  it("Should replace #overview and redirect to /overview", function () {
	stubbedLocation.hash = "#overview";
	replaceHashWithRedirect(stubbedLocation);
	expect(stubbedLocation.replace).toHaveBeenCalledWith('http://localhost:8888/overview');
  });

  it("Should not call replace when the url is /overview", function () {
	stubbedLocation.pathname = "/overview";
	replaceHashWithRedirect(stubbedLocation);
	expect(stubbedLocation.replace).not.toHaveBeenCalled();
  });

  it("Should keep the pathname when it is given and add to it", function () {
    stubbedLocation.pathname = "/zh-cn";
    stubbedLocation.hash = "#overview";
    replaceHashWithRedirect(stubbedLocation);
    expect(stubbedLocation.replace).toHaveBeenCalledWith('http://localhost:8888/zh-cn/overview');
  });

  it("Should keep the pathname when it is given and add to it and it contains an extra slash", function () {
    stubbedLocation.pathname = "/zh-cn/";
    stubbedLocation.hash = "#overview";
    replaceHashWithRedirect(stubbedLocation);
    expect(stubbedLocation.replace).toHaveBeenCalledWith('http://localhost:8888/zh-cn/overview');
  });

  it("Should replace #translation with /translations", function () {
	stubbedLocation.hash = "#translation";
    scrumPrimerReplaceHashWithRedirectForBackwardsCompatibility(stubbedLocation);
    expect(stubbedLocation.replace).toHaveBeenCalledWith('http://localhost:8888/translations');
  });
  
});