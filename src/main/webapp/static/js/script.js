


$(document).ready(function() {
	inactivityTime();
	
	function inactivityTime() {
	    let time;
	    // reset timer
	    window.onload = resetTimer;
	    document.onmousemove = resetTimer;
	    document.onkeydown = resetTimer;
	    function doSomething() {
	        $('#popup').modal("show");
	    }
	    function resetTimer() {
	        clearTimeout(time);
	        time = setTimeout(doSomething, 300000);
	    }
	};
	
});

function logout(){
	window.location.replace("logout.jsp");
}

const menuItems = document.querySelectorAll('#nav-barT a[href^="#"]');
const CentralButton = document.querySelectorAll('.carousel-caption a[href^="#"]');
menuItems.forEach(item => {
  item.addEventListener('click', scrollToIdOnClick);
});

CentralButton.forEach(item => {
  item.addEventListener('click', scrollToIdOnClick);
})

function getScrollTopByHref(element) {
  const id = element.getAttribute('href');
  return document.querySelector(id).offsetTop;
}

function scrollToIdOnClick(event) {
  event.preventDefault();
  const to = getScrollTopByHref(event.target) - 80;
  scrollToPosition(to);
}

function scrollToPosition(to) {
    window.scroll({
    top: to,
    behavior: "smooth",
 });
}



