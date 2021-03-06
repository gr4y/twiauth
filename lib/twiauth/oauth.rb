module TwiAuth
  # oauth communication wrapper
  class OAuth
    TWITTER_OAUTH_SPEC = {
            :site => 'https://api.twitter.com',
            :request_token_path => '/oauth/request_token',
            :access_token_path => '/oauth/access_token',
            :authorize_path => '/oauth/authorize'
    }

    # key for access token
    ACCESS_TOKEN = 'ACCESS_TOKEN'

    public
    def initialize(key, secret)
      @store = TwiAuth::Store.new
      @oauth_consumer = ::OAuth::Consumer.new(key, secret, TWITTER_OAUTH_SPEC)
      get_access_token
    end

    def get(path)
      @access_token.get(path)
    end

    def post(path, body = nil)
      @access_token.post(path, body)
    end

    def drop_access_token
      @store.delete(ACCESS_TOKEN)
    end

    private
    def get_request_token
      @oauth_consumer.get_request_token
    end

    def get_access_token
      pull_access_token
      if @access_token.nil?
        get_initial_access_token
      end
    end

    def get_initial_access_token
      request_token = get_request_token
      puts "point your browser to \"#{request_token.authorize_url}\" and enter the pin: "
      pin = STDIN.readline.chomp!

      if pin.nil? || pin.empty?
        raise Error
      end

      @access_token = request_token.get_access_token(:oauth_verifier => pin)
      persist_access_token
    end

    def pull_access_token
      @access_token = @store.get(ACCESS_TOKEN)
    end

    def persist_access_token
      @store.put(ACCESS_TOKEN,@access_token)
    end

  end
end