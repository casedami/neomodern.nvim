#!/usr/bin/env nu

def main [tag: string] {
    git add -A
    git commit -m $"chore: bump version to ($tag) for release"
    git tag $"($tag)" -m $"($tag)"
    git push --follow-tags
}
