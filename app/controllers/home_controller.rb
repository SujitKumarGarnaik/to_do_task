class HomeController < ApplicationController
  def header
    render plain: "Welcome to the To-Do List App!"
  end
end
