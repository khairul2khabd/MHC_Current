/**
 
 */

REGISTRATION = {
    load: function(url, container)
    {
        jQuery(container).load(url);
    },
    onChangeDocMar: function(container, id, name)
    {
        if (container == 'docInfo') {

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

        if (container == 'marName') {

            var exists = false;
            jQuery('#selectedMarId option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });

            exists = false;

            jQuery("#selectedMarId").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedDiagnosisList");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedMarId').append('<option value="' + id + '">' + name + '</option>');

            }
        }
        
        if (container == 'rmpName') {

            var exists = false;
            jQuery('#selectedRmpId option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });

            exists = false;

            jQuery("#selectedRmpId").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedDiagnosisList");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedRmpId').append('<option value="' + id + '">' + name + '</option>');

            }
        }

    },
};

  