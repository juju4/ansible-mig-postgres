#!/usr/bin/env bats

setup() {
    apt-get install -y curl >/dev/null || yum -y install curl >/dev/null
}

@test "process postgres should be running" {
    run pgrep postgres
    [ "$status" -eq 0 ]
    [[ "$output" != "" ]]
}

