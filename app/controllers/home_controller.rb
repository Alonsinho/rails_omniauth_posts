class HomeController < ApplicationController
    before_action :set_graph_and_profile

    def index

        if current_user
            pages = @graph.get_object("me/accounts")

            # Post plain text in a page
            #koala_page = Koala::Facebook::API.new(pages[0]["access_token"])
            #koala_page.put_connections("me", "feed", {
            #    message: "Hello #{profile["name"]}'s page!"
            #    # picture: image_url # Doesn't work
            #})

            # Post image with some text
            #koala_page.put_picture("https://ca-times.brightspotcdn.com/dims4/default/70ac5f5/2147483647/strip/true/crop/1043x698+0+0/resize/840x562!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F1d%2F6e%2F5a7b354b4dbeb25d3c71146f908b%2Fbale-juega-golf-mientras-elimi-1163863.JPG", {
            #    message: "Posting an image with text"
            #})
            
                
            # Post in user wall
            #@graph.put_connections("me", "feed", {
            #    :message => "Hello #{profile["name"]}'s posts wall"
            #})
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
        end
    end

end