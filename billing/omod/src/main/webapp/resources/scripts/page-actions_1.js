

var E =
        {
            ready: function()
            {
                var enableCheck = true;
                var pageId = jQuery("#pageId").val();
                if (enableCheck && pageId != undefined && eval("C." + pageId))
                {
                    eval("C." + pageId + "()");
                }
                if (jQuery.browser.msie)
                {
                    jQuery.ajaxSetup({cache: false});
                }

            }
        };

var C =
        {
            billEditPage: function() {
                var validator = jQuery("#billEditForm").validate(
                        {
                            event: "blur",
                            rules:
                                    {
                                        "selectedTestDetails": {required: true}
                                    }
                        });

                jQuery("#addName").autocomplete('autoCompleteTest.htm', {
                    delay: 100,
                    scroll: true,
                    parse: function(xml) {
                        var results = [];
                        $(xml).find('item').each(function() {
                            var text = $.trim($(this).find('text').text());
                            var text1 = $.trim($(this).find('text1').text());
                            var value = $.trim($(this).find('value').text());
                            results[results.length] = {'data': {text: text, text1: text1, value: value},
                                'result': text, 'result': text1, 'value': value
                            };
                        });
                        return results;

                    },
                    formatItem: function(data) {
                        return data.text;
                    },
                    formatResult: function(data) {
                        return data.text;
                    }

                }).result(function(event, item) {
                    BILLING.onChangeTestNameEdit('addName', item.value, item.text, item.text1);
                });
            }
        };

////////////////////////

jQuery(document).ready(
        function()
        {
            E.ready();

        }
);
