/*
    4D (the "Software") and the corresponding source code remain
    the exclusive property of 4D and/or its licensors and are protected by national
    and/or international legislations.
    This file is part of the source code of the Software provided under the relevant
    4D License Agreement available on http://www.4D.com/license whose compliance
    constitutes a prerequisite to any use of this file and more generally of the
    Software and the corresponding source code.
 */

$(document).ready(initEventHandler);

function initEventHandler() {

    $('#noMoreLabel').click(noMoreLabel);
    $('#noMore').click(noMore);

    // TESTS {
    // evaluation('Evaluation license is valid until N/A');
    evaluation('');
    // }

    $('[name="menu-title"]').click(clickMenuTitle);
    $('[name="menu-item"]').click(clickMenuItem);
    $('[name="menu-item"]').mouseover(updateInfo);

    $('.info').click(popInfo);

    $('.w-closebox').click(popInfo);
    $('.w-closeLabel').click(popInfo);

    $(document).keydown(keydown);

    // waMessage('loaded');
    return true;
}

function evaluation(expiration) {

    if (expiration.length == 0) {

        $("#2_3 br span").remove();
        $("#2_3 br").remove();

    } else {

        $("#2_3").removeAttr('name');
        $("#2_3").toggleClass("item-disabled");
        $('#evaluation-licence-expiration').text(expiration);

    }
}

function keydown(e) {

    if (!e) {
        e = event;
    }

    switch (e.keyCode) {

        // escape
        case 27:

            if (!($('#info_window').hasClass('cached'))) {

                $('#info_window').toggleClass('cached', true);

            } else {

                waMessage('close');

            }
            return suppressdefault(e, document);
            break;

        default:

    }
}

function clickMenuTitle() {

    $('#info_window').addClass('cached');

    id = this.id;

    switch (id) {

        case 'menu_title_1':
            menuOnClic('menu_title_1', 'menu_title_2');
            break;

        case 'menu_title_2':
            menuOnClic('menu_title_2', 'menu_title_1');
            break;

        default:

    }
}

function clickMenuItem() {

    id = this.id;
    switch (id) {

        case '1_1':
            waMessage('connectTo4dServer');
            break;

        case '1_2':
            waMessage('openALocalApplication');
            break;

        case '1_3':
            waMessage('createANewApplication');
            break;

        case '2_1':
            waMessage('enterLicence');
            break;

        case '2_2':
            waMessage('purchaseLicence');
            break;

        case '2_3':
            waMessage('Free30DayTrial');
            break;

        default:

    }
}

function popInfo() {

    if (this.name == 'closeBox') {

        $('#info_window').addClass('cached');

    } else {

        wanted = this.value;

        $('#info_window').removeClass('cached');

        $("[name='infos']").each(function() {

            $(this).toggleClass('cached', !($(this).attr("id") == wanted));

        });
    }
}

function updateInfo() {

    if (!$('#info_window').hasClass('cached')) {

        wanted = "info" + this.id.replace("_", "");

        $("[name='infos']").each(function() {

            $(this).toggleClass('cached', !($(this).attr("id") == wanted));

        });
    }
}

function noMoreLabel() {
    check('noMore');
    noMore();
}

function noMore() {

    waMessage('NoMore?' + document.getElementById("noMore").checked);

}

function menuOnClic(clicked, other) {

    currentMenu = document.getElementById(clicked);
    otherMenu = document.getElementById(other);

    if (currentMenu.className == 'menu_closed') {

        action = 'open';

    } else {

        action = 'close';

    }

    if (clicked == 'menu_title_1') {

        if (action == 'open') {

            toDisplay = 'item_1';
            toHide = 'item_2';

        } else {

            toDisplay = 'item_2';
            toHide = 'item_1';

        }

    } else {

        if (action == 'open') {

            toDisplay = 'item_2';
            toHide = 'item_1';

        } else {

            toDisplay = 'item_1';
            toHide = 'item_2';

        }
    }

    for (i = 0; i < 3; i++) {
        document.getElementsByName(toDisplay)[i].className = 'displayed';
    }

    for (i = 0; i < 3; i++) {
        document.getElementsByName(toHide)[i].className = 'cached';
    }

    if (action == 'open') {

        currentMenu.className = "menu_opened";
        otherMenu.className = "menu_closed";

    } else {

        currentMenu.className = "menu_closed";
        otherMenu.className = "menu_opened";

    }

    popup(false);

    return true;
}

function doTimer(target) {

    timer_is_on = 1;
    t = setTimeout("displayInfo()", 2000);

}