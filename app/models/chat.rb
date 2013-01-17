require 'digest/md5'
require 'uuid'
include Rack::Utils
class Chat < ActiveRecord::Base
  
	def initialize(activity_type, action_text, options)
    
    	@options = set_default_options(options)
      
    	@type = activity_type
    	@id = UUID.new.generate
    	@date = Time.now.to_s()
    
    	@action_text = action_text;
    	@display_name = options["displayName"]
    	@image = options['image'];
    
    	if( options['get_gravatar'] &&
        	options['email'] )
         @image["url"] = get_gravatar(options['email'])
    end
  end
end
