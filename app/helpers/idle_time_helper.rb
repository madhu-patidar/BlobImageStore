module IdleTimeHelper
	def ist(time)
	  time.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')).strftime("%a, %d %b %Y at %H:%M:%S")
	end
end
