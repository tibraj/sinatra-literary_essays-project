class LiteraryEssaysController < ApplicationController

    get "/literary_essays/new" do 
      erb :'/literary_essays/new'
    end 

    post '/literary_essays' do 
        if !logged_in? 
            redirect '/'
        end 
        if params[:title] != "" && params[:content] != ""
            @literary_essay = LiteraryEssay.create(title: params[:title], content: params[:content], user_id: current_user.id)
            redirect "/literary_essays/#{@literary_essay.id}"
        else 
            redirect '/literary_essays/new'
        end
    end 

    get '/literary_essays/:id' do 
        @literary_essay = LiteraryEssay.find(params[:id])
        erb :'/literary_essays/show'
    end 

end 