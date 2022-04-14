module Enigma
  module Encoder
    
    def self.encode_password(pw)
      Digest::SHA1.hexdigest(salted_string(pw))
    end
    
    def self.salted_string(str)
      arr = ["a","b","c","d","e","f"]
      str_arr = str.chars[0..5]
      str_arr2 = str.chars[6..]
      answer = str_arr.zip(arr).join
      "z#{answer}#{str_arr2}y"
    end
    
  end
end