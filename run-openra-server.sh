#!/bin/sh
# example launch script, see https://github.com/OpenRA/OpenRA/wiki/Dedicated for details

# Usage:
#  $ ./launch-dedicated.sh # Launch a dedicated server with default settings
#  $ Mod="d2k" ./launch-dedicated.sh # Launch a dedicated server with default settings but override the Mod
#  Read the file to see which settings you can override

Name="${Name:-"game.rat.la"}"
Mod="${Mod:-"ra"}"
ListenPort="${ListenPort:-"21345"}"
AdvertiseOnline="${AdvertiseOnline:-"True"}"
Password="${Password:-"rana"}"
Map="${Map:-"bc7abe606b21f03ad65a6c331c2ca9167e62ebbd"}" # Countercross
#Map="${Map:-"6b57276597014833fc40299909be39a0d3f2ec17"}" # Ore Gardens

RequireAuthentication="${RequireAuthentication:-"False"}"
ProfileIDBlacklist="${ProfileIDBlacklist:-""}"
ProfileIDWhitelist="${ProfileIDWhitelist:-""}"

EnableSingleplayer="${EnableSingleplayer:-"True"}"
EnableSyncReports="${EnableSyncReports:-"True"}"
EnableGeoIP="${EnableGeoIP:-"True"}"
ShareAnonymizedIPs="${ShareAnonymizedIPs:-"True"}"

#SupportDir="${SupportDir:-""}"

while true; do
#     mono --debug ./OpenRA-Red-Alert-x86_64.AppImage --server Game.Mod="$Mod" \
#     ./OpenRA-Red-Alert-x86_64.AppImage --server Game.Mod="$Mod" \
     ./AppRun --server Game.Mod="$Mod" \
     Server.Name="$Name" \
     Server.ListenPort="$ListenPort" \
     Server.AdvertiseOnline="$AdvertiseOnline" \
     Server.EnableSingleplayer="$EnableSingleplayer" \
     Server.Password="$Password" \
     Server.Map="$Map" \
     Server.GeoIPDatabase="$GeoIPDatabase" \
     Server.RequireAuthentication="$RequireAuthentication" \
     Server.ProfileIDBlacklist="$ProfileIDBlacklist" \
     Server.ProfileIDWhitelist="$ProfileIDWhitelist" \
     Server.EnableSyncReports="$EnableSyncReports" \
     Server.EnableGeoIP="$EnableGeoIP" \
     Server.ShareAnonymizedIPs="$ShareAnonymizedIPs" # \
#     Engine.SupportDir="$SupportDir"
done
