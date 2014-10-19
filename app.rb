class ImageOrNot < Sinatra::Application

  options '/' do
    cross_origin
  end

  post '/' do
    cross_origin

    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read
    json is_image: false unless data['url']

    begin
      # get method is more safe than head to get correct content type
      response = Faraday.get data['url']
      content_type = response.headers[:'content-type']

      json is_image: is_image?(content_type)
    rescue Exception
      json is_image: false
    end
  end

private

  def is_image?(content_type)
    content_type and
    content_type.split('/').length == 2 and
    content_type.split('/').first == 'image'
  end

end
