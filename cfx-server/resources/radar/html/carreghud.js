$(function() {
    var regContainer = $("#regcontainer");
	
    var carRegLine1 = $(".carRegLine1");
    var carSpeedLine1 = $(".carSpeedLine1");
    var carSpeedLine2 = $(".carSpeedLine2");
	
    window.addEventListener("message", function(event) {
        var item = event.data;
        
        if (item.showreg) {
            regContainer.fadeIn();
            carRegLine1.text(item.carRegLine1);
            carSpeedLine1.text(item.carSpeedLine1)
            carSpeedLine2.text("MPH")
        } else if (item.hidehud) {
            regContainer.fadeOut();
        }
    });
});