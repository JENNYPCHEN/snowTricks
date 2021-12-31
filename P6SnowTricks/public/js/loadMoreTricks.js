
jQuery(document).ready(function(e) {
    $('#js-loadmore-trick').click(function(e){
      e.preventDefault();
      const a = document.querySelector('#a');
      var totalTricks =a.dataset.total;
      var search=a.dataset.search;
      var user=a.dataset.user;
      var row=parseInt(a.dataset.offset);
      var rowperpage =5;
      row+=rowperpage;
      console.log(row);
      if(row <= totalTricks){
        $.ajax({
          url: '/load/more/tricks/'+ row,
          type: 'GET',
          success: function(response){
            var rowno = row + rowperpage;
            if(rowno > totalTricks){
              $('#js-loadmore').hide();
            }else{
              $('#js-loadmore').text("Load more");
              $('#a').data('offset', row); 
              $('#a').attr('data-offset',row); 
            }
            
            let tricks = response;
            for (var i = 0; i < tricks.length; i++) {
      
                $("#loadTricksContainer").append(
                '<div class="col display" >'+
                '<div class="card mb-1">'+
                '<a href="/trick/'+ tricks[i].id +'/'+ tricks[i].slug +'">'+
                '<img class="card-img-top" src="img/image_tricks/'+tricks[i].image+'">'+
                '</a>'+
                '<div class="card-body d-flex justify-content-between"> '+
                '<div>'+'<a href="/trick/'+ tricks[i].id +'/'+ tricks[i].slug +'">'+'<h5 class="card-title">'+tricks[i].name + '</h5></a></div>'+
                (user==true?' <div><a href="/trick/edit-"+'+ tricks[i].id +'"><button class="btn btn-sm btn-outline-secondary m-1"><i class="fas fa-pencil-alt text-right fa-sm"></i></button></a>'+
                '<form method="post" action="trick/delete/' + tricks[i].id +'" onsubmit="return confirm(`Êtes-vous sûr de vouloir supprimer le trick : '+tricks[i].name +'?`)">'+
                '<input type="hidden" name="_token" value="{{ csrf_token("delete"'+ tricks[i].id +') }}">'+
                '<button class="btn btn-sm btn-outline-secondary m-1"><i class="fas fa-trash-alt fa-sm text-right"></i></button></form></div>':'')+
                '</div></div></div>')

            }
          }})}})});
    
    