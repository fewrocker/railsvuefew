<template>
  <section id="app">

    <Todos v-bind:todos="todos" v-on:del-todo="deleteTodo" v-on:change-todo="changeTodo"/>

    <TodoForm v-on:add-todo="addTodo"/>


  </section>
</template>

<script>

import Todos from './packs/components/Todos'
import TodoForm from './packs/components/TodoForm.vue'

export default {
  props: ['todos'],
  components: {
    Todos,
    TodoForm
  },
  methods: {
    deleteTodo(id) {
      const url = `http://localhost:3000/api/v1/todos/${id}`

      this.todos = this.todos.filter(todo => todo.id !== id)

      axios.delete(url);
    },

    changeTodo(id, status) {
      axios({
        method:'patch',
        url:`http://localhost:3000/api/v1/todos/${id}`,
        data: {
          done: !status
        },
        responseType:'stream'
      })
    },

    addTodo(name, priority) {
      console.log(this.newTodoName)
      axios({
        method:'post',
        url:`http://localhost:3000/api/v1/todos/`,
        data: {
          name: name,
          priority: priority
        },
        responseType:'stream'
      })
      .then(res => this.todos = [...this.todos, res.data])
      .catch(err => console.log(err))
    },

    definePriority() {
      console.log(event.target.value)
    }


  },
  data() {
    return {

    }
  }
}
</script>

