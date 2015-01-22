

$( document ).ready(function(){
  $("#header").load("header.html");
  $("#footer").load("footer.html");
  window.onload = processBodies($(window).width());
  $("#lnk_food").addEventListener('click', collapseFood($(window).width()));
  $("#lnk_info").addEventListener('click', collapseInfo($(window).width()));
  $("#lnk_my").addEventListener('click', collapseMy($(window).width()));
  $("#lnk_careers").addEventListener('click', collapseCareers($(window).width()));
  $("#lnk_connect").addEventListener('click', collapseConnect($(window).width()));
});

$(window).resize(function() {    // Optional: if you want to detect when the window is resized;
      processBodies($(window).width());
});

function processBodies(width) {
    if(width > 991) {
        $(".mnu.collapse").collapse("show");
    }
    else {
        $(".mnu.collapse").collapse("hide");
    }
}

function collapseFood(width) {
	if(width < 992){
		$("#mnu_info").collapse("hide");
		$("#mnu_my").collapse("hide");
		$("#mnu_careers").collapse("hide");
		$("#mnu_connect").collapse("hide");
	}
}

function collapseInfo(width) {
	if(width < 992) {
		$("#mnu_food").collapse("hide");
		$("#mnu_my").collapse("hide");
		$("#mnu_careers").collapse("hide");
		$("#mnu_connect").collapse("hide");
	}
}

function collapseMy(width) {
	if(width < 992){
		$("#mnu_info").collapse("hide");
		$("#mnu_food").collapse("hide");
		$("#mnu_careers").collapse("hide");
		$("#mnu_connect").collapse("hide");
	}
}

function collapseCareers(width) {
	if(width < 992) {
		$("#mnu_info").collapse("hide");
		$("#mnu_my").collapse("hide");
		$("#mnu_food").collapse("hide");
		$("#mnu_connect").collapse("hide");
	}
}

function collapseConnect(width) {
	if(width < 992) {
		$("#mnu_info").collapse("hide");
		$("#mnu_my").collapse("hide");
		$("#mnu_careers").collapse("hide");
		$("#mnu_food").collapse("hide");
	}
}