
file` parameter in the `/etc/security/limits.conf` file specifies the maximum
# number of open files that a user can have. The first command in the instruction
# increases the value of `nofile` to 50000, while the second command decreases it to 40000.
exec {'run_first':
    provider => shell,
    command  => 'sudo sed -i "s/nofile 5/nofile 50000/" /etc/security/limits.conf',
    before   => Exec['run_second'],
}

exec {'run_second':
    provider => shell,
    command  => 'sudo sed -i "s/nofile 4/nofile 40000/"  /etc/security/limits.conf',
}
