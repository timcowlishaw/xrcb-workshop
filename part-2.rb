def part2(sensor)
  notes = [39, 42, 46].map { |x| x + 12  * 4}
  play(notes.choose,
       release: 0.2,
       amp: rand * 0.5,
       divisor: 6,
       depth: 0.5,
       cutoff: sensor
      )
  sleep rand * 0.2
end


live_loop :part2 do
  use_real_time
  use_synth :fm 
  sensor = sync "/xrcb/ldr"
  with_fx :reverb, mix: 0.2 do
    with_fx :echo do
      part2(sensor)
    end
  end
end
