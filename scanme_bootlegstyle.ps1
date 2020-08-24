# Example of how to quickly scan for specific open ports

# For loop for scanning a max of 20 IPs in a given range
for ($ip = 1; $ip -lt 20; $ip++) {

    # variable to store the IP range
    $ipaddr = "10.0.1.$ip"

    # writing the progress to screen to show which IP is being scanned
    Write-Progress "Scanning $ipaddr"

    # set up new connection for a given IP address on port 8080
    $client = New-Object System.Net.Sockets.TcpClient
    $connection = $client.BeginConnect($ipaddr, "8080", $null, $null)

    # wait variable so we don't wait on slow connections
    $wait = $connection.AsyncWaitHandle.WaitOne("300", $false)

    # if statement to signify open or closed connection
    if(!$wait) {

        # no connection made so let's close and write out that this is blah
        $client.Close()
        Write-Output "Port 8080 is NOT open on $ipaddr...meh"

    }
    else {

        if ($client.Connected) {
            
            # connection successful so let's say it loud, say it proud
            Write-Output "Port 8080 is open on $ipaddr!"

        }

        # let's close this successful connection
        $client.EndConnect($connection)

    }

    # close that connection frand
    $client.Close()

}