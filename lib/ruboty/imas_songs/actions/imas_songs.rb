require 'nokogiri'
require 'open-uri'
require 'unicode'

module Ruboty
  module ImasSongs
    module Actions
      class ImasSongs < Ruboty::Actions::Base
        URL ='http://imas-db.jp/song/detail/'

        def call
          text = search.sample(ENV['IMAS_SONGS_NUM'].to_i).join("\n")
          message.reply(text)
        end

        private

        def search(keyword="")
          html = open(URL).read
          doc = Nokogiri::HTML.parse(html)
          songs = doc.css('div.section > ul > li').map(&:text).to_a
          songs.select do |song|
            Unicode::nfkc(song).include?  Unicode::nfkc(keyword)
          end
        end
      end
    end
  end
end

