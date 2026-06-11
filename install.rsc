# Download latest list
/tool fetch url="https://raw.githubusercontent.com/hgolshan/iran-mikrotik-iplist/main/iran_ipv4.rsc" dst-path=iran_ipv4.rsc

# Import list
/import iran_ipv4.rsc

# Create auto-update scheduler (weekly Friday 00:00)
:if ([:len [/system scheduler find name="Update-IR-IP"]] = 0) do={

/system scheduler add \
name=Update-IR-IP \
start-time=00:00:00 \
interval=7d \
on-event="/tool fetch url=\"https://raw.githubusercontent.com/hgolshan/iran-mikrotik-iplist/main/iran_ipv4.rsc\" dst-path=iran_ipv4.rsc; /import iran_ipv4.rsc"

}