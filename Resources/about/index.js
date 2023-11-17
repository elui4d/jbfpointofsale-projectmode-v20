/*
 4D (the "Software") and the corresponding source code remain
 the exclusive property of 4D and/or its licensors and are protected by national
 and/or international legislations.
 This file is part of the source code of the Software provided under the relevant
 4D License Agreement available on http://www.4D.com/license whose compliance
 constitutes a prerequisite to any use of this file and more generally of the
 Software and the corresponding source code.
 */

if ($.browser.msie && ($.browser.version < 9)) {

    window.location.href = './fallback.html';

} else {

    var t;
	var timer_is_on = 0;
	
	var companyName = new Array();
	var companyCountry = new Array();
	var companyAdress = new Array();
	var companyURL = new Array();
	var companyEmail = new Array();
	var companyCode = new Array();
	var companyDefault = 0;
	
	$(document).ready(initEventHandler);   
    
}
	
function initEventHandler() {
	
	$("#processor").toggleClass('cached', !is64bits);
	
	$("[name='close']").click(close);
	
	$(".company").click(eventCompany);
	$(".company").mouseover(eventCompany);
	
	$(".w-closebox").click(show);
	
	$('#companyURL').click(stopTimer);
	$('#companyEmail').click(stopTimer);
	
	$(document).keydown(keydown);
	
	// $('#testSVG').svg({onLoad: drawIntro});
	
	//waMessage('loaded');
	return true;
}

	
function keydown(e) {

	if (!e) {
		e = event;
	}

	switch (e.keyCode) {

	// space
	case 32:

		if ($('#window_2').hasClass("displayed")) {
			switchTimer();
		}

		return suppressdefault(e, document);
		break;

	// escape
	case 27:

		if (!($('#window_1').hasClass('cached'))
				|| (!$('#window_2').hasClass('cached'))) {

			show(); /* close pop window */

		} else {

			close(); /* close dialog */
		}

		return suppressdefault(e, document);
		break;

	default:

	}
}

function addCompany(name, country, adress, url, email, code) {

	companyName.push(name);
	companyCountry.push(country);
	companyAdress.push(adress);
	companyURL.push(url);
	companyEmail.push(email);
	companyCode.push(code);

}

function setDefaultCompany(x) {

	companyDefault = x;

}

function userInfos(userName, userCompany) {

	$('span#userName').text(userName);
	$('span#userCompany').text(userCompany);
}

function selectCompany(code) {

	stopTimer();

	x = companyCode.indexOf(code);

	if (x == -1) {

		x = 1;

	}

	displayCompany(x, false);

}

function displayCompany(x, animate) {

	switch (arguments.length) {

	case 0:
		x = Math.floor(Math.random() * (companyName.length));
		animate = true;
		break;

	case 1:
		animate = true;
		break;

	}

	$('span#companyName').text(companyName[x]);
	$('span#companyCountry').text(companyCountry[x]);
	$('#companyAdress').html(companyAdress[x]);
	$("#companyURL").attr('href', companyURL[x]);
	$("#companyURL").text(companyURL[x]);
	$("#companyEmail").attr('href', "mailto:" + companyEmail[x]);
	$('#companyEmail').text(companyEmail[x]);

	$("[name='pins']").each(function() {
		selected = ($(this).attr("id") == companyCode[x]);
		$(this).toggleClass('company-selected', selected);
		$('#company').toggleClass('company', !selected);
	});

	if (animate) {

		doTimer();

	}
}

function eventCompany() {

	selectCompany(this.id);

}

function show(what) {

	stopTimer();

	switch (what) {

	case 'copyright':

		$('#w-title').text(wTitleCopyright);

		$('#window_1').toggleClass('cached',
				!$('#copyright').hasClass('cached'));
		$('#copyright').toggleClass('cached',
				!$('#copyright').hasClass('cached'));

		$('#window_2').addClass('cached');
		$('#legal').addClass('cached');

		break;

	case 'legal':

		$('#w-title').text(wTitleLegal);

		$('#window_1').toggleClass('cached', !$('#legal').hasClass('cached'));
		$('#legal').toggleClass('cached', !$('#legal').hasClass('cached'));

		$('#window_2').addClass('cached');
		$('#copyright').addClass('cached');

		break;

	case 'around':

		$('#window_1').addClass('cached');
		$('#legal').addClass('cached');
		$('#copyright').addClass('cached');

		displayCompany(companyDefault);
		$('#window_2').removeClass('cached');

		/*
		 * if ($('#window_2').hasClass('cached') == true) {
		 * displayCompany(companyDefault);
		 * $('#window_2').removeClass('cached').addClass('displayed'); } else {
		 * $('#window_2').removeClass('displayed').addClass('cached'); }
		 */

		break;

	default:

		$('#window_1').addClass('cached');
		$('#legal').addClass('cached');
		$('#copyright').addClass('cached');
		$('#window_2').addClass('cached');
	}
}

function doTimer() {

	timer_is_on = 1;
	t = setTimeout("displayCompany()", 2000);

}

function stopTimer() {

	timer_is_on = 0;
	clearTimeout(t);

}

function switchTimer() {

	if (timer_is_on == 0) {

		timer_is_on = 1;
		displayCompany();

	} else {

		stopTimer();
	}
}
