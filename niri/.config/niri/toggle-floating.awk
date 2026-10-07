#!/usr/bin/gawk -f
# usage: gawk -i inplace -v appid=app -f toggle.awk config.kdl
BEGIN {
	rule="^\\s*match app-id=\"" appid "\"\\s*$";
}

/^\s*window-rule\s*{$/ {
	in_rule=1
} 

/^\s*}\s*$/ {
	if(in_rule){
		if(removed!=1) {
			print "    match app-id=\"" appid "\""
			msg="floating"
		}else{
			msg="tiled"
		}
		system("notify-send \"Set window behaviour\" \"App '" appid "' :\nOpen " msg "\"" )
	}
	in_rule=0
	print "}"
}

//{
	if(in_rule){
		if($0 ~ rule) {
			removed=1
		}else {
			print
		}
	}
}