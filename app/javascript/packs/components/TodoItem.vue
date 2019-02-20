<template>
  <div>
    <div class="todo-item-div" v-bind:class="{ 'todo-done':todo.done, 'todo-notdone': !todo.done }">
      <input type="checkbox" v-on:change="markComplete" class="checkbox-icon" :checked="todo.done" @click="$emit('change-todo', todo.id, todo.done)">
      <span class="name">{{todo.name}}</span>
      <span class="priority">{{todo.priority}}</span>
      <i class="fas fa-trash-alt" @click="$emit('del-todo', todo.id)"></i>
    </div>
  </div>
</template>

<script>
export default {
  name:"TodoItem",
  props: ["todo"],
  methods: {
    markComplete() {
      this.todo.done = !this.todo.done
    }
  },
}

</script>

<style scoped>

</style>
