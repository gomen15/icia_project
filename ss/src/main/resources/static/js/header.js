    document.addEventListener('DOMContentLoaded', function() {
            const menuIcon = document.querySelector('.menu-icon');
            const menuPopup = document.querySelector('.menu-popup');

            menuIcon.addEventListener('click', function(event) {
                if (menuPopup.style.display === 'block') {
                    menuPopup.style.display = 'none';
                } else {
                    menuPopup.style.display = 'block';
                }
                event.stopPropagation();
            });

            menuPopup.addEventListener('click', function(event) {
                event.stopPropagation();
            });

            document.addEventListener('click', function() {
                menuPopup.style.display = 'none';
            });

            menuIcon.addEventListener('mouseleave', function() {
                setTimeout(function() {
                    menuPopup.style.display = 'none';
                }, 5000);
            });
        });