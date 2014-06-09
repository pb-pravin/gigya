module Gigya
  module Utils
    def self.build_signature_params(client_id, client_secret, base_url, query)
      timestamp      = Time.now.gmtime.to_i
      nonce          = CGI.escape("#{rand(0..10)}#{timestamp}")

      query          = CGI.escape(query).gsub('+', '%20')
      escaped_url    = CGI.escape(base_url)

      decoded_secret = Base64.decode64(client_secret)

      params = { apiKey: CGI.escape(client_id), nonce: nonce, query: query, timestamp: timestamp }

      query_string = CGI.escape(build_query_string(params))

      base_string = "POST&#{escaped_url}&#{query_string}"

      hmac_sha1 = HMAC::SHA1.digest(decoded_secret, base_string)
      signature = Base64.encode64(hmac_sha1).chomp.gsub(/\n/,'')

      params.merge!(sig: signature)
    end

    private

    def self.build_query_string(hash)
      hash.to_a.map { |e| "#{e[0]}=#{e[1]}" }.join('&')
    end
  end
end
