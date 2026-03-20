Vagrant.configure("2") do |config|

  # Path to your init script
  init_script = "./Shared-Folder/scripts/init-script.sh"

  # K3s-Master-01 node
  config.vm.define "K3s-Master-01" do |vm|
    vm.vm.box = "generic/ubuntu2204"
    vm.vm.hostname = "K3s-Master-01"

    # Attach to k3s network with static IP
    vm.vm.network "private_network", libvirt__network: "k3s", ip: "10.0.1.3"

    # Optional synced folder
    vm.vm.synced_folder "./Shared-Folder", "/home/vagrant/Shared-Folder", type: "nfs", nfs_udp: false, nfs_version: 4

    # Run init script during provisioning
    vm.vm.provision "shell", path: init_script, privileged: true

    vm.vm.provider :libvirt do |vb|
      vb.cpus = 2
      vb.memory = 4096
      vb.default_prefix = ""
    end
  end

  # Worker-01
  config.vm.define "K3s-Worker-01" do |vm|
    vm.vm.box = "generic/ubuntu2204"
    vm.vm.hostname = "K3s-Worker-01"
    vm.vm.network "private_network", libvirt__network: "k3s", ip: "10.0.1.4"

    vm.vm.provision "shell", path: init_script, privileged: true

    vm.vm.provider :libvirt do |vb|
      vb.cpus = 2
      vb.memory = 4096
      vb.default_prefix = ""
    end
  end

  # Worker-02
  config.vm.define "K3s-Worker-02" do |vm|
    vm.vm.box = "generic/ubuntu2204"
    vm.vm.hostname = "K3s-Worker-02"
    vm.vm.network "private_network", libvirt__network: "k3s", ip: "10.0.1.5"

    vm.vm.provision "shell", path: init_script, privileged: true

    vm.vm.provider :libvirt do |vb|
      vb.cpus = 2
      vb.memory = 4096
      vb.default_prefix = ""
    end
  end

end