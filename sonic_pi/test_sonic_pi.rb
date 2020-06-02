# Welcome to Sonic Pi

live_loop :flibble do
  sample :ambi_drone, rate: 0.3
  # sample :bd_haus, rate: 1
  # play 75
  sleep 1
end

live_loop :second do
  sample :bass_thick_c
  sleep 0.5
end

i = 50
live_loop :third do
  synth :dark_ambience
  play i
  # i = i + 1
  sleep 0.25
end

live_loop :guit do
  with_fx :echo, mix: 0.3, phase: 0.25 do
    sample :guit_em9, rate: 0.5
  end
  #  sample :guit_em9, rate: -0.5
  sleep 8
end

n = 60
live_loop :piano do
  with_fx :echo, mix: 0.3, phase: 0.25 do
    synth :growl
    play n
  end
  sleep 4
end

live_loop :haunted do
  sample :perc_bell, rate: rrand(-1.5,1.5)
  sleep rrand(0.1, 2)
end


