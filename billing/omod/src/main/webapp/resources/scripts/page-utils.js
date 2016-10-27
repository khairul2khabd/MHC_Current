 

BILLING = {
    load: function(url, container)
    {
        jQuery(container).load(url);
    },
  
    submitBillOrder: function() {
        jQuery('#selectedTestId option').each(function(i) {
            jQuery(this).attr("selected", "selected");
        });
        jQuery("#billOrderForm").submit();
    },
    
    submitBillEditForm: function() {
        jQuery('#selectedTestDetails option').each(function(i) {
            jQuery(this).attr("selected", "selected");
        });
        jQuery("#billEditForm").submit();
    },
    
    onChangeTestName: function(container, id, name, price)
    {
        if (container == 'serName') {
            var exists = false;
            jQuery('#selectedTestId option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            if (exists) {
                alert('It\'s existed!');
                return false;
            }
            exists = false;
            jQuery('#availableDiagnosisList option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            jQuery("#serName").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedTestId");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedTestId').append('<option value="' + id + '">' + name + '</option>');
            }
        }
    },
    onChangeTestNameEdit: function(container, id, name)
    {
        if (container == 'addName') {
            var exists = false;
            jQuery('#selectedTestDetails option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            if (exists) {
                alert('It\'s existed!');
                return false;
            }
            exists = false;
            jQuery('#availableDiagnosisList option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            jQuery("#addName").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedTestDetails");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedTestDetails').append('<option value="' + id + '">' + name + '</option>');
            }
        }
    },
    onChangePrice: function(container, id, name, price)
    {
        if (container == 'serPrice') {

            var exists = false;
            jQuery('#selectedPrice option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            if (exists) {
                alert('It\'s existed!');
                return false;
            }
            exists = false;
            jQuery('#availablePriceList option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            jQuery("#serPrice").val("");
            if (exists) {
                jQuery("#availablePriceList option[value=" + id + "]").appendTo("#selectedPrice");
                jQuery("#availablePriceList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedPrice').append('<option value="' + id + '">' + name + '</option>');
                jQuery('#selectedTestPrice').append('<option value="' + price + '">' + price + '</option>');
                jQuery('#price').append(price + "</br>");
            }
        }
    },
    onChangeRadio: function(thiz)
    {
        var text = jQuery(thiz).val();
        if (text != null && text != '' && text == 'admit') {
            jQuery(".tdIpdWard").show();
        } else {
            jQuery(".tdIpdWard").hide();
        }
    },
    backToQueue: function(queueId)
    {
        ACT.go('backToOpdQueue.htm?queueId=' + queueId);
    },
    onClickFollowDate: function(thiz)
    {
        jQuery('input#input_follow').attr('checked', true);
    },
    //////////

    onChangeDocMar: function(container, id, name)
    {
        if (container == 'docIdName') {
            var exists = false;
            jQuery('#selectedDocId option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            exists = false;
            jQuery("#selectedDocId").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedDiagnosisList");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedDocId').append('<option value="' + id + '">' + name + '</option>');
            }
        }
    }
};


