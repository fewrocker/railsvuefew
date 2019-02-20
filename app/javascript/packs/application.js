import "bootstrap";

import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener("DOMContentLoaded", function(event) {
  const element = document.getElementById("boards")
  const props = JSON.parse(element.getAttribute('data-todos'))

  if (element != null) {
    const app = new Vue({
      el: element,
      data: {
        todos: JSON.parse(element.dataset.todos)
      },
      template: "<App :todos='todos' />",
      components: {
        App
      }
    });
  }
});




