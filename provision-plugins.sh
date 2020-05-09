#!/bin/bash

log() {
    echo "[provision] $1"
}

is_xml() {
    file "$1" | grep "XML" > /dev/null 2>&1
}

download() {
    if [ ! -f  "$2" ]; then
        log "Downloading '$1' to '$2'..."
        curl --silent "$1" --output "$2"

        if [[ $? -ne 0 ]]; then
            log "Failed downloading '$2'. Removing file."
            rm "$2"
        fi

        is_xml "$2"

        if [[ $? = 0 ]]; then
            log "404 error when downloading '$2'. Removing file."
            rm "$2"
        fi
    else
        log "Skipping downloading '$2' because it already exists"
    fi
}

mod_download() {
    download "$1" "/data/mods/$2"
}

##
# Download mods from Curse Forge
# Pass the mod ID then the file name
forge_download() {
    local id1 id2 filename
    id1="${1:0:4}"
    id2="${1:4}"
    filename="$2"
    mod_download "https://media.forgecdn.net/files/$id1/$id2/$filename" "$filename"
}

# Grab the Vivecraft Forge Extensions to enable animations
mod_download https://owncloud.techjargaming.com/index.php/s/RsnyWmdN8OeJEI4/download\?path\=%2F\&files\=VivecraftForgeExtensions-1.12.2-0.2.4.13.jar VivecraftForgeExtensions-1.12.2-0.2.4.13.jar

# Download plugins (not sure if all of these are needed server-side)
forge_download 2704186 llibrary-1.7.19-1.12.2.jar
forge_download 2950203 LibraryEx-1.12.2-1.1.3.jar
forge_download 2820815 OreLib-1.12.2-3.6.0.1.jar
forge_download 2835526 "OpenTerrainGenerator-1.12.2+-+v8.3.jar"
forge_download 2505277 Biome_Bundle-1.12.2-v6.1.jar
forge_download 2486111 OTG-Skylands-1.12.2-v5.jar
forge_download 2486113 OTG-Void-1.12.2-v4.jar
forge_download 2486112 OTG-Flatlands-1.12.2-v4.jar
forge_download 2950205 NetherEx-1.12.2-2.1.6.jar
forge_download 2697165 Plants-1.12.2-2.10.7.jar
forge_download 2492586 RoguelikeDungeons-1.12.2-1.8.0.jar
forge_download 2680892 malisiscore-1.12.2-6.5.1.jar
forge_download 2526674 malisisdoors-1.12.2-7.3.0.jar
forge_download 2699705 mowziesmobs-1.5.4.jar
forge_download 2922489 DynamicSurroundings-1.12.2-3.6.1.0.jar
forge_download 2803400 jei_1.12.2-4.15.0.291.jar
forge_download 2744766 gravestone-1.10.3.jar
forge_download 2859589 Waystones_1.12.2-4.1.0.jar
forge_download 2876841 tumbleweed-1.12-0.4.7.jar
forge_download 2850758 TrashSlot_1.14.4-10.4.8.jar
mod_download "https://media.forgecdn.net/files/2855/805/%5b1.12.2%5d+SecurityCraft+v1.8.15.jar" "1.12.2+SecurityCraft+v1.8.12.1.jar"
forge_download 2630384 RealisticItemDrops-1.2.14.jar # Not sure if this is actually in the pack
forge_download 2496585 AppleSkin-mc1.12-1.0.9.jar
forge_download 2720655 chiselsandbits-14.33.jar
forge_download 2821822 ProgressiveBosses-1.5.4-mc1.12.x.jar
forge_download 2469364 QuickLeafDecay-MC1.12.1-1.2.4.jar
forge_download 2589515 Costumes-1.12.2.jar
mod_download "https://media.forgecdn.net/files/2691/84/BetterBuildersWands-1.12.2-0.13.2.271%2B5997513.jar" "BetterBuildersWands-1.12.2-0.13.2.271+5997513.jar"
mod_download "https://media.forgecdn.net/files/2641/852/Exotic+Birds+1.12.2-2.2.1.jar" "Exotic Birds 1.12.2-2.2.1.jar"
