# Jenkins with Github webhook (auto deployment)

## Set ssh key up for deployment on Jenkins with Github.
- Connect to Server(root account or an account authorized as root).

    ```
    $ ssh my_account@my_host
    ```

- Log on as jenkins account

    ```
    $ sudo su - jenkins
    $ cd .ssh
    ```

- Create ssh key.
    
    ```
    $ ssh-keygen -t rsa -b 4096 -C “my_project_name"
    Enter a file in which to save the key (/var/lib/jenkins/.ssh/id_rsa): /var/lib/jenkins/.ssh/deploy_key
    Enter passphrase (empty for no passphrase): [Type enter]
    Enter same passphrase again: [Type enter]
    ```

- Add ssh key to your github project setting > Deploy keys.

    ```
    $ cat /var/lib/jenkins/.ssh/deploy_key.pub
    ```

- Configure ssh for just deployment.
    
    ```
    $ vi config
    Host github-deploy-myproject
        HostName       github.com
        User           git
        IdentityFile   /var/lib/jenkins/.ssh/deploy_key
        IdentitiesOnly yes
    ```

- Add github RSA key to known host list.

    ```
    $ git -c core.askpass=true ls-remote -h github-deploy-myproject:myuser/myproject
    The authenticity of host 'github.com (...)' can't be established.
    RSA key fingerprint is ...
    Are you sure you want to continue connecting (yes/no)? [Type yes]
    ```

## References
- [Installing Jenkins on Ubuntu](https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu)
- [Generating an ssh key](https://help.github.com/articles/generating-an-ssh-key/)

