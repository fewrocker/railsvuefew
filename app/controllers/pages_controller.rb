class PagesController < ApplicationController
  def home
    @todos = Todo.order('created_at ASC')
  end

  def test

  end
end
