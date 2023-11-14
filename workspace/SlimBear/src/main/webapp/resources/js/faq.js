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


document.addEventListener('DOMContentLoaded', function() {
    var links = document.querySelectorAll('.subnavi a');

    links.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            var type = getTypeFromHref(link.getAttribute('href'));
            applyValuesToPage(type);
        });
    });

    function getTypeFromHref(href) {
        var typeStartIndex = href.lastIndexOf('/') + 1;
        var typeEndIndex = href.indexOf('?');
        return href.substring(typeStartIndex, typeEndIndex);
    }

    function applyValuesToPage(type) {
        var inquiryH2 = document.getElementById('inquiryH2');
        if (inquiryH2) {
            switch (type) {
                case '1':
                    inquiryH2.innerHTML = '<font color="333333">' + TYPE_PRODUCT_R + '</font>';
                    break;
                case '2':
                    inquiryH2.innerHTML = '<font color="333333">' + TYPE_DELIVERY_R + '</font>';
                    break;
                case '3':
                    inquiryH2.innerHTML = '<font color="333333">' + TYPE_CHANGE_R + '</font>';
                    break;
                case '4':
                    inquiryH2.innerHTML = '<font color="333333">' + TYPE_ETC_R + '</font>';
                    break;
                case '5':
                    inquiryH2.innerHTML = '<font color="333333">' + TYPE_SHOWROOM_R + '</font>';
                    break;
                default:
                    break;
            }
        }
    }
});


 
 