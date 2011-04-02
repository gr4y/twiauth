module TwiAuth
  # oauth client
  class Client
    
    attr_accessor :consumer, :request_token, :access_token, :parser
    
    # we only need to set the site
    # all other configuration is default configuration 
    TWITTER_OAUTH_SPEC = { :site => 'https://api.twitter.com' }
    
    #
    # connect to the twitter api
    #
    #   @client = TwiAuth::Client.new( {:key => @consumer_key, :secret => @consumer_secret})
    #
    def initialize(consumer, options = {})
      raise "options are nil" if options.nil?       
      self.access_token = options[:access_token]      
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
      request(url, options, :get)
    end    
    
    #
    # post something to the api
    #
    def post(url, options = nil)
      request(url, options, :post)
    end
    
    private
    
    #
    # create an oauth consumer
    #
    def connect(key, secret)
      OAuth::Consumer.new(key, secret, TWITTER_OAUTH_SPEC)
    end  
    
    #
    # send an post or get request with the specified options to the given url
    #
    def request(url, options = nil, http_method)
      if http_method.eql?(:post)
        response = get_access_token.post(url, options).body
      elsif http_method.eql?(:get)
        response = get_access_token.get(url).body
      else
        raise "invalid http_method"
      end
      parse_json(response)
    end
    
    #
    # parse the json string into an nice ruby hash
    #
    def parse_json(string)
      Yajl::Parser.parse(string)
    end   
  end
end