#!/bin/bash
# https://github.com/boot1110001/my-ora-dedicated-srv/blob/master/run-openra-srv.sh
# example launch script based in: https://github.com/OpenRA/OpenRA/wiki/Dedicated for details

# Usage:
#  $ ./run-openra-srv.sh # Launch a dedicated server with default settings
#  $ Mod="d2k" ./run-openra-srv.sh # Launch a dedicated server with default settings but override the Mod
#  Read the file to see which settings you can override

source password.txt

Mod="${Mod:-"ra"}"

Name="${Name:-"game.rat.la"}" # Sets the server name.
ListenPort="${ListenPort:-"21345"}" # Sets the internal port.
AdvertiseOnline="${AdvertiseOnline:-"True"}" # Reports the game to the master server list.
Password="${Password:-"$PASSWORD"}" # Locks the game with a password.
DiscoverNatDevices="${DiscoverNatDevices:-"False"}" # Allow users to enable NAT discovery for external IP detection and automatic port forwarding. (default: False)
NatDiscoveryTimeout="${NatDiscoveryTimeout:-"1000"}" # Time in milliseconds to search for UPnP enabled NAT devices. (default: 1000)
Map="${Map:-"bc7abe606b21f03ad65a6c331c2ca9167e62ebbd"}" # Countercross, Starts the game with a default map. Input as hash that can be obtained by the utility.
#Map="${Map:-"6b57276597014833fc40299909be39a0d3f2ec17"}" # Ore Gardens, Starts the game with a default map. Input as hash that can be obtained by the utility.

Ban="${Ban:-""}" # Takes a comma separated list of IP addresses that are not allowed to join.
RequireAuthentication="${RequireAuthentication:-"False"}" # For dedicated servers only, allow anonymous clients to join. (default: False)
ProfileIDBlacklist="${ProfileIDBlacklist:-""}" # For dedicated servers only, if non-empty, only allow authenticated players with these profile IDs to join.
ProfileIDWhitelist="${ProfileIDWhitelist:-""}" # For dedicated servers only, if non-empty, always reject players with these user IDs from joining.

EnableSingleplayer="${EnableSingleplayer:-"True"}" # For dedicated servers only, controls whether a game can be started with just one human player in the lobby. (default: False)
QueryMapRepository="${QueryMapRepository:-"True"}" # Query map information from the Resource Center if they are not available locally. (default: True)
EnableSyncReports="${EnableSyncReports:-"True"}" # Enable client-side report generation to help debug desync errors. (default: False)
TimestampFormat="${TimestampFormat:-"yyyy-MM-ddTHH:mm:ss"}" # Sets the timestamp format. Defaults to the ISO 8601 standard. (default: yyyy-MM-ddTHH:mm:ss)

EnableGeoIP="${EnableGeoIP:-"True"}"
ShareAnonymizedIPs="${ShareAnonymizedIPs:-"True"}"

#SupportDir="${SupportDir:-""}" # Different directory to store server logs.

while true; do
#     mono --debug ./OpenRA-Red-Alert-x86_64.AppImage --server Game.Mod="$Mod" \
#     ./OpenRA-Red-Alert-x86_64.AppImage --server Game.Mod="$Mod" \
     ./AppRun --server Game.Mod="$Mod" \
     Server.Name="$Name" \
     Server.ListenPort="$ListenPort" \
     Server.AdvertiseOnline="$AdvertiseOnline" \
     Server.Password="$Password" \
     Server.DiscoverNatDevices="$DiscoverNatDevices" \
     Server.Map="$Map" \
     Server.Ban="$Ban" \
     Server.RequireAuthentication="$RequireAuthentication" \
     Server.ProfileIDBlacklist="$ProfileIDBlacklist" \
     Server.ProfileIDWhitelist="$ProfileIDWhitelist" \
     Server.EnableSingleplayer="$EnableSingleplayer" \
     Server.QueryMapRepository="$QueryMapRepository" \
     Server.EnableSyncReports="$EnableSyncReports" \
     Server.TimestampFormat="$TimestampFormat" \
     Server.EnableGeoIP="$EnableGeoIP" \
     Server.ShareAnonymizedIPs="$ShareAnonymizedIPs" # \
#     Server.GeoIPDatabase="$GeoIPDatabase" \
#     Engine.SupportDir="$SupportDir"
done
