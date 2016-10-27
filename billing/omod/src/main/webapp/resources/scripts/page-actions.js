/**
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Patient-dashboard module.
 *
 *  Patient-dashboard module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 
 *  Patient-dashboard module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Patient-dashboard module.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

var EVT =
        {
            ready: function()
            {
                /**
                 * Page Actions
                 */
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
            billOrderPage: function() {

                var validator = jQuery("#billOrderForm").validate(
                        {
                            event: "blur",
                            rules:
                                    {
                                        "selectedTestId": {required: true}
                                    }
                        });

                // Bill Order Page

                jQuery("#serName").autocomplete('autoCompleteTest.htm', {
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
                    BILLING.onChangeTestName('serName', item.value, item.text, item.text1);
                });
                jQuery('.date-pick').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, minDate: '0'});
                //jQuery('#diagnosisList').listnav();
            }
        };
/**
 * Pageload actions trigger
 */
/*
 Bill Edit Service add
 */

////// End //////////////

var KHA =
        {
            ready: function()
            {
                /**
                 * Page Actions
                 */
                var enableCheck = true;
                var pageId = jQuery("#pageId").val();
                if (enableCheck && pageId != undefined && eval("CHECK1." + pageId))
                {
                    eval("CHECK1." + pageId + "()");
                }

                if (jQuery.browser.msie)
                {
                    jQuery.ajaxSetup({cache: false});
                }

            }
        };

var CHECK1 =
        {
            billOrderDetailsPage: function() {

                jQuery("#dTime").autocomplete('autoCompleteTime.htm', {
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
                });
                jQuery('.date-pick').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, minDate: '0'});
                //jQuery('#diagnosisList').listnav();
            }
        };

// new 
var KHA1 =
        {
            ready: function()
            {
                var enableCheck = true;
                var pageId = jQuery("#pageId").val();
                if (enableCheck && pageId != undefined && eval("CHECK2." + pageId))
                {
                    eval("CHECK2." + pageId + "()");
                }
                if (jQuery.browser.msie)
                {
                    jQuery.ajaxSetup({cache: false});
                }
            }
        };

var CKECK2 =
        {
            billSearchPage: function() {

                jQuery("#serPrice").autocomplete('autoCompletePrice.htm', {
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
                });
                jQuery('.date-pick').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, minDate: '0'});
                //jQuery('#diagnosisList').listnav();
            }
        };

var BSEARCH =
        {
            ready: function()
            {
                var enableCheck = true;
                var pageId = jQuery("#pageId").val();
                if (enableCheck && pageId != undefined && eval("CHECK2." + pageId))
                {
                    eval("CHECK2." + pageId + "()");
                }
                if (jQuery.browser.msie)
                {
                    jQuery.ajaxSetup({cache: false});
                }
            }
        };

var CHECK2 =
        {
            billSearchPage: function() {

                // Bill Order Page
                jQuery("#serPrice").autocomplete('autoCompletePrice.htm', {
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
                    BILLING.onChangePrice('serPrice', item.value, item.text, item.text1);
                });

            }
        };

var DOCSEARCH =
        {
            ready: function()
            {
                var enableCheck = true;
                var pageId = jQuery("#pageId").val();
                if (enableCheck && pageId != undefined && eval("CHECK3." + pageId))
                {
                    eval("CHECK3." + pageId + "()");
                }
                if (jQuery.browser.msie)
                {
                    jQuery.ajaxSetup({cache: false});
                }
            }
        };

var CHECK3 =
        {
            commissionCalPage: function() {

                // Bill Order Page
                jQuery("#docIdName").autocomplete('autoCompleteDoc.htm', {
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
                    BILLING.onChangeDocMar('docIdName', item.value, item.text);
                });
            }
        };

///////// 
var RMPSEARCH =
        {
            ready: function()
            {
                var enableCheck = true;
                var pageId = jQuery("#pageId").val();
                if (enableCheck && pageId != undefined && eval("CHECK4." + pageId))
                {
                    eval("CHECK4." + pageId + "()");
                }
                if (jQuery.browser.msie)
                {
                    jQuery.ajaxSetup({cache: false});
                }
            }
        };

var CHECK4 =
        {
            commissionCalPageRmp: function() {

                // Bill Order Page
                jQuery("#rmpIdName").autocomplete('autoCompleteRmp.htm', {
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
                    BILLING.onChangeDocMar('docIdName', item.value, item.text);
                });
            }
        };

////////

jQuery(document).ready(
        function()
        {
            EVT.ready();
            KHA.ready();
            KHA1.ready();
            DOCSEARCH.ready();
            RMPSEARCH.ready();
        }
);
