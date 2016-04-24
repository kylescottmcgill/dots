#!/bin/bash

function generate-password {
	openssl rand -base64 ${1:-8}
}

function checkip {
	curl -s http://checkip.amazonaws.com/
}

function openssl-connect {
	openssl s_client -connect $1:443 -tls1_2
}

function digs {
	dig +noall +answer $@
}

function curlt {
	# curl wrapper returning timing information.
	#
	# curl format adapted from
	#  http://josephscott.org/archives/2011/10/timing-details-with-curl/
	#
	# Example usage:
	#   $ curlt http://www.apple.com
	#   $ time curlt http://www.apple.com -v

	set -e

	curl_format='{
	 "time_namelookup": %{time_namelookup},
	 "time_connect": %{time_connect},
	 "time_appconnect": %{time_appconnect},
	 "time_pretransfer": %{time_pretransfer},
	 "time_redirect": %{time_redirect},
	 "time_starttransfer": %{time_starttransfer},
	 "time_total": %{time_total},
	 "size_rquest": %{size_request},
	 "size_download": %{size_download}
	}
	'

	exec curl -w "$curl_format" -o /dev/null -s "$@"
}
