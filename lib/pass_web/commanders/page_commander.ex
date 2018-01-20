defmodule PassWeb.PageCommander do
  use Drab.Commander

    onload :page_loaded
    #onclick :submit_data

    # Drab Callbacks
    def page_loaded(socket) do
      poke socket, welcome_text: "This is User Page"
    end

    # def submit_data(socket) do
    #   poke socket, welcome_text: "This is User Page"
    #   set_prop socket, "div.jumbotron p.lead",
    #     innerHTML: "Please visit server to approve doc."
    # end
end
