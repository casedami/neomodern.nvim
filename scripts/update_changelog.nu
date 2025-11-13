#!/usr/bin/env nu

const HEADER_LINE_COUNT = 4

def pad [arr] {
     $arr
    | prepend ""
}

def increment_version [current_version: string, bump_type: string] {
    let parsed = $current_version | parse --regex '^v?(?P<major>\d+)\.(?P<minor>\d+)\.(?P<patch>\d+)$' | first

    let major = $parsed.major | into int
    let minor = $parsed.minor | into int
    let patch = $parsed.patch | into int

    let new = match $bump_type {
        "major" => { {major: ($major + 1), minor: 0, patch: 0} }
        "minor" => { {major: $major, minor: ($minor + 1), patch: 0} }
        "patch" => { {major: $major, minor: $minor, patch: ($patch + 1)} }
    }

    $"v($new.major).($new.minor).($new.patch)"
}

def git_commits_since_last_tag [tag: string] {
    let range = $"($tag)..HEAD"
    let commits_since_last = (git log $range --pretty=%h»¦«%s»¦«%an»¦«%aD
        | lines
        | split column "»¦«" commit subject name date
        | upsert date {|d| $d.date | into datetime}
        | sort-by date
        | reverse
    )
    $commits_since_last
}

def group_commits_by_type [commits: table, type: string] {
    $commits
    | where subject =~ $type + "(\(.+\))?:"
    | each {|row|
        let parsed = ($row.subject
            | parse --regex '^(?:(?P<type>\w+)?(?:\((?P<scope>[^)]+)\))?: )?(?P<subj>.+)$'
            | first
        )
        let commit_type = $parsed.type | default '' | str trim
        let commit_subj = $parsed.subj | default '' | str trim
        let commit_scope = (
            if ($parsed.scope | is-not-empty) {
                $"\(($parsed.scope)\): "
            } else { "" }
        )
        {
            commit: $row.commit
            type: $commit_type
            scope: $commit_scope
            subj: $commit_subj
        }
    }
}

def format_section [header: string, commits: table] {
    let header = "### " + $header
    let changes = (
        $commits
        | each {|c| $"- ($c.scope)($c.subj) [($c.commit)]" }
        | pad $in
        | flatten
    )
    pad [$header, $changes] | flatten | str join "\n"
}

def format_tag_header [tag] {
    let date = (date now | format date "%Y-%m-%d")
    pad [$"## ($tag) - ($date)"]
}

def main [bump_type: string = "patch"] {
    let last_tag = (
        git describe --tags --abbrev=0
        | complete
        | if $in.exit_code == 0 {
            $"($in.stdout | str trim)"
        } else {
            "HEAD"
        }
    )

    let log = git_commits_since_last_tag $last_tag

    let new_tag = increment_version $last_tag $bump_type
    let tag_hdr = format_tag_header $new_tag
    mut section = [$tag_hdr]

    let feats = group_commits_by_type $log "feat"
    if ($feats | length) > 0 {
        let feats_fmt = format_section "Changes" $feats
        $section = $section | append $feats_fmt
    }
    let fixes = group_commits_by_type $log "fix"
    if ($fixes | length) > 0 {
        let fixes_fmt = format_section "Fixes" $fixes
        $section = $section | append $fixes_fmt
    }

    let section = $section | flatten
    let changelog = open CHANGELOG.md | lines
    let changelog_header = $changelog | take $HEADER_LINE_COUNT
    let prevlog = $changelog | skip $HEADER_LINE_COUNT

    $changelog_header
    | append $section
    | append $prevlog
    | str join "\n"
    | save -f CHANGELOG.md

    print $"Bumped to version ($new_tag)"
}
