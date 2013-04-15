
function changeLanguage(language) {
	$('#overview_translated').attr('src','/overview/scrum_overview_' + language + '.png');
	$('#overview_pic_1').attr('href','/overview/scrum_overview1_' + language + '.pdf');
	$('#overview_pic_2').attr('href','/overview/scrum_overview2_' + language + '.pdf');
}		
