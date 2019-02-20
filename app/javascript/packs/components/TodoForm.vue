<template>
  <div>
    <h1 class="todo-add-title">Add a task</h1>
    <input type="text" v-model="newTodoName" class="add-todo-input" placeholder="New task name">
    <select name="priority" v-model="newTodoPriority" class="add-todo-select">
      <option value="low">Low</option>
      <option value="medium">Medium</option>
      <option value="high">High</option>
    </select>
    <button @click="$emit('add-todo', newTodoName, newTodoPriority.charAt(0).toUpperCase() + newTodoPriority.slice(1))" class="btn btn-primary" >Create</button>
  </div>
</template>

<script>
export default {
  name: "TodoForm",
  data() {
    return {
      newTodoName: '',
      newTodoPriority: 'Low'
    }
  }
}

</script>

<style>



</style>
