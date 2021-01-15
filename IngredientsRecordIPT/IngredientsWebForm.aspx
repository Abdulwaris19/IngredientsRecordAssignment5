<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngredientsWebForm.aspx.cs" Inherits="IngredientsRecordIPT.IngredientsWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body >
    <form id="form2" runat="server">
        <div>
            <table>
                <tbody>
                    <tr>  <td>Name: </td>      <td ><input id="Ingredients_Name"/></td>  </tr>
                    <tr>  <td>Food Type: </td> <td><input  id="Dish_Type" /></td>           </tr>
                    <tr>  <td>Number of Ingredients:</td>  <td ><input id="No_of_Ingredients" /></td>  </tr>
                    <tr>  <td>Ingredient: </td> <td "><textarea id="Ingredients_List" style="width:250px;height:100px;"></textarea></td></tr>
                     </tbody>
            </table>
       </div>
        <h3 onclick="AddIngredients()">Submit</h3>
    </form>

        <div>
            <h2 style="text-align:center">Ingredients Record</h2>
   <table border="1" style="width:100%">
       <thead>
           <tr>
               <th style="width:15%">
                   Name
               </th>
               <th style="width:15%">
                   Type
               </th>
               <th style="width:15%">
                   No of Ingrdients
               </th>
               <th style="width:15%">
                   <a>Ingredients</a>
               </th>
           </tr>
       </thead>
       <tbody id="inputTable">
       </tbody>
   </table>
    </div>
</body>
</html>
<script src="js/jquery-1.10.2.js"></script>
  <script type="text/javascript">
      window.onload=UIPopulate()
      function UIPopulate() {
          $.ajax({
              method: 'Get',
              url: '/IngredientsWebForm.aspx/GetIngredients',
              dataType: 'json',
              contentType: 'application/JSON',
              success: function (result) {
                  var IngredientStr = result["d"]
                  var Ingredient = JSON.parse(IngredientStr)
                  console.log(Ingredient[0])
                  var count = Object.keys(Ingredient).length;
                  var h = '';
                  for (i = 0; i < count; i++) {
                    
                   
                      h += '<tr>';

                      h += '<td style="width:15%; text-align:center">';
                      h += Ingredient[i]["Name"];
                      h += '</td>';

                      h += '<td style="width:15%; text-align:center">';
                      h += Ingredient[i]["Dish_type"];
                      h += '</td>';

                      h += '<td style="width:15%; text-align:center">';
                      h += Ingredient[i]["No_of_Ingredients"];
                      h += '</td>';

                      h += '<td style="width:15%; text-align:center">';
                      h += Ingredient[i]["Ingredients"];
                      h += '</td>';


                      h += '</tr>';


                     


                  }
                  $('#inputTable').html(h);
              }

          })
          
          
        }
       
      
    function AddIngredients() {
        var Name = $('#Ingredients_Name').val();
        var DishType= $('#Dish_Type').val();
        var NofIngredients = $('#No_of_Ingredients').val();
        var IngrdientsList = $('#Ingredients_List').val();

        var IngredientsRecord = new Object();
        IngredientsRecord.name = Name;
        IngredientsRecord.dishtype = DishType;
        IngredientsRecord.nofIngredients = NofIngredients;
        IngredientsRecord.ingrdientsList = IngrdientsList;

        console.log(IngredientsRecord);
        var IngredientsRecordStr = JSON.stringify(IngredientsRecord);
        $.ajax({
            method: 'Get',
            url: '/IngredientsWebForm.aspx/AddIngredients',
            dataType: 'json',
            contentType: 'application/JSON',
            data: {

                request: IngredientsRecordStr
            },
            success: function (result) {
                UIPopulate()
               
            }
            
        })
    }
</script>
