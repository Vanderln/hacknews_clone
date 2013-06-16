var checkVote = function(vote){
  if (vote === 'Nay!'){
      return voteValue = -1;
    } else if (vote === 'Yay!') {
      return voteValue = 1;
    }
};

var updatePage = function(response, target, newCount){
  if (response === "true") {
      target.text(String(newCount));
  }
};


$(document).ready(function() {
  $('.vote').on('click', function(e){
  	e.preventDefault();
  	var url = $(this).parent().attr('action');
  	var vote = $(this).attr('value');
  	var target = $(this).siblings('.count').first();
    checkVote(vote);
  	var currCount = target.text();
  	var newCount = parseInt(voteValue) + parseInt(currCount);
  	$.post(url, { "voteValue" : voteValue }, function(response){
      updatePage(response, target, newCount);
  	});
  });

  $('.commentvote').on('click', function(e){
    e.preventDefault();
    var url = $(this).parent().attr('action');
    var vote = $(this).attr('value');
    var target = $(this).siblings('.count').first();
    checkVote(vote);
    var currCount = target.text();
    var newCount = parseInt(voteValue) + parseInt(currCount);
    $.post(url, { "voteValue" : voteValue }, function(response){
      updatePage(response, target, newCount);
    });
  });

});
