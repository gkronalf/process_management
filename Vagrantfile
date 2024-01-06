Vagrant.configure("2") do |srv|
   srv.vm.box = "bento/ubuntu-22.04"
  
   srv.vm.provider "virtualbox" do |i|
    i.name = "server"
    i.memory = "2048"
    i.cpus = 2
   end
   srv.vm.provision :file, source: './scripts/', destination: '/home/vagrant/'
   srv.vm.provision "shell", inline: <<-SHELL
         echo "to test the script, run the commands: vagrant up and while in the virtual machine console, source ./scripts/my_lsof.sh"
        SHELL
  srv.vm.synced_folder '.', '/vagrant', disabled: true
  end