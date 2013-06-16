vote_value = 0
$(document).ready(function() {
  $('.vote').on('click', function(e){
  	e.preventDefault();
  	var url = $(this).parent().attr('action');
  	var vote = $(this).attr('value');
  	var target = $(this).siblings('.count').first();

  	if (vote === 'Nay!'){
  		voteValue = -1;
  	} else if (vote === 'Yay!') {
  		voteValue = 1;
  	}
  	var currCount = target.text();
  	var newCount = parseInt(voteValue) + parseInt(currCount);
  	$.post(url, { "voteValue" : voteValue }, function(response){
  	console.log(response);
  	});
  	target.text(String(newCount));
  	
  });
});
