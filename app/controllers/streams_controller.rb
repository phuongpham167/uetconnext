class StreamsController < ApplicationController
    before_action :config_opentok,:except => [:index]
    def index
      @streams = Stream.all
      @new_stream = Stream.new
    end
  
    def create
        session = session = @opentok.create_session
        params[:stream][:session_id] = session.session_id
        @new_stream = current_user.streams.build(stream_params)
        # @new_post.session_id = session.session_id
  
      respond_to do |format|
        if @new_stream.save
          format.html { redirect_to("/streams/"+@new_stream.id.to_s) }
        else
          format.html { render :controller => 'rooms',
            :action => "index" }
        end
      end
    end

    def destroy
      @stream = Stream.find_by id: params[:id]
      if @stream.destroy
         redirect_to root_path
      else
        redirect_to root_path
      end
    end

    def show 
      @stream = Stream.find_by id: params[:id]
      @tok_token = @opentok.generate_token(@stream.session_id)
    end

    private
    def config_opentok
      if @opentok.nil?
       @opentok = OpenTok::OpenTok.new("46236752", "bbb800d7c2ee9486b32ff174ed0996fb96feadf3")
      end
    end
  
    def stream_params
      params.require(:stream).permit(:title,:session_id)
    end
  end
  