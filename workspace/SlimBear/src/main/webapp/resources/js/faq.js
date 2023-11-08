$(function() {
	var hrefCate = location.href;

	if (hrefCate.indexOf('/1/') != -1) {
		$('.navi01').addClass("on");
	}
	;

	if (hrefCate.indexOf('company.html') != -1) {
		$('.navi00').addClass("on");
	}
	;

	if (hrefCate.indexOf('/2/') != -1) {
		$('.navi03').addClass("on");
	}
	;

	if (hrefCate.indexOf('/4/') != -1) {
		$('.navi04').addClass("on");
	}
	;

	if (hrefCate.indexOf('/board/index.html') != -1) {
		$('.navi05').addClass("on");
	}
	;
});
 
const toggleButtons = document.querySelectorAll(".toggle-button");
toggleButtons.forEach(button => {
    button.addEventListener("click", () => {
        const contentViewRow = button.closest("tr").nextElementSibling;
        const toggleIcon = button.querySelector(".toggle-icon");

        if (contentViewRow.style.display === "none") {
            contentViewRow.style.display = "table-row";
            toggleIcon.classList.add("expanded");
        } else {
            contentViewRow.style.display = "none";
            toggleIcon.classList.remove("expanded");
        }
    });
});



 
 