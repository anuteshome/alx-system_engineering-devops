s manifest will allow nginx to use more memory, which may improve performance.
# However, increasing the ULIMIT value can also increase the risk of security vulnerabilities.
# This is because a larger ULIMIT value allows a process to use more memory, which can make it
# more difficult to detect and prevent memory-related attacks.
exec {'replace':
    provider => shell,
    command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
    before   => Exec['restart'],
}

exec {'restart':
    provider => shell,
    command  => 'sudo service nginx restart',
}
