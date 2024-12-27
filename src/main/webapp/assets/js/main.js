(function($) {
    "use strict";


    new WOW().init();

    $(window).on('load', function() {
        dataBackgroundImage();
    });

    /*--
        Data Background Image 
    -----------------------------------*/
    function dataBackgroundImage() {
        $('[data-bgimage]').each(function() {
            var bgImageUrl = $(this).data('bgimage');
            $(this).css({
                'background-image': 'url(' + bgImageUrl + ')',
            });
        });
    }
    /*--
        Menu Sticky
    -----------------------------------*/
    var windows = $(window);
    var sticky = $('.header-sticky');

    windows.on('scroll', function() {
        var scroll = windows.scrollTop();
        if (scroll < 300) {
            sticky.removeClass('is-sticky');
        } else {
            sticky.addClass('is-sticky');
        }
    });

    /*--
        Header Search 
    -----------------------------------*/
    var $headerSearchToggle = $('.header-search-toggle');
    var $headerSearchForm = $('.header-search-form');

    $headerSearchToggle.on('click', function() {
        var $this = $(this);
        if (!$this.hasClass('open')) {
            $this.addClass('open').find('i').removeClass('zmdi zmdi-search').addClass('zmdi zmdi-close');
            $headerSearchForm.slideDown();
        } else {
            $this.removeClass('open').find('i').removeClass('zmdi zmdi-close').addClass('zmdi zmdi-search');
            $headerSearchForm.slideUp();
        }
    });

    /*--
        Mobile Menu
    ------------------------*/
    var menuNav = $('nav.main-navigation');
    menuNav.meanmenu({
        meanScreenWidth: '991',
        meanMenuContainer: '.mobile-menu',
        meanMenuClose: '<span class="menu-close"></span>',
        meanMenuOpen: '<span class="menu-bar"></span>',
        meanRevealPosition: 'right',
        meanMenuCloseSize: '0',
    });

    /*--
        Hero Slider Active
    ---------------------------*/

    var heroSliderActive = $('.hero-slider-active');
    heroSliderActive.owlCarousel({
        items: 1,
        loop: true,
        nav: true,
        dots: false,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        navText: ['', '']
    });

    // slider Image SRC
    var itemBg = $('.itemBg');
    $('.hero-slider-active .singleSlide').each(function() {
        var itmeImg = $(this).find('.itemBg img').attr('src');
        $(this).css({
            background: 'url(' + itmeImg + ')'
        });
    });

    // Next Prev Image Active Botton
    function mySlideFunc() {
        $('.hero-slider-active .owl-item').removeClass('next prev');
        var activeSlide = $('.hero-slider-active .owl-item.active');
        activeSlide.next('.owl-item').addClass('next');
        activeSlide.prev('.owl-item').addClass('prev');

        var nextSlideImg = $('.owl-item.next').find('.itemBg img').attr('src');
        var prevSlideImg = $('.owl-item.prev').find('.itemBg img').attr('src');

        $('.hero-slider-active .owl-nav .owl-prev').css({
            background: 'url(' + prevSlideImg + ')'
        })

        $('.hero-slider-active .owl-nav .owl-next').css({
            background: 'url(' + nextSlideImg + ')'
        })
    }
    mySlideFunc();
    $(".hero-slider-active").on('translated.owl.carousel', function() {
        mySlideFunc();
    });

    /*--
        Testimonial Active
    ---------------------------*/
    var testimonialActive = $('.testimonial-active');
    testimonialActive.owlCarousel({
        items: 1,
        loop: true,
        nav: false,
        dots: true,
        navText: ['', '']
    });

    /*--
        Testimonial Active
    ---------------------------*/
    var coursesActive = $('.courses-tab-active');
    coursesActive.owlCarousel({
        items: 4,
        loop: true,
        nav: true,
        dots: false,
        margin: 30,
        navText: ['<i class="zmdi zmdi-chevron-left"></i>', '<i class="zmdi zmdi-chevron-right"></i>'],
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            768: {
                items: 2
            },
            800: {
                items: 3
            },
            1000: {
                items: 3
            },
            1600: {
                items: 4
            }
        }
    });

    /*------- 
        Testimonial Slider Active 
    ----------------------------------*/
    $('.testimonial-slider-2').owlCarousel({
        smartSpeed: 1000,
        nav: false,
        dots: false,
        navText: ['<span class="fs1" data-icon="&#x34;"></span>', '<span class="fs1" data-icon="&#x35;"></span>'],
        responsive: {
            0: {
                items: 1
            },
            480: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    })

    /* Product Detals Color */
    $('.product-color ul li').on('click', function() {
        $(this).addClass('checked').siblings().removeClass('checked');
    });
    /*--
        showlogin toggle function
    --------------------------*/
    $('#showlogin').on('click', function() {
        $('#checkout-login').slideToggle(500);
    });

    /*--
        showcoupon toggle function
    --------------------------*/
    $('#showcoupon').on('click', function() {
        $('#checkout-coupon').slideToggle(500);
    });

    /*--
        Checkout 
    --------------------------*/
    $("#chekout-box").on("change", function() {
        $(".account-create").slideToggle("100");
    });

    /*-- 
        Checkout 
    ---------------------------*/
    $("#chekout-box-2").on("change", function() {
        $(".ship-box-info").slideToggle("100");
    });
    /*--
    Magnific Popup
    ------------------------*/
    $('.img-popup').magnificPopup({
        type: 'image',
        gallery: {
            enabled: true
        }
    });
    // Magnific Popup Video
    $('.popup-youtube').magnificPopup({
        type: 'iframe',
        removalDelay: 300,
        mainClass: 'mfp-fade'
    });

    /* ---
       payment-accordion
    * --------------------------------*/
    $(".payment-accordion").collapse({
        accordion: true,
        open: function() {
            this.slideDown(550);
        },
        close: function() {
            this.slideUp(550);
        }
    });

    /*--------------------------
        Counter Up
    ---------------------------- */
    $('.counter-active').counterUp({
        delay: 70,
        time: 5000
    });


    /*---------------------------
        Fancybox Active
    ------------------------------- */
    $('[data-fancybox="images"]').fancybox({
        hash: false,
    });



    /*=============  Gallery Mesonry Activation  ==============*/
    $('.masonry__wrap').imagesLoaded(function() {

        // filter items on button click
        $('.gallery__menu').on('click', 'button', function() {
            var filterValue = $(this).attr('data-filter');
            $grid.isotope({
                filter: filterValue
            });
        });

        // change is-checked class on buttons
        $('.gallery__menu button').on('click', function() {
            $('.gallery__menu button').removeClass('is-checked');
            $(this).addClass('is-checked');
            var selector = $(this).attr('data-filter');
            $containerpage.isotope({
                filter: selector
            });
            return false;
        });

        // init Isotope
        var $grid = $('.masonry__wrap').isotope({
            itemSelector: '.gallery__item',
            percentPosition: true,
            transitionDuration: '0.7s',
            layoutMode: 'fitRows',
            masonry: {
                // use outer width of grid-sizer for columnWidth
                columnWidth: '.gallery__item',
            }
        });
    });




    /*--
        ScrollUp Active
    ------------------------*/
    $.scrollUp({
        scrollText: '<i class="zmdi zmdi-long-arrow-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
    });

})(jQuery);