# Ambient Experiment

# Coded by Darin Wilson
#
# The piece consists of three long loops, each of which
# plays one of two randomly selected pitches. Each note
# has different attack, release and sleep values, so that
# they move in and out of phase with each other. This can
# play for quite awhile without repeating itself :)

use_synth :hollow
with_fx :reverb, mix: 0.7 do
  
  live_loop :note1 do
    play choose([:D2,:E2]), attack: 6, release: 6
    sleep 8
  end
  
  live_loop :note1 do
    play choose([:D3,:E3]), attack: 6, release: 6
    sleep 8
  end
  
  live_loop :note1a do
    play choose([:D4,:E4]), attack: 6, release: 6
    sleep 8
  end
  
  live_loop :note2 do
    play choose([:Fs3,:G3]), attack: 4, release: 5
    sleep 10
  end
  
  live_loop :note3 do
    play choose([:A3, :Cs4]), attack: 5, release: 5
    sleep 11
  end
  
end


