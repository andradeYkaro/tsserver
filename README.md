
# TeamSpeak Server on AWS

## Overview

This project sets up a dedicated TeamSpeak server on an AWS EC2 instance, providing a voice communication environment for gaming with friends.

## Features

- Dedicated voice server for gaming
- Configurable server settings
- Secure access with password protection
- Easy to set up and manage on AWS

## Requirements

- AWS account
- SSH key pair (PEM file)
- SSH client (e.g., Terminal, PuTTY)
- TeamSpeak client

## Getting Started

### 1. Creating an EC2 Instance

1. Log in to the [AWS Management Console](https://aws.amazon.com/).
2. Navigate to **EC2** and launch a new instance using Amazon Linux 2 AMI.
3. Configure the instance:
   - Instance Type: t2.micro (Free Tier eligible)
   - Create or select a key pair (PEM file).
   - Configure a **Security Group** with the following open ports:
     - **9987 UDP** (Voice)
     - **10011 TCP** (Query)
     - **30033 TCP** (File Transfer)
4. Launch the instance and note the **Public IP**.

### 2. Connecting via SSH

1. Connect to your EC2 instance using SSH:
   ```bash
   ssh -i /path/to/your/key.pem ec2-user@your-public-ip
   ```

### 3. Installing and Configuring TeamSpeak

1. Download and extract the TeamSpeak server:
   ```bash
   wget https://files.teamspeak-services.com/releases/server/3.13.7/teamspeak3-server_linux_amd64-3.13.7.tar.bz2
   tar xvf teamspeak3-server_linux_amd64-3.13.7.tar.bz2
   cd teamspeak3-server_linux_amd64
   ```

2. Start the TeamSpeak server:
   ```bash
   ./ts3server_startscript.sh start &
   ```

3. Note the admin token generated in the terminal.

### 4. Configuring the TeamSpeak Server

1. Connect to the server using the TeamSpeak client and the **Public IP** of your EC2 instance.
2. Use the admin token to gain administrative permissions.
3. Set a password for the server under **Edit Virtual Server** > **Security** > **Server Password**.

### 5. Testing and Conclusion

1. Share the **Public IP** and **password** with friends for connection.
2. Test the connection and stability of the server.

## Additional Notes

- Keep the server updated for security and performance.
- Consider using an Elastic IP to ensure the public IP remains static after instance restarts.
- For persistent server operation without an active SSH session, consider using `nohup` or `tmux`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to TeamSpeak for providing the server software.
- Thanks to AWS for offering cloud services.