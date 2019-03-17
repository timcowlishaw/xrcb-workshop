p "RESTARTING"
loop do
	args  = get "/osc/xrcb/ldr"
	p args
	sleep 0.1
end
