<h1>start match here</h1>

<form method="post" action="/match/create" >
    <select name="player_1">
   <option value ='default'>Select Player 1</option>
      <% @players.each do |player| %>
      <option value = "<%= player.id %>"><%= player.first_name %></option>
    <% end %>
  </select>


    <select name="player_2">
    <option value ='default'>Select Player 2</option>
      <% @players.each do |player| %>
      <option value = "<%= player.id %>"><%= player.first_name %></option>
    <% end %>
  </select>



  <button type="submit" class="btn btn-primary">Start Match</button>
  </form>


<h1 class="text-info">Squasher</h1>

<div class="row top-buffer">


  <div class="col-md-6"><button type="button" class="btn btn-primary btn-lg btn-block">Point for Player 1</button></div>
  <div class="col-md-6"><button type="button" class="btn btn-success btn-lg btn-block">Point for Player 2</button></div>

 

</div>




<p></p>

<table class="table table-bordered">
    <thead>
        <tr>
            <th class="col-md-1">Rally</th>
            <th class="col-md-5">Player 1: Score</th>
            <th class="col-md-6">Player 2: Score</th>
        </tr>
    </thead>
    <tbody>


        <tr>
            <td>1</td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td>2</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>3</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>4</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>5</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>6</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>7</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>8</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>9</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>11</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>12</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>13</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>14</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>15</td>
            <td></td>
            <td></td>
        </tr>
    </tbody>
</table>

<form action="/jhtyhfhygfhg" method="post" onsubmit="return executeOnSubmit();">
<label>Name</label><input type="text" name="name" size="20" id="name" />
<input type="submit" name="submit" value="submit" />
</form>



<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="serve_side_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Select Serve Side</h4>
      </div>
      <div class="modal-body">



 
      <div class="row">
            <button type="button" class="btn btn-info col-sm-4 col-sm-offset-2"> SERVING LEFT</button>
            <button type="button" class="btn btn-warning col-sm-4" >SERVING RIGHT</button>
      </div>
        



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>