$(document).ready(function() {
   $('.arrow').click(function(event){
    var tar = $(event.target)
      var id = tar.data('id')

      $.post('/add_post_vote', {id:id}, function(votes){
          tar.html(votes)
      })
   })
});
