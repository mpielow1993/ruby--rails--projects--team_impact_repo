class ApplicationController < ActionController::Base
    
    def hello
        render html: 'Welcome to Team Impact'
    end
end
