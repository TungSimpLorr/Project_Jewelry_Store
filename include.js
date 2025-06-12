function loadHTML(selector, filePath) {
    fetch(filePath)
        .then(response => {
            if (!response.ok) throw new Error(`Không thể tải ${filePath}`);
            return response.text();
        })
        .then(html => {
            document.querySelector(selector).innerHTML = html;
        })
        .catch(error => console.error(error));
}



function hienkhoidanhmuc() {
    const khoidanhmuc = document.getElementsByClassName('new-menu-bar')[0];
    if (khoidanhmuc) {
        if (khoidanhmuc.style.display === 'none' || khoidanhmuc.style.display === '') {
            khoidanhmuc.style.display = 'block';
        } else {
            khoidanhmuc.style.display = 'none';
        }
    }
}

function changebanner() {
    const banner = document.getElementsByClassName('boxbanner')[0];
    const sidebar = document.getElementsByClassName('new-menu-bar')[0];
    sidebarnow = sidebar.style.display;

    if (sidebarnow) {
        if (sidebarnow.style.display === 'none') {
            banner.style.width = '100%';
        } else {
            banner.style.width = '70%';
        }
    }
}

// mo danh muc san pham
$(document).ready(function() {


    // an danh muc san pham 
    $('.box-content-new-bar').hide();
   
    $('#cart-list-icon').click(function(e){
        e.preventDefault();
        $('.box-content-new-bar').slideToggle(300);
    });
    

});

