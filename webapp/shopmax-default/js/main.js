(function($) {
        $(document).ready(function() {
        
        $.fn.exists = function(){return this.length>0;}

        $('#slider').anythingSlider({
        autoPlay: true,                 // This turns off the entire FUNCTIONALY, not just if it starts running or not
        startStopped: false,            // If autoPlay is on, this can force it to start stopped
        buildNavigation:false,      // If true, builds a list of anchor links to link to each panel 
        buildStartStop:false, 
        delay: 3000,                    // How long between slide transitions in AutoPlay mode
        animationTime: 700,             // How long the slide transition takes
        hashTags: false,                 // Should links change the hashtag in the URL?
        pauseOnHover:true             // If true, and autoPlay is enabled, the show will pause on hover
        });

        Modernizr.addTest('mediaqueries', Modernizr.mq('all'));
        
        $('.fancylink').fancybox({width:'50%', height:'50%'});

        //$('.chosen').chosen();
        //$("#accountOptions").data("placeholder","Select Frameworks...").chosen();
        $('.chosen').chosen();

        $('.actionable').change(function() {
            location.href=$(this).val();
        });

        function reveal(){ // reveals the hidden ul, used by the countdown script below
            $('#countdown-next-deal').parent('h3').siblings().find('li,.next-deal').css({'opacity':1,'background':'white'});
            $('.next-deal').css({'opacity':1});
            // enable buttons
            $('#countdown-next-deal').parent('h3').siblings().find('button').removeAttr('disabled');
        }

        // For IE8 and earlier version.
        if (!Date.now) {
            Date.now = function() {
            return new Date().valueOf();
            }
        }

        // the date below will obviously need to be taken from the server - see comment below for code ref
        if ($('.countdown').exists()){
            var deflabels = ['Years', 'Months', 'Weeks', 'Days', 'HOURS', 'MIN', 'SEC'];
            var deflayout = '<span class="timer-inner">'+
                '<span class="block"><span class="time-unit">{hl}</span><code><span>{h10}</span><span>{h1}</span><img src="img/1px-line.png" width="54" height="33" alt="" /></code></span>'+
                '<span class="sep">{sep}</span>'+
                '<span class="block"><span class="time-unit">{ml}</span><code><span>{m10}</span><span>{m1}</span><img src="img/1px-line.png" width="54" height="33" alt="" /></code></span>'+
                '<span class="sep">{sep}</span>'+
                '<span class="block"><span class="time-unit">{sl}</span><code><span>{s10}</span><span>{s1}</span><img src="img/1px-line.png" width="54" height="33" alt="" /></code></span>'+
                '</span>'; 
            var defformat = 'H:M:S';
            var start = Date.now();
            var twentySecs = 20000;// milliseconds
            var twoHours = 7200000;
            $('#countdown-time-left').countdown({until: new Date(2013, 1/*zero-based*/, 1), timeSeparator:':',format: defformat, compact: false, layout: deflayout, labels:deflabels});
            $('#countdown-next-deal').countdown({onExpiry:reveal, until: new Date(start+twentySecs), timeSeparator:':',format: defformat, compact: false, layout: deflayout, labels:deflabels});
        }
        // example of server time retrieval from here http://keith-wood.name/countdownRef.html#serverSync

    
        /* star rating */
        if ($('.raty').exists()){
            $('.raty').raty({
                score: function() {
                return $(this).attr('data-rating');
            }
            });
        }
        
        $('.tool-tip').tooltip();

        /*
        var breedte = document.body.clientWidth;
        console.log(breedte);
        */
        

        /* tabs - 
                hide all but the first .tabcontent, change the style of its tab
                on click hide all tabs except the one with the id [link]-tab
                
        */
        $(document).ready(function() {
            if(!$('body').hasClass('help')){
                $('.tabcontent').not('.tabcontent:eq(0)').hide();
                $('.tabnavs li:first-child').addClass('active');
                $('.tabnavs li').css('cursor','pointer');
                $('.tabnavs li').click(function () {
                    var target = $(this).text().replace(/ /g,"-").toLowerCase();
                    //console.log(target);
                    $(this).parents('ul.tabnavs').find('li').removeClass('active');
                    $(this).addClass('active');
                    $('.tabcontent').hide();
                    $('#'+target+'-tab').show();
                });
            }
        });
    });
    })(jQuery);
