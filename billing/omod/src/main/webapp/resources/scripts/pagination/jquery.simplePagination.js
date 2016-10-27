/**
 * jquery.simplePagination.js
 * @version: v1.0.0
 * @author: Sebastian Marulanda http://marulanda.me
 * @see: https://github.com/smarulanda/jquery.simplePagination
 */

(function($) {

    $.fn.simplePagination = function(options) {

        var defaults = {
            perPage: 10,
            containerClass: '',
            previousButtonClass: '',
            nextButtonClass: '',
            previousButtonText: 'Previous',
            nextButtonText: 'Next',
            currentPage: 1
        };

        var settings = $.extend({}, defaults, options);

        return this.each(function() {
            var $rows = $('tbody tr', this);
            var pages = Math.ceil($rows.length / settings.perPage);

            var container = document.createElement('div');
            var bPrevious = document.createElement('span');
            var bNext = document.createElement('span');
            var of = document.createElement('span');
            var cp = document.createElement('span');
            var txt = document.createElement('span');

            var tp = document.createElement('span');

            bPrevious.innerHTML = settings.previousButtonText;
            bNext.innerHTML = settings.nextButtonText;

            container.className = settings.containerClass;
            bPrevious.className = settings.previousButtonClass;
            bNext.className = settings.nextButtonClass;

            bPrevious.style.marginRight = '8px';
            bNext.style.marginLeft = '8px';

            cp.style.fontSize = '20px';
            cp.style.color = 'blue';
            cp.style.fontWeight = 'bold';

            tp.style.fontSize = '20px';
            tp.style.color = 'green';
            tp.style.fontWeight = 'bold';


            container.style.textAlign = "right";
            container.style.marginBottom = '20px';
            container.style.marginTop = '20px';

            container.appendChild(bPrevious);
            container.appendChild(of);
            container.appendChild(cp);
            container.appendChild(txt);

            container.appendChild(tp);
            container.appendChild(bNext);

            $(this).after(container);

            update();

            $(bNext).click(function() {
                if (settings.currentPage + 1 > pages) {
                    settings.currentPage = pages;
                } else {
                    settings.currentPage++;
                }

                update();
            });

            $(bPrevious).click(function() {
                if (settings.currentPage - 1 < 1) {
                    settings.currentPage = 1;
                } else {
                    settings.currentPage--;
                }

                update();
            });


            function update() {
                var from = ((settings.currentPage - 1) * settings.perPage) + 1;
                var to = from + settings.perPage - 1;

                if (to > $rows.length) {
                    to = $rows.length;
                }

                $rows.hide();
                $rows.slice((from - 1), to).show();

                var curPage = settings.currentPage;



                //  of.innerHTML = from + ' to ' + to + ' of ' + $rows.length + ' entries'+ 'Total Pages'+ pages +'Current Pages'+settings.currentPage ;
                //of.innerHTML =  'Page Showing '+ curPage +'&nbsp;&nbsp;&nbsp;' +'|| &nbsp; '+ ' Total Pages ' + pages ;

                of.innerHTML = 'Page Showing ';
                cp.innerHTML = curPage + '&nbsp;&nbsp;';
                txt.innerHTML = '|| &nbsp; Total Pages  ';
                tp.innerHTML = pages;


                if ($rows.length <= settings.perPage) {
                    $(container).hide();
                } else {
                    $(container).show();
                }
            }
        });

    }

}(jQuery));


