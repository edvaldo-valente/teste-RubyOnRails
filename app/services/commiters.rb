class Commiters
    include HTTParty 
    base_uri 'https://api.github.com'

    def initialize()
        headers = { Authorization: "token 623c4faf273b0f15619f10219eabfdb477077802" }
        query = {}   #   @options = { query: {site: service, page: page} }
        
        @options = { query: query, header: headers }
    end

    def user
        self.class.get("/users/edvaldo-valente", @options )
    end

end