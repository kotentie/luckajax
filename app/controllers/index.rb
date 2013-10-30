get '/' do
  erb :index
end


# TODO: convert this route to use AJAX
post '/rolls' do
  # If the user passes-in a "value", let's use it. Otherwise, we'll generate a random one.
  # See: roll_if_value_is_nil method in the Roll model.
  puts params.inspect
  value = params[:value] ? params[:value].to_i : nil


  @roll = value ? Roll.create({ value: value }) : Roll.create

    # If there's an AJAX request, do something
    if request.xhr?
      erb :_partial, layout: false
    else
      erb :index  # HINT: what does this do? what should we do instead?
    end

end
