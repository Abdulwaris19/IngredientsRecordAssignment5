using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using UBIT.data.Helpers;
namespace IngredientsRecordIPT
{
    public partial class IngredientsWebForm : System.Web.UI.Page
    {
        static IngredientsHelper ingredients;
        protected void Page_Load(object sender, EventArgs e)
        {
            ingredients = new IngredientsHelper();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat=ResponseFormat.Json,UseHttpGet =true)]
        public static void AddIngredients()
        {
            var _ingredientsListStr = HttpContext.Current.Request["request"];
            var _ingredientsList = JsonConvert.DeserializeObject<IngredientsList>(_ingredientsListStr);
            ingredients.Insert(_ingredientsList.name,
             _ingredientsList.dishtype, _ingredientsList.nofIngredients, _ingredientsList.ingrdientsList);
     
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public static string GetIngredients()
        {
            var IngredientsRecords = ingredients.GetIngredients();
            var IngredientsallRecordsStr = JsonConvert.SerializeObject(IngredientsRecords);
            return IngredientsallRecordsStr;
        }
        public class IngredientsList
        {
           
            public string name { get; set; }
            public string dishtype { get; set; }
            public int nofIngredients { get; set; }
            public string ingrdientsList { get; set; }
        }
    }
}