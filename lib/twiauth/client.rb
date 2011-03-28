module TwiAuth
  # oauth client
  class Client
    
    attr_accessor :consumer, :request_token, :access_token
    
    # we only need to set the site
    # all other configuration is default configuration 
    TWITTER_OAUTH_SPEC = { :site => 'https://api.twitter.com' }
    
    #
    # connect to the twitter api
    #
    #   @client = TwiAuth::Client.new( {:key => @consumer_key, :secret => @consumer_secret})
    #
    def initialize(consumer, options = {})
      # raise "options are nil" if options.nil?       
      self.access_token = nil # options[:access_token]      
      if self.access_token.nil?
        raise "consumer could not be nil!" if consumer.nil?
        self.consumer = connect(consumer['key'], consumer['secret'])
      end
    end

    def get_request_token
      if self.request_token.nil?
        self.request_token = self.consumer.get_request_token
      end
      self.request_token      
    end
      
    #
    # get access token
    #
    def get_access_token(pin = nil)
      if self.access_token.nil?
        self.access_token = self.request_token.get_access_token(:oauth_verifier => pin)
      end
      self.access_token
    end

    #
    # get something from the api
    # 
    def get(url, options = nil)
      get_access_token.get(url).body
    end    
    
    #
    # post something to the api
    #
    def post(url, options = nil)
      get_access_token.get(path, options).body
    end
    
    private
    
    #
    # create an oauth consumer
    #
    def connect(key, secret)
      OAuth::Consumer.new(key, secret, TWITTER_OAUTH_SPEC)
    end  
  end
end