class WelcomeController < ApplicationController
  layout :choose_layout
  
  def index
  end

  def about
  end

  def contact
  end

  # GET /works
  # GET /works.json
  def admin
  	@works = Work.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @works }
    end
  end
  def choose_layout
     if action_name == 'index' 
       return 'welcome'
     else
       return 'admin'
     end
   end
end
