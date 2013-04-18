
/*global $*/

function changeLanguage(language) {
	'use strict';
	$('#overview_translated').attr('src','/overview/' + language + '_scrum_overview.png');
	$('#overview_pic_1').attr('href','/overview/' + language + '_scrum_overview1.pdf');
	$('#overview_pic_2').attr('href','/overview/' + language + '_scrum_overview2.pdf');
}

function replaceHashWithRedirect(location) {
	'use strict';
	if (!location.hash.match(/^#/)) {return;}
	
	var formerHashWithoutPound = location.hash.substring(1);
	var completePathname = location.pathname;
	completePathname += location.pathname.match(/\/$/) ? '' : '/';
	completePathname += formerHashWithoutPound;
	location.replace(location.protocol + "//" + location.host + completePathname + location.search);
}

function scrumPrimerReplaceHashWithRedirectForBackwardsCompatibility(location) {
	if (location.hash === '#translation') {
		location.hash = '#translations';
	}
	replaceHashWithRedirect(location);
}

(function () {
	'use strict';
	scrumPrimerReplaceHashWithRedirectForBackwardsCompatibility(location);
}());
