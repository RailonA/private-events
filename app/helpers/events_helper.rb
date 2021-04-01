module EventsHelper
    def navbar_current_user_link
        link_to current_user.username, edit_user_registration_path, class: 'text-white nav-item nav-link' if user_signed_in?
      end
    
      def navbar_user_new_post
        link_to 'New Post', root_path, class: 'text-white nav-item nav-link' if user_signed_in?
      end
    
      def navbar_user_logout
        if user_signed_in?
          link_to 'Logout', destroy_user_session_path, method: :delete, class: 'text-white nav-item nav-link'
        end
      end
    
      def navbar_user_sign_up
        link_to 'Sign Up', new_user_session_path, class: 'text-white nav-item nav-link' unless user_signed_in?
      end
    
      def navbar_user_sign_in
        link_to 'Sign In', new_user_session_path, class: 'text-white nav-item nav-link' unless user_signed_in?
      end
    
      def current_user_link
        link_to current_user.username, edit_user_registration_path, class: 'button is-info' if user_signed_in?
      end
    
      def user_new_post
        link_to 'New Post', root_path, class: 'button is-info ' if user_signed_in?
      end
    
      def user_logout
        link_to 'Logout', destroy_user_session_path, method: :delete, class: 'button is-info' if user_signed_in?
      end
    
      def user_sign_up
        link_to 'Sign Up', new_user_registration_path, class: 'button is_info' unless user_signed_in?
      end
    
      def user_sign_in
        link_to 'Sign In', new_user_session_path, class: 'button is_info' unless user_signed_in?
      end
    

end
