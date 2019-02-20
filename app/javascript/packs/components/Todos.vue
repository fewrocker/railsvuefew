<template>
  <div>
      <h1 class="todo-title">Todo list</h1>

      <div v-for="todo in todos" class="todo-item">
        <TodoItem v-bind:todo="todo" v-on:del-todo="$emit('del-todo', todo.id)" v-on:change-todo="$emit('change-todo', todo.id, todo.done)" />
      </div>
  </div>
</template>

<script>
import TodoItem from './TodoItem.vue'

export default {
  name: "Todos",
  props: ["todos"],
  components: {
    TodoItem
  }
}

</script>

<style>

  .todo-title {
    font-size: 30px;
    color: rgba(80,80,80,1);
    margin-bottom: 30px;
  }

</style>
