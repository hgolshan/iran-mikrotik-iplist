# Iran MikroTik GeoIP Installer

:local url "https://raw.githubusercontent.com/hgolshan/iran-mikrotik-iplist/main/iran_ipv4.rsc"

:log info "Installing Iran GeoIP..."

# Remove any leftover temporary file

:if ([:len [/file find where name="iran_ipv4_new.rsc"]] > 0) do={
/file remove iran_ipv4_new.rsc
}

# Download latest file

/tool fetch url=$url dst-path=iran_ipv4_new.rsc check-certificate=yes

:delay 2

# Verify download succeeded

:if ([:len [/file find where name="iran_ipv4_new.rsc"]] > 0) do={

# Replace old file

:if ([:len [/file find where name="iran_ipv4.rsc"]] > 0) do={
    /file remove iran_ipv4.rsc
}

/file set iran_ipv4_new.rsc name=iran_ipv4.rsc

# Import

/import iran_ipv4.rsc

:log info "Iran GeoIP imported."

} else={

:log error "Failed to download iran_ipv4.rsc"

}

# Create scheduler if missing

:if ([:len [/system scheduler find where name="Update-IR-IP"]] = 0) do={

/system scheduler add \
    name="Update-IR-IP" \
    interval=7d \
    start-time=00:00:00 \
    on-event=":if ([:len [/file find where name=\"iran_ipv4_new.rsc\"]] > 0) do={/file remove iran_ipv4_new.rsc}; /tool fetch url=https://raw.githubusercontent.com/hgolshan/iran-mikrotik-iplist/main/iran_ipv4.rsc dst-path=iran_ipv4_new.rsc check-certificate=yes; :delay 2; :if ([:len [/file find where name=\"iran_ipv4_new.rsc\"]] > 0) do={:if ([:len [/file find where name=\"iran_ipv4.rsc\"]] > 0) do={/file remove iran_ipv4.rsc}; /file set iran_ipv4_new.rsc name=iran_ipv4.rsc; /import iran_ipv4.rsc}"

:log info "Update scheduler created."

}
