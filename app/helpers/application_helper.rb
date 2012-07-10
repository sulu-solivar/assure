module ApplicationHelper

	def beautify_params key, value = nil, key_width = 200, opts = {}
		if value
			contents = content_tag(
					'b', key, :class => "fl #{opts[:key_class]}", :style => "width:#{key_width}px; #{opts[:key_style]}"
				) + content_tag(
					'div', value, :class => "light_text #{opts[:value_class]}", :style => "margin-left:#{key_width+10}px;  #{opts[:value_style]}"
				)
			
			return content_tag( 
				'div', contents, :class => 'beautify_params'
			)
		end
	end

	def image_radius size = 5
		"-webkit-border-radius: #{size}px; -moz-border-radius: #{size}px; border-radius: #{size}px;"
	end

	def link_user user = nil, opts = {}
		if user
			link_to user.name, user_path(user.id), opts
		end
	end

	def user_image user, opts = {}
		if user
			get_width = opts[:width].presence ? "#{opts[:width]}px" : "100px"
			if user.image 
				image_tag( user.image, opts.merge( :style => "#{ image_radius(0) }", :width => get_width ) ) 
			else
				content_tag('div', '', opts.merge( :style => "#{ image_radius(0) }", :width => get_width, :class => 'default_profile_pic' ) )
			end
		end
	end

	def labeled_radio id, name, value, width = 100, toggle_type = "", label_id = nil
		input = raw("<input type='radio' name='#{name}' value='#{value}' class='mll fl' id='#{id}' />")
		span = content_tag 'span', value.capitalize, :class => 'mls fl'
		clearfix = content_tag 'div', ' ', :class => 'clearfix'
		
		content_tag 'label', input + span + clearfix, :for => id, :class => "radio_label #{toggle_type}", :style => "width: #{width}px;", :id => label_id
	end
	
	def pull_large_fb_pic image_url
		image_url.split('?')[0]+'?type=large'
	end

	def fb_profile
		if current_user.authentications.find_by_provider('facebook')
			return 'http://facebook.com/profile.php?id=' + current_user.authentications.find_by_provider('facebook').uid
		else
			return '#'
		end
	end

	def full_name user
		if user
			user.first_name + " " + user.last_name
		end
	end

	def in_place object, field, opts = {}
		if field.presence
			content_mid = content_tag 'span', field, :class => 'in_place_edit', :id => opts[:id]
		else
			content_mid = content_tag 'span', opts[:default], :class => 'in_place_edit', :id => opts[:id]
		end

		content_before = content_tag 'span', opts[:before] if opts[:before].presence
		content_after = content_tag 'span', opts[:after] if opts[:after].presence

		return content_before.presence ? (content_before + content_mid + content_after) : (content_mid + content_after)
	end

	def black_score_box smiley, score = 0
		text_content =  content_tag 'span', "+#{score}", :class => 'mls fb'
		smiley_content =  content_tag 'span', '', :class => "#{smiley} fr", :style => 'margin: 3px;'

		content_tag 'div', text_content + smiley_content, :class => 'black_box'
	end

	def placeholder width, height, opts = {}
		image_tag "http://placehold.it/#{width}x#{height}", opts
	end

end