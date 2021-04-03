module UsersHelper
    def log_structure
      if logged_in?
        link_to 'Log Out', session_path(session[:username]), method: :delete
      else
        link_to 'Log In', new_session_path
      end
    end
  end