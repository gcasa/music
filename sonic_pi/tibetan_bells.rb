# My best imitation of tibetan bells...

live_loop :tibetan_bells do
  sample :perc_bell, rate: rrand(0.0,1.0)
  sleep rrand(0.1, 4)
end

live_loop :tibetan_bells2 do
  sample :perc_bell, rate: rrand(0.0,0.25)
  sleep rrand(0.1, 8)
end