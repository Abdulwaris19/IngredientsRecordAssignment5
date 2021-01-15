using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UBIT.data.Helpers
{
  public  class IngredientsHelper
    {
        public void Insert(string Ingredients_Name, string Dish_type,
         int No_of_Ingredients, string Ingredients_List)
        {

            IngredientsRecord _ingredients_records = new IngredientsRecord();
            _ingredients_records.Name = Ingredients_Name;
            _ingredients_records.Dish_type = Dish_type;
            _ingredients_records.No_of_Ingredients = No_of_Ingredients;
            _ingredients_records.Ingredients = Ingredients_List;

            var db = new IngredientsDataEntities();
            db.IngredientsRecords.Add(_ingredients_records);
            db.SaveChanges();
            db.Dispose();
        }
        public List<IngredientsRecord> GetIngredients()
        {
            var db = new IngredientsDataEntities();
            var ingredientsList = db.IngredientsRecords.ToList();       
            db.Dispose();
            return ingredientsList;


        }
    }
}
