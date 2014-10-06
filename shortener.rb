# shortener.rb

# sinatra project requires sinatra. LDO
require 'sinatra'

# json-spewing web api requires json. LDO
require 'json'

# TODO: figure out something for hitting the root
get '/' do
  'Nothing here yet!'
end

# get an already shortened link, and redirect to it
#
# if no such link exists, an error page will be shown
get '/:code' do
end

# add a new link, return a shortened version
#
# links should be passed in as a query parameter "url", like
#   "?url=amazon.com"
#
# if the link already exists, the extant shortened url will be returned
# if no url is provided (or query is otherwise invalid) it will return a
# link to the root
#
# returns some json such that
#   {success: true, url: "someurl"}
# where url represents the shortened URL, and success representes whether or
# not this url is valid
post '/' do
  content_type :json

  url = params[:url]
  unless url.nil? or url.empty? then
    # save url to database, return shortened link
    {success: true, url: shortened_url}.to_json
  else
    # no save necessary, return link to root
    {success: false, url: ""}.to_json
  end
end
