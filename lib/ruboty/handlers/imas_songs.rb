require "ruboty"
require "ruboty/imas_songs/actions/imas_songs"
module Ruboty
  module Handlers
    # returns im@s songs.
    class ImasSongs < Base
      on /imas songs\z/, name: 'imas_songs', description: 'returns imas songs at random'
      env :IMAS_SONGS_NUM, "number of songs to return"

      def imas_songs(message)
        Ruboty::ImasSongs::Actions::ImasSongs.new(message).call
      end
    end
  end
end
