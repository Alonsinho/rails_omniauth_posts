class HomeController < ApplicationController
    before_action :set_graph_and_profile

    def index

        if current_user
            
        else

        end
    end

    def publish 
        #@graph.put_wall_post("Testing a post", {
        #    "name" => "Link name",
        #    "link" => "http://marca.com/",
        #    "caption" => "#{@profile["name"]} created a new post"
        #})
    end

    private

    def set_graph_and_profile
        if current_user
            @graph = Koala::Facebook::API.new(current_user.access_token)
            @profile = @graph.get_object("me")
        end
    end

end