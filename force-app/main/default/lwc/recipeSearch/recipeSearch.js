import { LightningElement } from 'lwc';
import getRandomReceipe from "@salesforce/apex/Spoonacular.getRandomReceipe";
import getReceipeByIngredients from "@salesforce/apex/Spoonacular.getReceipeByIngredients";
export default class RecipeSearch extends LightningElement {
    recipes = [];
  fetchRandomRecipe() {
    getRandomReceipe()
      .then((data) => {
        this.recipes =
          JSON.parse(data) && JSON.parse(data).recipes
            ? JSON.parse(data).recipes
            : [];
      })
      .catch((error) => {
        console.error(error);
      });
  }

  fetchRecipesByIngredients() {
    const ingredients = this.template.querySelector(".ingredient-input").value;
    getReceipeByIngredients({ ingredients })
      .then((data) => {
        this.recipes = JSON.parse(data);
      })
      .catch((error) => {
        console.error(error);
      });
  }
}