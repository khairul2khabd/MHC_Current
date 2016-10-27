/**
 
 */

var EVT =
        {
            ready: function()
            {
                var enableCheck = true;
                var pageId = jQuery("#pageId").val();
                if (enableCheck && pageId != undefined && eval("CHECK." + pageId))
                {
                    eval("CHECK." + pageId + "()");
                }
                if (jQuery.browser.msie)
                {
                    jQuery.ajaxSetup({cache: false});
                }

            }
        };

var CHECK =
        {
            patientRegistration: function()
            {
                jQuery("#marName").autocomplete('autoCompleteMarName.htm', {
                    delay: 100,
                    scroll: true,
                    parse: function(xml) {
                        var results = [];
                        $(xml).find('item').each(function() {
                            var text = $.trim($(this).find('text').text());
                            var value = $.trim($(this).find('value').text());
                            results[results.length] = {'data': {text: text, value: value},
                                'result': text, 'value': value
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
                    REGISTRATION.onChangeDocMar('marName', item.value, item.text);
                });

                /////

                jQuery("#docInfo").autocomplete('autoCompleteDoctorNameById.htm', {
                    delay: 100,
                    scroll: true,
                    parse: function(xml) {
                        var results = [];
                        $(xml).find('item').each(function() {
                            var text = $.trim($(this).find('text').text());
                            var value = $.trim($(this).find('value').text());
                            results[results.length] = {'data': {text: text, value: value},
                                'result': text, 'value': value
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
                    REGISTRATION.onChangeDocMar('docInfo', item.value, item.text);
                });
                
                jQuery("#rmpName").autocomplete('autoCompleteRmpName.htm', {
                    delay: 100,
                    scroll: true,
                    parse: function(xml) {
                        var results = [];
                        $(xml).find('item').each(function() {
                            var text = $.trim($(this).find('text').text());
                            var value = $.trim($(this).find('value').text());
                            results[results.length] = {'data': {text: text, value: value},
                                'result': text, 'value': value
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
                    REGISTRATION.onChangeDocMar('rmpName', item.value, item.text);
                });

                jQuery('.date-pick').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, minDate: '0'});
            },
        };
jQuery(document).ready(
        function()
        {
            EVT.ready();
        }
);



