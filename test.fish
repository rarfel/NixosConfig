nix flake metadata --json | jq -r '.locks.nodes | to_entries[] | .value.locked | select(.type == "github") | "github:\(.owner)/\(.repo)/\(.rev)"' | sort -u | while read -l flake
    set path (nix flake prefetch $flake --json 2>/dev/null | jq -r '.storePath')
    if test -n "$path"
        set matches (grep -r "xorg\.libXinerama" $path 2>/dev/null)
        if test -n "$matches"
            echo "=== FOUND IN: $flake ==="
            echo $matches
        end
    end
end

