
function val() {
    $(document).ready(function () {       
        $('asp:Button').click(function () {
            debugger;
            if ($(this).prop("checked") == true) {
                alert("Checkbox is checked.");
            }
            else if ($(this).prop("checked") == false) {
                alert("Checkbox is unchecked.");
            }
        });
    });
}