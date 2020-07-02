class LiteraryEssay < ActiveRecord::Base
    belongs_to :user

    #def format_time
    #    self.created_at.strftime("%A, %d %b %Y %l:%M %p")
    #end
end
