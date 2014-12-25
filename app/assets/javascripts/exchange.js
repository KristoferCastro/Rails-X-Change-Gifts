$(function(){
	$(".gift-image").click(function(event){
			event.preventDefault();
			$(this).find(".gift-id").removeClass("hide");
			
			var message = this.dataset.message
			var giftNumber = this.dataset.gift
			var name = this.dataset.name
			
			if ( message.length == 0 ){
				message = "Left no message for you " + name + "..."
				message += " just get your gift: #" +giftNumber
			}else{
				message += "... (Take your gift: #" + giftNumber + ")"
			}
			$(".gift-message-row").hide().html(message).fadeIn(2400);
			
			$(".next-announcer").html("From Santa...");
	});
});