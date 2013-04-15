
/*global $*/

function changeLanguage(language) {
	'use strict';
	$('#overview_translated').attr('src','/overview/scrum_overview_' + language + '.png');
	$('#overview_pic_1').attr('href','/overview/scrum_overview1_' + language + '.pdf');
	$('#overview_pic_2').attr('href','/overview/scrum_overview2_' + language + '.pdf');
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
