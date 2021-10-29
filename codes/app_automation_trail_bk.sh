

authenticate() {
	readonly RESPONSE=$(curl -s -v -X POST \
	-H 'Accept: application/json' \
	-H 'Content-Type: application/json' \
	-d "{
		\"username\": \"$1\",
		\"password\": \"$2\"
	}" "$(eval 'echo $BASE_AUTH_URL')" 2>&1)
	echo -e "status_code\t$(echo "$RESPONSE" | sed -nr "s/.*\"status_code\": ([0-9]+),.*/\1/p")"
	echo -e "status\t\t$(echo "$RESPONSE" | sed -nr "s/.*\"status\": \"([^\"]+)\",.*/\1/p")"
	echo -e "msg\t\t$(echo "$RESPONSE" | sed -nr "s/.*\"msg\": \"([^\"]+)\",.*/\1/p")"
	echo -e "sid\t\t$(echo "$RESPONSE" | sed -nr "s/.*set-cookie: sid=([^;]+);.*/\1/p")"
	echo -e "SSOID\t\t$(echo "$RESPONSE" | sed -nr "s/.*\"ssoid_cookie\": \"([^\"]+)\",.*/\1/p")"
}





