class LiteraryEssaysController < ApplicationController

    get '/literary_essays' do
        @literary_essays = LiteraryEssay.all 
        erb :'/literary_essays/index'
    end 
    
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
        set_literary_essay
        erb :'/literary_essays/show'
    end 

    get '/literary_essays/:id/edit' do
        set_literary_essay
        if logged_in?
            if @literary_essay.user == current_user
                erb :'/literary_essays/edit'
            else 
                redirect "/users/#{current_user.id}"
            end 
        else 
            redirect'/'
        end
    end 

    patch '/literary_essays/:id' do 
        set_literary_essay
        if logged_in?
            if @literary_essay.user == current_user
                @literary_essay.update({title: params[:title], content: params[:content]})
                redirect "/literary_essays/#{@literary_essay.id}"
            else 
                redirect "users/#{current_user.id}"
            end 
        else 
            redirect '/'
        end
    end 

    delete '/literary_essays/:id' do
        set_literary_essay
        if @literary_essay.user == current_user
            @literary_essay.destroy
            redirect '/literary_essays'
        else 
            redirect '/literary_essays'
        end
    end 

    private
    
    def set_literary_essay
        @literary_essay = LiteraryEssay.find(params[:id])
    end 
end 