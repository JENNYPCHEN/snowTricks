
jQuery(document).ready(function(e) {
    $('#js-loadmore').click(function(e){
      e.preventDefault();
      const a = document.querySelector('#a');
      var totalComments =a.dataset.total;
      var trickId=a.dataset.trick;
      var rowperpage = 5;
      var row=0;
      row+=rowperpage;
      if(row <= totalComments){
        $.ajax({
          url: '/load/more/comments/'+ trickId,
          type: 'GET',
          data: {row:row},
          success: function(response){
            var rowno = row + rowperpage;
            if(rowno > totalComments){
              $('#js-loadmore').hide();
            }else{
              $('#js-loadmore').text("Load more");
            }
            $("#loadCommentsContainer").html("");
            let comments = response;
            for (var i = 0; i < comments.length; i++) {
          
              let eachComment=
              '<div class="displayComments">'+
              '<div class=" row d-flex justify-content-center ">'+
              '<div class="col-md-1 col-2">'+
              '<img src="/img/image_profiles/'+ comments[i].userImage+ '" class="avatar text-right">'+
              '</div>'+
              '<div class="col-md-5 col-8">'+
              '<div class=" bg-light px-2 p-1" style="border-radius: 10px;">'+
              '<h6>'+comments[i].userName+'</h6>'+
              '<p style="font-size: 13px;">'+comments[i].message+'</p>'+
              '</div>'+
              '<p class="mb-2 px-2 mb-1"style="font-size: 13px;">'+(comments[i].createDate.date).substring(0,19)+'</p>'+
              '</div>'+
              '</div>';
              $("#loadCommentsContainer").append(eachComment);
            }
          }})}})});
    
    